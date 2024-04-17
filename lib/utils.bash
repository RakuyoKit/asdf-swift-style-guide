#!/usr/bin/env bash

set -euo pipefail

SOURCES_REPO_NAME="RakuyoKit/swift"
TOOL_NAME="swift-style-guide"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	RELEASES_URL="https://api.github.com/repos/${SOURCES_REPO_NAME}/releases"

	curl_cmd="curl -s"
	if [ -n "${GITHUB_API_TOKEN:-}" ]; then
		curl_cmd="$curl_cmd -H \"Authorization: token $GITHUB_API_TOKEN\""
	fi

	# Fetch list of releases and get names of each release tag
	eval "$curl_cmd $RELEASES_URL" |
		grep tag_name |
		sed 's/"tag_name": //g;s/"//g;s/,//g' |
		(tac 2>/dev/null || tail -r) |
		xargs
}

download_style_file() {
	local version=$1
	local url_path=$2

	curl -O -L "https://raw.githubusercontent.com/${SOURCES_REPO_NAME}/${version}/${url_path}"
}

install_version() {
	local install_type="$1"
	local version="$2"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	local install_path="./swift"
	local sources_path="./Sources"

	(
		mkdir -p "${install_path}" && cd ${install_path}
		download_style_file "${version}" "resources/xcode_settings.bash"

		mkdir -p ${sources_path} && cd ${sources_path}
		download_style_file "${version}" "Sources/RakuyoSwiftFormatTool/swiftlint.yml"
		download_style_file "${version}" "Sources/RakuyoSwiftFormatTool/rakuyo.swiftformat"

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}