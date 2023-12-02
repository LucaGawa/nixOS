-- pluginlist
require("Comment").setup()
require("gitsigns").setup()

-- options
vim.opt.number = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 2

-- better escape
require("better_escape").setup {
		mapping = {"jj"},
		timeout = vim.o.timeoutlen,
		clear_empty_lines = false,
		keys = "<Esc>",
}

--nvim/after/plugin/lsp.lua
local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  -- bufmap('gr', require('telescope.builtin').lsp_references)
  -- bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  -- bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
  --
  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup({
		override = function(root_dir, library)
				if root_dir:find("/home/luca/nixOS", 1, true) == 1 then
				library.enabled = true
				library.plugins = true
		end
  end,
})
require('lspconfig').lua_ls.setup {
     on_attach = on_attach,
     capabilities = capabilities,
     Lua = {
       diagnostics = {
				globals = { 's', 't', 'i', 'fmt', 'fmta'}
			 },
       workspace = { checkThirdParty = false },
       telemetry = { enable = false },
     },
 }

 -- nvim/after/plugin/cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

-- require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- cmp.setup {
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert {
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete {},
--         ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         },
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expand_or_locally_jumpable() then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.locally_jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--     },
-- }

-- luasnip.lua
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
--
-- vim.keymap.set({"i", "s"}, "<A-k>", function ()
-- 		if ls.expand_or_jumpable() then
-- 			ls.expand_or_jump()
-- 		end
-- end, { silent = true })
--
-- vim.keymap.set({"i", "s"}, "A-j", function ()
-- 	if ls.jumpable(-1) then
-- 		ls.jump(-1)
--     end
-- end, { silent = true })
--
ls.config.set_config({
		enable_autosnippets = true,
		store_selection_keys = "<Tab>",
		update_events = 'TextChanged,TextChangedI' --update reps while typing
})
require("luasnip.loaders.from_lua").lazy_load({paths= "~/nixOS/modules/nvim/LuaSnip/"})

