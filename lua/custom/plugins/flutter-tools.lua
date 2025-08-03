return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      lsp = {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, remap = false }

          -- Hover
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Show Hover' }))

          -- Go to definition
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to Definition' }))

          -- Code actions normal mode
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Actions' }))

          -- Code actions visual mode
          vim.keymap.set('x', '<leader>ca', vim.lsp.buf.range_code_action, vim.tbl_extend('force', opts, { desc = 'Range Code Actions' }))

          pcall(require('telescope').load_extension, 'flutter')
        end,
      },
    }
  end,
}
