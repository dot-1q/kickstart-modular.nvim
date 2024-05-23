-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '´d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', 'ºd', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Add 'jk' and 'kj' keys to exit insert mode
local options = { noremap = true }
vim.keymap.set('i', 'kj', '<Esc>', options)
vim.keymap.set('i', 'jk', '<Esc>', options)
-- Remap to add 'zz' to the half page up/down commands to center them
vim.keymap.set({ 'v', 'n' }, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'v', 'n' }, '<C-d>', '<C-d>zz')
-- Paste with leader so we dont lose whats being pasted (on the buffer)
vim.keymap.set('v', '<leader>p', '"_dP')
-- Set keybinds for window resize
vim.keymap.set('n', '<C-+>', '<C-W>>')
vim.keymap.set('n', '<C-_>', '<C-W><')
-- Toggle diagnostics on and off
local diagnostics_active = true
vim.keymap.set('n', '<leader>tt', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end, { desc = 'Toggle Diagnostics' })

-- Neogen keymap to generate annotations
vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate({ type = 'func' })<CR>", { desc = 'Generate Function Annotations', noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>nt', ":lua require('neogen').generate({ type = 'type' })<CR>", { desc = 'Generate Type Annotations', noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>nc', ":lua require('neogen').generate({ type = 'class' })<CR>", { desc = 'Generate Class Annotations', noremap = true })

-- Keymap to open a split for a terminal session and exit.
-- It also changes the terminal directory to the file from where it was open from.
vim.keymap.set('n', '<leader>ot', function()
  vim.cmd 'botright 15 split'
  vim.cmd 'lcd %:p:h'
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end)
vim.keymap.set('t', 'kj', '<C-\\><C-n>', options)
vim.keymap.set('t', 'jk', '<C-\\><C-n>', options)

-- Keymap to bring up Whichkey's spell suggestions (z=)
vim.keymap.set('n', '<leader>sc', 'z=', { desc = '[S]pell Check suggestions', remap = true })

-- mini.git related keymaps
vim.api.nvim_set_keymap('n', '<Leader>ga', ':Git add %<CR>', { desc = 'Git add the changes in the current file', noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>g.', ':Git add .<CR>', { desc = 'Git add all changes', noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit<CR>', { desc = 'Git Commit', noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git status<CR>', { desc = 'Git Status', noremap = true })

-- vim: ts=2 sts=2 sw=2 et
