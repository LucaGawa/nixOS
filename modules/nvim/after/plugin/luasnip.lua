vim.cmd[[
" Expand snippets in insert mode with Tab
imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward in through tabstops in insert and visual mode with jk
imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]


require('luasnip')
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local events = require("luasnip.util.events")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local condition = require("luasnip.extras.expand_conditions")
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
vim.keymap.set('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/nixOS/modules/nvim/LuaSnip/"})<CR>')
