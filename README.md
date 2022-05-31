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

### Dependencies

`brew install curl sha2` (curl is keg-only, so make sure it is available in `PATH` following the post-install instructions)

### Add a new version

1. Add new version to `scripts/generate_forumlae.rb` (at the top of the array if it's the latest version)
2. Run `bundle install && bundle exec ruby scripts/generate_formulae.rb` to generate the formulae for all versions
3. Run `brew style . --fix` (then make sure any linting fixes are applied to the template string, then regenerate the formula once again)
