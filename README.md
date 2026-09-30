# Neovim for Tidal
Based on my personal config adapted to Tidal Cycles. Everything to get started

## Features
- Lazy loading
- Snippets
- Cool color changing toolbar for the neurodivergent bros, should prolly be reworked
- Tidal.nvim

# Requirements
Follow the installation guide at [Tidal Cycles: Installation](https://tidalcycles.org/docs/getting-started/linux_install) for all the required software and installation guide.

Haskell parser, do `:TSInstall haskell`. You might us `ghci` a bit, so it's worth having a look at [Using GHCi](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html).

# Optional
You can use `scnvim` to interact with SuperCollider, for example you can set up the `TidalLaunch` autocommand to automatically start `scnvim` whenever Tidal is started
```lua
vim.api.nvim_create_autocmd("User", {
  pattern = "TidalLaunch",
  callback = function()
    require("scnvim").start()

    local bootfile = vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1] -- this needs to be the path to your bootfile, this is the path to the bootfile provided by this plugin

    local file = assert(io.open(bootfile, "r"), "bootfile not found")
    require("scnvim").send(file:read("a"))
  end
})
```
see more at [tidal.nvim](https://codeberg.org/MrReason/tidal.nvim).


# Credits
1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
2) NvChad was the basis of this. Thanks. Based.
3) Tidal. Cool af
4) SuperCollider and SuperDirt
