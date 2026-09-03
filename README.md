# Agnostic Homebrew Tap

Homebrew formulae for [Agnostic](https://agn0.ru) — the `agnostic` CLI for
backend-mediated local workspace development. The formula installs the
published [`@nsp-labs/agnostic-cli`](https://www.npmjs.com/package/@nsp-labs/agnostic-cli)
npm package together with Node.js, so no global `npm install -g` is needed.

## Install

```bash
brew install newsmartpro/tap/agnostic-cli
agnostic login
```

## Update

```bash
brew upgrade agnostic-cli
```

## How the formula is updated

`Formula/agnostic-cli.rb` is rewritten automatically by the Agnostic release
pipeline after every CLI release: the `url` and `sha256` lines are pointed at
the new npm registry tarball and the change is committed to `main`. There is
nothing to run in this repository.
