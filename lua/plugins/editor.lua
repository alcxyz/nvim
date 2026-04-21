return {
  'tpope/vim-sleuth',
  'fabridamicelli/cronex.nvim',

  {
    'folke/zen-mode.nvim',
    opts = {},
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'alcxyz/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown', 'norg', 'org' },
    opts = {},
  },

  {
    'alcxyz/nvim-treesitter',
    branch = 'alc/fixes',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
  },
}
