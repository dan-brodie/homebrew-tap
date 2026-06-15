# homebrew-tap

Homebrew tap for [Dan Brodie](https://github.com/dan-brodie)'s apps.

## Scribe

A macOS menu bar app that records and transcribes meetings entirely on-device.
See the [main repo](https://github.com/dan-brodie/scribe).

```bash
brew install --cask dan-brodie/tap/scribe
```

That's it — the app launches cleanly, no Gatekeeper prompt.

### How it launches without notarization

Scribe is **ad-hoc signed, not notarized** (notarization requires a paid Apple
Developer account). Homebrew quarantines downloaded apps, which would make
Gatekeeper block an un-notarized app on first launch. The cask's `postflight`
step clears the quarantine flag after install, so it just opens — you opt into
this by choosing to install Scribe.

### Updating

```bash
brew update && brew upgrade --cask scribe
```

### Uninstalling

```bash
brew uninstall --cask scribe          # remove the app
brew uninstall --zap --cask scribe    # also remove app data (DB, prefs, caches)
```
