return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        transparent_background = true,
        integrations = {
          neotree = true,
          telescope = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
