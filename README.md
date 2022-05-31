# Typesense Homebrew Tap

This repo contains Typesense's Homebrew Tap.

## Installation

To use the formula from this tap:

```
brew install typesense/tap/typesense-server
```

You should now be able to run `typesense-server` from any path:

```
mkdir typesense-data
typesense-server --api-key=xyz --data-dir=./typesense-data
```

## Documentation

For brew docs:

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

For Typesense docs:

[https://typesense.org/docs/api/](https://typesense.org/docs/api/)

## Developer Workflow

This section is only if you're adding a new version to this tap.

For eg, to add a new version 0.23.0, when the current version is 0.22.2:

1. Copy `Formula/typesense-server@0.22.2.rb` to a new file `Formula/typesense-server@0.23.0`.
2. Update the class name in `Formula/typesense-server@0.23.0` to `TypesenseServerAT0230`
3. Update the version number and SHA in `Formula/typesense-server@0.23.0`
4. Update `Aliases/typesense-server` symlink to point to `../Formula/typesense-server@0.23.0`
