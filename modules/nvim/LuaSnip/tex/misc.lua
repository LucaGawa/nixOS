local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual

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

s({trig="vv",wordTrig=false, snippetType="autosnippet"},
  t(
      "\\vb*"
  )
),
s({trig="^",wordTrig=false},
  fmta(
      "^{<>}",
			{i(1)}
  )
),
s({trig="_",wordTrig=false},
  fmta(
      "_{<>}",
			{i(1)}
  )
),
s({trig="kk",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "(<>)",
			{i(1)}
  )
),
s({trig="qk",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "\\qty(<>)",
			{i(1)}
  )
),

s({trig="sk",wordTrig=false},
  fmta(
      "[<>]",
			{i(1)}
  )
),
s({trig="ee",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "\\e{<>}",
			{i(1)}
  )
),
}
