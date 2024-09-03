<p align="center">
    <h2 align="center">freeze.nvim</h3>
</p>

<p align="center">
    A wrapper around charm's <a href="https://github.com/charmbracelet/freeze"><code>freeze</code></a> cli tool for Neovim.
</p>

### Installation

1) Ensure that you have installed the [`freeze`][freeze] cli tool.

2) Follow the example below. It uses [lazy.nvim](https://github.com/folke/lazy.nvim), so you may have to adjust it to your plugin manager.

```lua
{
  'charm-and-friends/freeze.nvim',
  config = function()
    require('freeze').setup({
        command = "freeze",
        output = function()
            return "./" .. os.date("%Y-%m-%d") .. "_freeze.png"
        end,
        theme = "catppuccin-mocha",
    })
  end
}
```

For a full list of options, see [here](https://github.com/isabelroses/charm-freeze.nvim/blob/b4c80e67e8a9fc525bd10633d04b5bfca2f2862e/lua/charm-freeze/init.lua#L17-L44).

You might also want to add a keybinding to call the `Freeze` command.

```lua
vim.api.nvim_set_keymap('v', '<leader>sc', '<cmd>Freeze<cr>', {})
```

### Thanks

This project is heavily inspired by [nvim-silicon](https://github.com/michaelrommel/nvim-silicon).

This would not be possible without [charmbracelet/freeze][freeze].

[freeze]: https://github.com/charmbracelet/freeze

---

Part of the [Charm](https://charm.sh) Community.

<a href="https://charm.sh/">
  <img
    alt="The Charm logo"
    width="400"
    src="https://stuff.charm.sh/charm-badge.jpg"
  />
</a>

Charm热爱开源 • Charm loves open source
