return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
        float = {
          padding = 7,
        },
      }
    end,
    -- Uncomment this if you're gonna use oil
    vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' }),
  },
}
