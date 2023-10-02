# Neovim CI template

This repo is a template for Neovim plugin CI with GitHub actions  
Feel free to copy into your own codebase.

## What is included

-   [Unit tests](#unit-tests) on stable and nightly
-   [Lua LS](#lua-ls) check on stable and nightly
-   [Luacheck](#luacheck)
-   [Stylua](#stylua) formatting check

On each pull request, all checks are run against the code. [Example](https://github.com/lukas-reineke/ci-template.nvim/actions/runs/6377488495)  
In addition, the unit tests and Lua LS check are run against Neovim nightly once
a week automatically. [Example](https://github.com/lukas-reineke/ci-template.nvim/actions/runs/6377432095)

### Unit tests

Unit tests are using the [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) [test harness](https://github.com/nvim-lua/plenary.nvim#plenarytest_harness).  
Add unit tests in `specs/features`. Each filename has to end in `_spec.lua`

Unit tests on CI are run against stable and nightly versions of Neovim.

Run the tests locally with

```bash
make test
```

### Lua LS

[Lua LS](https://luals.github.io/) checks the code for type safety using [neodev.nvim](https://github.com/folke/neodev.nvim) types.
To get the most out of this check, add types using [EmmyLua](https://emmylua.github.io/annotation.html) to your own codebase as well. See [luals.github.io/wiki/annotations](https://luals.github.io/wiki/annotations) for more information.

Lua LS check runs against stable and nightly versions of Neovim.

Run lua LS locally with

```bash
make lua-language-server version=stable

make lua-language-server version=nightly
```

### Luacheck

[Luacheck](https://github.com/mpeterv/luacheck) is an additional linter for lua. It can sometimes find issues Lua LS misses.

Run lua LS check locally with

```bash
make luacheck
```

### Stylua

[Stylua](https://github.com/JohnnyMorganz/StyLua) is a formatter for lua. The
check will make sure all code is formatted consistently.

Run stylua locally with

```bash
make stylua
```

## Update Versions

The stable Neovim version, and the lua LS version will need to be updated when
new versions get released.
To do that, open [.github/workflows/nightly_check.yml](https://github.com/lukas-reineke/ci-template.nvim/blob/main/.github/workflows/nightly_check.yml) and [.github/workflows/pr_check.yml](https://github.com/lukas-reineke/ci-template.nvim/blob/main/.github/workflows/pr_check.yml), and updated the values for `lua_ls_version` and `neovim_versions`.
