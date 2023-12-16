local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local conditions = require('luasnip-conditions')
local in_mathzone = conditions.in_mathzoneocal helpers = require('luasnip-helper-funcs')

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


s({trig="ss",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "^{<>}",
			{i(1)}
  )
),
s({trig="ts",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "^{\\text{<>}}",
			{i(1)}
  )
),
s({trig="ll",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "_{<>}",
			{i(1)}
  )
),
s({trig="tl",wordTrig=false, snippetType='autosnippet'},
  fmta(
      "_{\\text{<>}}",
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
