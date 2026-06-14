# homebrew-tap

Homebrew tap for [Dan Brodie](https://github.com/dan-brodie)'s apps.

## Scribe

A macOS menu bar app that records and transcribes meetings entirely on-device.
See the [main repo](https://github.com/dan-brodie/scribe).

```bash
brew install --cask --no-quarantine dan-brodie/tap/scribe
```

### Why `--no-quarantine`?

Scribe is **ad-hoc signed, not notarized** (notarization requires a paid Apple
Developer account). Homebrew quarantines downloaded apps by default, which makes
Gatekeeper block an un-notarized app on first launch. `--no-quarantine` skips
that so the app launches cleanly.

If you install without the flag, you can still launch it the first time via
**right-click → Open**, or by clearing the flag manually:

```bash
xattr -dr com.apple.quarantine "/Applications/Scribe.app"
```

### Updating

```bash
brew update && brew upgrade --cask scribe
```

### Uninstalling

```bash
brew uninstall --cask scribe          # remove the app
brew uninstall --zap --cask scribe    # also remove app data (DB, prefs, caches)
```
