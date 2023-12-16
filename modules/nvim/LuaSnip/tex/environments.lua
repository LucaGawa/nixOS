local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local conditions = require('luasnip-conditions')
local in_textzone = conditions.in_textzone
local function environments(trig,expr)
-- function for environment snippets like 
return s({trig="" .. trig, wordTrig=false},
  fmta(
      [[\begin{]] .. expr .. [[*}
				<>
\end{]] .. expr .. [[*}]],
    {d(1,get_visual)},
  	{condition = in_textzone }
)
)
end

return{
environments('eq','equation'),
environments('ga','gather'),
environments('al','align'),
s({trig="mm", snippetType='autosnippet'},
  fmta(
     [[
       $<>$
     ]],
     { i(1) }
  )
),
s({trig="env", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),
}
