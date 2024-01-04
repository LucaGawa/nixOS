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

s({trig="tab2c",wordTrig=false, snippetType='autosnippet'},
  fmta(
[[
\begin{center}
  \begin{tabular}{c c}
  <>  & <> \\
  \end{tabular}
\end{center} 
]]
,
			{i(1), i(2)}
  ),
	{ condition = tex.in_text }
),
s({trig="tab3c",wordTrig=false, snippetType='autosnippet'},
  fmta(
[[
\begin{center}
  \begin{tabular}{c c c}
  <>  & <> & <>\\
  \end{tabular}
\end{center} 
]]
,
			{i(1), i(2), i(3)}
  ),
	{ condition = tex.in_text }
),

}
