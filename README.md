## charm-freeze.nvim

A wrapper around charm's [`freeze`][freeze] cli tool for Neovim.

## Installation

1) Ensure that you have installed the [`freeze`][freeze] cli tool.

2) Follow the example below. It uses [lazy.nvim](https://github.com/folke/lazy.nvim), so you may have to adjust it to your plugin manager.

```lua
{
  'isabelroses/charm-freeze.nvim',
  config = function()
    require('charm-freeze').setup()
  end
}
```

## Thanks

This project is heavily inspired by [nvim-silicon](https://github.com/michaelrommel/nvim-silicon).
This also would not be possible without [charmbracelet/freeze][freeze].

[freeze]: https://github.com/charmbracelet/freeze
