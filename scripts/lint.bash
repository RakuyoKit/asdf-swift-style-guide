#!/usr/bin/env bash

find . -type f -name '*.bash' -exec shellcheck --shell=bash --external-sources --source-path=template/lib/ {} +
find . -type f -name '*.bash' -exec shfmt --language-dialect bash --diff {} +
