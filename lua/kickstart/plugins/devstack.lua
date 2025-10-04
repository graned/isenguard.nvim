-- lua/kickstart/plugins/devstack.lua
return {
  -- Mason core + LSP glue
  { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP servers
        'basedpyright', -- Python
        'ruff_lsp', -- Python linter LSP
        'tsserver', -- TypeScript/JavaScript
        'rust_analyzer', -- Rust
      },
      automatic_installation = true,
    },
  },
  {
    -- Auto-install external tools on first start
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        -- Python
        'basedpyright',
        'ruff',
        'ruff-lsp',
        'black',
        -- TypeScript/JS
        'typescript-language-server',
        'prettierd',
        -- Rust
        'rust-analyzer',
        'codelldb',
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 6,
    },
  },

  -- LSP configs
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
      if ok_cmp then
        capabilities = cmp.default_capabilities(capabilities)
      end

      -- Python: basedpyright + ruff_lsp
      lsp.basedpyright.setup { capabilities = capabilities }
      lsp.ruff_lsp.setup {
        capabilities = capabilities,
        on_attach = function(client)
          -- Let Ruff format/fix; disable hover if you prefer Pyright’s hover
          client.server_capabilities.hoverProvider = false
        end,
      }

      -- TypeScript / JavaScript
      lsp.tsserver.setup { capabilities = capabilities }

      -- Rust (use rustaceanvim below; comment that out if you prefer plain lsp)
      lsp.rust_analyzer.setup { capabilities = capabilities }
    end,
  },

  -- Rust UX (recommended)
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    init = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ['rust-analyzer'] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = 'clippy' },
            },
          },
        },
      }
    end,
  },

  -- Treesitter parsers preinstalled
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'lua',
        'python',
        'typescript',
        'tsx',
        'javascript',
        'rust',
        'json',
        'toml',
        'yaml',
        'bash',
        'markdown',
        'markdown_inline',
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- Codeium (AI pair programming)
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp', -- if you’re using cmp (kickstart does)
    },
    config = function()
      require('codeium').setup {}
      -- After first start, run :Codeium Auth in Neovim to link your account.
      -- If you want Codeium suggestions inline + cmp source, ensure the cmp source is added (see below).
    end,
  },

  -- Add Codeium to nvim-cmp sources (if your repo has a cmp config file already)
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      -- Prepend Codeium to increase its priority (optional)
      table.insert(opts.sources, 1, { name = 'codeium' })
      return opts
    end,
  },

  -- LazyGit integration
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
