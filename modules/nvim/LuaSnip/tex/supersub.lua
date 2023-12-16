local helpers = require('luasnip-helper-funcs')
local tex = require('luasnip-conditions')
local get_visual = helpers.get_visual


local function supersub(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false, snippetType='autosnippet'},
  fmta(
      expr,
			{d(1,get_visual)}
  ),
{condition = tex.in_math}
	)
end



return{
supersub("ss","^{<>}"),
supersub("ts","^{\\text{<>}}"),
supersub("ll","_{<>}"),
supersub("tl","_{\\text{<>}}"),
}
