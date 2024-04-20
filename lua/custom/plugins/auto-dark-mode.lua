return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    -- 10 seeconds. more than enough
    update_interval = 10000,
    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
    end,
    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
    end,
  },
}
