# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test swift-style-guide https://github.com/RakuyoKit/asdf-swift-style-guide.git "ssg --version"
```

Tests are automatically run in GitHub Actions on push and PR.
