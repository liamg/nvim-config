# My Neovim Config

An attempt to get a fully functional IDE experience in Neovim, especially for Go/Lua.

![Screenshot](screenshot.png)

## Installation

1. Clone this to `~/.config/nvim/`.
1. Ensure you have python (3+) and node (18+) installed
1. Install python support (`pip install pynvim`)
1. Install node support (`npm i -g neovim`)
1. Install ripgrep, lazygit, luacheck, and any other binaries you need
1. Run `:checkhealth` to ensure everything is working
1. Run `:Mason` and install required LSPs (remember to edit the servers list in `mason.lua` too)

