local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')

local function structure(trig,expr)
				return s({trig=trig, wordTrig=false, snippetType="autosnippet"},
				fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
				{condition = tex.line_begin }
)
end

return{
				structure("h0","part"),
				structure("h1","chapter"),
				structure("h2","section"),
				structure("h3","subsection"),
				structure("h4","subsubsection"),
				structure("h5","paragraph"),
}

