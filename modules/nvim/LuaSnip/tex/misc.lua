local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')

return {
s({trig="ub"},
  fmta(
    [[
      \underbrace{<>}_{<>}
    ]],
    {
      d(1,get_visual),
			i(2)
    }
  )
),

s({trig="lb",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "\\label{<>}",
			{i(1)}
  )
),



s({trig="ee",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "\\e{<>}",
			{i(1)}
  ),
	{ condition = tex.in_math }
),
}
