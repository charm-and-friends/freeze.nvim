<p align="center">
    <h2 align="center">charm-freeze.nvim</h3>
</p>

<p align="center">
    A wrapper around charm's <a href="https://github.com/charmbracelet/freeze"><code>freeze</code></a> cli tool for Neovim.
</p>

### Installation

1) Ensure that you have installed the [`freeze`][freeze] cli tool.

2) Follow the example below. It uses [lazy.nvim](https://github.com/folke/lazy.nvim), so you may have to adjust it to your plugin manager.

```lua
{
  'isabelroses/charm-freeze.nvim',
  config = function()
    require('charm-freeze').setup({
        command = "freeze",
        output = function
            return "./" .. os.date("%Y-%m-%d") .. "_freeze.png"
        end
        theme = "catppuccin-mocha",
    })
  end
}
```

For a full list of options, see [here](https://github.com/isabelroses/charm-freeze.nvim/blob/353992ad1959fdfd720e2f069f3d2f08f6ce639b/lua/charm-freeze/init.lua#L17-L44).

You might also want to add a keybinding to call the `Freeze` command.

```lua
vim.api.nvim_set_keymap('v', '<leader>sc', '<cmd>Freeze<cr>', {})
```

### Thanks

This project is heavily inspired by [nvim-silicon](https://github.com/michaelrommel/nvim-silicon).

This also would not be possible without [charmbracelet/freeze][freeze].

[freeze]: https://github.com/charmbracelet/freeze
