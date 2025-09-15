-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true,
  },
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    npairs.setup {
      enable_check_bracket_line = false,
      check_ts = true, -- ainda permite integração com treesitter
    }

    -- Adiciona regra para autopair de < >
    npairs.add_rules {
      Rule('<', '>', { 'html', 'xml', 'markdown', 'typescriptreact', 'javascriptreact' })
        :with_move(function(opts)
          return opts.char == '>'
        end)
        :with_pair(function(opts)
          local next_char = opts.line:sub(opts.col + 1, opts.col + 1)
          return next_char ~= '>'
        end)
        :with_del(function(opts)
          local prev_char = opts.line:sub(opts.col - 1, opts.col - 1)
          return prev_char == '<'
        end),
    }
  end,
}
