vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.opt_local.conceallevel = 2
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- [[ Keymaps ]]
local function toggle_split_layout()
  if vim.fn.winnr '$' < 2 then
    vim.notify('No split layout to toggle', vim.log.levels.INFO)
    return
  end

  local layout = vim.fn.winlayout()[1]
  if layout == 'row' then
    vim.cmd 'wincmd K'
  else
    vim.cmd 'wincmd H'
  end
end

local function swap_with_window(direction)
  local current = vim.fn.win_getid()
  vim.cmd('wincmd ' .. direction)

  if vim.fn.win_getid() == current then
    return
  end

  local target = vim.fn.winnr()
  vim.fn.win_gotoid(current)
  vim.cmd(target .. 'wincmd x')
end

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { desc = '[W]indow split [V]ertical' })
vim.keymap.set('n', '<leader>ws', '<cmd>split<CR>', { desc = '[W]indow split horizontal' })
vim.keymap.set('n', '<leader>wc', '<cmd>close<CR>', { desc = '[W]indow [C]lose' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = '[W]indow equalize' })
vim.keymap.set('n', '<leader>wt', toggle_split_layout, { desc = '[W]indow [T]oggle split layout' })
vim.keymap.set('n', '<leader>wh', function() swap_with_window 'h' end, { desc = '[W]indow swap left' })
vim.keymap.set('n', '<leader>wj', function() swap_with_window 'j' end, { desc = '[W]indow swap down' })
vim.keymap.set('n', '<leader>wk', function() swap_with_window 'k' end, { desc = '[W]indow swap up' })
vim.keymap.set('n', '<leader>wl', function() swap_with_window 'l' end, { desc = '[W]indow swap right' })
vim.keymap.set('n', '<leader><Tab>n', '<cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader><Tab>c', '<cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader><Tab>l', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><Tab>h', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ lazy.nvim bootstrap ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
