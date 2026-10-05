return {
  -- Copilot backend (auth + LSP; suggestion/panel UI disabled — blink-copilot handles completions)
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  -- blink.cmp source for inline Copilot completions
  {
    'fang2hou/blink-copilot',
    dependencies = { 'zbirenbaum/copilot.lua' },
  },

  -- Copilot Chat with model switching
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    event = 'VeryLazy',
    dependencies = { 'zbirenbaum/copilot.lua' },
    opts = {},
    keys = {
      { '<leader>ac', '<cmd>CopilotChatToggle<cr>', desc = 'Copilot [C]hat' },
      { '<leader>am', '<cmd>CopilotChatModels<cr>', desc = 'Copilot [M]odels' },
      {
        '<leader>aq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'Copilot [Q]uick chat',
      },
      { '<leader>ae', '<cmd>CopilotChatExplain<cr>', mode = { 'n', 'v' }, desc = 'Copilot [E]xplain' },
      { '<leader>af', '<cmd>CopilotChatFix<cr>',     mode = { 'n', 'v' }, desc = 'Copilot [F]ix' },
      { '<leader>ar', '<cmd>CopilotChatReview<cr>',  mode = { 'n', 'v' }, desc = 'Copilot [R]eview' },
    },
  },
}
