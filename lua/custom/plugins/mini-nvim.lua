return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.icons').setup()
    require('mini.pairs').setup()
  end,
}
