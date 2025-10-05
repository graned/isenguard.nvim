return {
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local dashboard = require 'dashboard'
      dashboard.setup {
        theme = 'hyper',
        config = {
          header = {
            ' They taking the bits to...', -- small tagline line
            '',
            ' ██╗███████╗███████╗███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗  ',
            ' ██║██╔════╝██╔════╝████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗ ',
            ' ██║███████╗█████╗  ██╔██╗ ██║██║  ███╗██║   ██║███████║██████╔╝██║  ██║ ',
            ' ██║╚════██║██╔══╝  ██║╚██╗██║██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║ ',
            ' ██║███████║███████╗██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ ',
            ' ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ',
          },
          center = {
            { icon = '  ', desc = 'New file', action = 'enew', key = 'n' },
            { icon = '  ', desc = 'Find file', action = 'Telescope find_files', key = 'f' },
            { icon = '  ', desc = 'Explorer', action = 'Neotree toggle', key = 'e' },
            { icon = '  ', desc = 'Quit', action = 'qa', key = 'q' },
          },
          footer = { 'isenguard • ' .. os.date '%Y-%m-%d %H:%M' },
        },
      }
    end,
  },
}
