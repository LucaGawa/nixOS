-- require("luasnip").config.set_config({ -- Setting LuaSnip config
--   -- Enable autotriggered snippets
--   enable_autosnippets = true,

--   -- Use Tab (or some other key if you prefer) to trigger visual selection
--   store_selection_keys = "<Tab>",
-- })
-- require("luasnip.loaders.from_lua").load({paths = "~/nixOS/modules/nvim/LuaSnip/"})

vim.opt.number = true

vim.cmd[[
" Expand or jump in insert mode
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

" Jump forward through tabstops in visual mode
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
" Jump backward through snippet tabstops with Shift-Tab (for example)
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
 Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
   ]]
   
-- Load snippets from ~/.config/nvim/LuaSnip/
-- require("luasnip.loaders.from_lua").load({paths = "~/nixOS/modules/nvim/LuaSnip/"})
return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello, world!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
}

