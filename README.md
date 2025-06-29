IntellijElixir
==============

[![Build Status](https://travis-ci.org/KronicDeth/intellij_elixir.svg?branch=master)](https://travis-ci.org/KronicDeth/intellij_elixir)
[![Code Climate](https://codeclimate.com/github/KronicDeth/intellij_elixir/badges/gpa.svg)](https://codeclimate.com/github/KronicDeth/intellij_elixir)

Elixir helpers for [intellj-elixir](https://github.com/KronicDeth/intellij-elixir),
the [Elixir](http://elixir-lang.org) plugin for [JetBrains](https://www.jetbrains.com)
IDEs.

## Building Release

To build the release for production, set both the `MIX_ENV` and
distillery environment to `prod`

`MIX_ENV=prod mix release --env=prod`

## Building Burrito

Burrito allows us to have a self-contained Elixir app, which is useful for both CI,
and allowing contributors to not have to run a specific version of Elixir in order
to build and test their pull requests.

See [Burrito](https://github.com/burrito-elixir/burrito) for more information

To build:

```bash
MIX_ENV=prod mix release intellij_elixir_burrito
```

To target Linux, MacOS, and Windows, prepend the target with the `BURRITO_TARGET`.

Targets:
- `BURRITO_TARGET=linux_amd64`
- `BURRITO_TARGET=linux_arm64`
- `BURRITO_TARGET=darwin_amd64` (For Intel Macs)
- `BURRITO_TARGET=darwin_arm64` (For Apple Silicon, e.g M1/M2/M3 processors)
- `BURRITO_TARGET=windows_amd64`

For example, to target Linux, and build for x86-64:

```bash
BURRITO_TARGET=linux_amd64 MIX_ENV=prod mix release intellij_elixir_burrito --overwrite --force
```

> By default, BURRITO_TARGET is set to the platform you are building on.

# Using with intellij-elixir tests

[intellij-elixir](https://github.com/KronicDeth/intellij-elixir)'s
`org.elixir.parsing_definition` tests use `IntellijElixir.Quoter` `GenServer`
to verify that intellij-elixir's parsed and quoted form match's Elixir's native
quoted form from `Code.string_to_quoted`.  IntellijElixir must be running
on node name `intellij_elixir` for intellij-elixir's tests to find it, so start
IntellijElixir release like so

```
_build/prod/rel/intellij_elixir/bin/intellij_elixir start
```
