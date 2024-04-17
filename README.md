<div align="center">

# asdf-swift-style-guide [![Build](https://github.com/RakuyoKit/asdf-swift-style-guide/actions/workflows/build.yml/badge.svg)](https://github.com/RakuyoKit/asdf-swift-style-guide/actions/workflows/build.yml) [![Lint](https://github.com/RakuyoKit/asdf-swift-style-guide/actions/workflows/lint.yml/badge.svg)](https://github.com/RakuyoKit/asdf-swift-style-guide/actions/workflows/lint.yml)

[swift-style-guide](https://github.com/RakuyoKit/asdf-swift-style-guide) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add swift-style-guide
# or
asdf plugin add swift-style-guide https://github.com/RakuyoKit/asdf-swift-style-guide.git
```

swift-style-guide:

```shell
# Show all installable versions
asdf list-all swift-style-guide

# Install specific version
asdf install swift-style-guide latest

# Set a version globally (on your ~/.tool-versions file)
asdf global swift-style-guide latest

# Now swift-style-guide commands are available
ssg --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/RakuyoKit/asdf-swift-style-guide/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Rakuyo](https://github.com/RakuyoKit/)
