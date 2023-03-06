-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require'nvim-treesitter.configs'.setup {
--   highlight={enable=true}
-- }
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--         underline = true,
--         virtual_text = {
--             spacing = 5,
--             severity_limit = 'Warning',
--         },
--         update_in_insert = true,
--     }
-- )

-- Plenary
local async = require "plenary.async"

-- Empty setups using defaults
require('nvim_comment').setup()
require("nvim-tree").setup()
require("nvim-surround").setup()
require('telescope').setup {}
require('telescope').load_extension('fzf')
require("nvim-autopairs").setup {}
require("leap").set_default_keymaps()

-- Remove EOB end of buffer characters
vim.opt.fillchars:append { eob = " " }

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

