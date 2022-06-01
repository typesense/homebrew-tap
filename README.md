# Typesense Homebrew Tap

This repo contains Typesense's Homebrew Tap.

## Installation

To install the latest version of Typesense:

```
brew install typesense/tap/typesense-server
```

To install a specific version of Typesense:

```
brew install typesense/tap/typesense-server@0.22.2
```

## Documentation

For brew docs: `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

### Defaults

- Configuration files are under: `${HOMEBREW_PREFIX}/etc/typesense/`
- Logs are under: `${HOMEBREW_PREFIX}/var/log/typesense/`
- Data dir is under: `${HOMEBREW_PREFIX}/var/lib/typesense/`
- The default admin api-key is `xyz`.
- The default API port is `8108`

where `${HOMEBREW_PREFIX}` is usually `/usr/local`.

### Start service

To start the `typesense-server` service:

```
brew services start typesense-server
```

Now check the health of the server:

```
curl http://localhost:8108/health
{"ok":true}
```

If you don't see `{"ok": true}`, check the logs under `${HOMEBREW_PREFIX}/var/log/typesense/` for any issues or progress.

`${HOMEBREW_PREFIX}` is usually `/usr/local`.

### Restart service

To restart the `typesense-server` service:

```
brew services restart typesense-server
```

### Stop service

To stop the `typesense-server` service:

```
brew services stop typesense-server
```

### Standalone

You can also run `typesense-server` from any path:

```
mkdir typesense-data
typesense-server --api-key=xyz --data-dir=./typesense-data
```

### Typesense Docs

For Typesense docs, see: [https://typesense.org/docs/api/](https://typesense.org/docs/api/)

## Tap Developer Workflow

This section is only applicable if you're adding a new version to this tap.

### Dependencies

`brew install curl sha2` (curl is keg-only, so make sure it is available in `PATH` following the post-install instructions)

### Add a new version

1. Add new version to `scripts/generate_forumlae.rb` (at the top of the array if it's the latest version)
2. Run `bundle install && bundle exec ruby scripts/generate_formulae.rb` to generate the formulae for all versions
3. Run `brew style . --fix` (then make sure any linting fixes are applied to the template string, then regenerate the formula once again)
4. Test locally `brew install ./Formula/typesense-server@0.22.2.rb --debug`
