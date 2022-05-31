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

This section is only applicable if you're adding a new version to this tap.

To add a new version:

1. Add it to `scripts/generate_forumlae.rb` (at the top of the array if it's the latest version)
2. Run `bundle install && bundle exec ruby scripts/generate_formulae.rb`
