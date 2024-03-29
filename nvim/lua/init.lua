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

-- Neodev for DAP-UI
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})

-- Empty setups using defaults
require('nvim_comment').setup()
require("nvim-tree").setup()
require("nvim-surround").setup()
require('telescope').setup {}
require('telescope').load_extension('fzf')
-- require('session-lens').setup {}
require("nvim-autopairs").setup {}
require("leap").set_default_keymaps()
require("mason").setup()
require("mason-lspconfig").setup()
require('modicator').setup()
-- require("karen-yank").setup()
require("trouble").setup {}

-- telescope-file-browser
vim.api.nvim_set_keymap(
   "n",
   "<space>fb",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
)

vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })


-- Remove EOB end of buffer characters
vim.opt.fillchars:append { eob = " " }

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

