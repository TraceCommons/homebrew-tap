# Trace Commons Homebrew tap

```sh
brew tap TraceCommons/tap
brew install --cask trace-commons          # the contributor app
brew install trace-commons-contributor     # the CLI
```

The cask installs a Developer ID-signed, Apple-notarized build, so Gatekeeper
accepts it without any right-click-Open ritual. That matters more than
convenience here: the app reads your local coding session files, and an install
path whose first step is clicking past a security warning trains you past the
warning that should stop a tampered build.

Casks and formulae in this tap are updated by pull request from the release
workflows in TraceCommons/trace-commons-server, never pushed directly.
