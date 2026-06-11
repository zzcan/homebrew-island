# homebrew-island

Homebrew tap for [island](https://github.com/zzcan/island) — a dynamic-island
style monitor for Claude Code sessions around the notch.

## Install

```bash
brew trust zzcan/island   # required by newer Homebrew for third-party taps
brew install --cask zzcan/island/island
xattr -dr com.apple.quarantine /Applications/island.app
```

The xattr step is required because island is ad-hoc signed (no Apple
Developer certificate); Homebrew 5 removed the --no-quarantine flag.

## Upgrade

```bash
brew upgrade --cask island
```

The cask is bumped automatically by island's release workflow — do not edit
`Casks/island.rb` by hand.
