# Mezmo Homebrew Tap

Official Homebrew formulae for Mezmo software, maintained by Mezmo.

## Background

[Homebrew](https://brew.sh) is a package manager for macOS and Linux. A
[tap](https://docs.brew.sh/Taps) is an external repository of Homebrew packages
(called formulae) that you can install alongside Homebrew's built-in ones. This
repository is Mezmo's tap.

## Installing a package

Install any package from this tap by its fully qualified name:

```sh
brew install mezmo/tap/<name>
```

The first install automatically adds the tap, so there's no separate setup step.

If you'd rather add the tap on its own (for example, to browse its packages in
`brew search`), run:

```sh
brew tap mezmo/tap
```

To add the tap over SSH instead of HTTPS:

```sh
brew tap mezmo/tap git@github.com:mezmo/homebrew-tap.git
```

Once installed, keep packages current with the usual Homebrew workflow:

```sh
brew update && brew upgrade
```

## Available packages

```sh
# Interactive terminal client for composing AI agents with MCP tools
brew trust --formula mezmo/tap/aura
brew install mezmo/tap/aura

# OpenAI-compatible API server for AURA agents
brew trust --formula mezmo/tap/aura-web-server
brew install mezmo/tap/aura-web-server
```

Only generally available (GA) releases are published here. Prereleases such as
alphas, betas, and release candidates are not distributed through this tap.

## How updates work

Formulae in this tap are updated automatically. When a new GA release ships, the
corresponding formula is bumped to the new version and checksums, so `brew
upgrade` picks it up shortly after release. The binaries distributed here are the
same artifacts Mezmo publishes for each release.

## Contributing

See our [contribution guidelines](./CONTRIBUTING.md). This project follows the
[Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md), and contributions
are subject to the [Contributor License Agreement](./CLA.md).

## License

This tap is licensed under the [Apache License, Version 2.0](./LICENSE).
