local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.inser_node

ls.add_snippets("tex",{
	s("hello", {
		t('print("hello world")')
	})
})
