local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local function environments(trig,expr)
-- function for environment snippets like 
return s({trig="" .. trig, wordTrig=false},
  fmta(
      [[\begin{]] .. expr .. [[*}
				<>
\end{]] .. expr .. [[*}]],
    {d(1,get_visual)}
),

  	{condition = tex.line_begin }
)
end
local function lists(trig,expr)
return s({trig="" .. trig, wordTrig=false, snippetType='autosnippet'},
  fmta(
      [[\begin{]] .. expr .. [[}
				\item <>
\end{]] .. expr .. [[}]],
    {d(1,get_visual)}
),

  	{condition = tex.in_text and line_begin}
)
end
return{
environments('eq','equation'),
environments('ga','gather'),
environments('al','align'),
lists('it', 'itemize'),
lists('en', 'enumerate'),

s({trig="ii", wordTrig=false, snippetType="autosnippet"},
				t("\\item"),
				{condition = tex.in_text and tex.in_list and line_begin }
),


s({trig="mm", snippetType='autosnippet'},
  fmta(
     [[
       $<>$
     ]],
     { d(1, get_visual) }
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
s({trig="emm", snippetType="autosnippet"},
  fmta(
    [[
      \begin{subequations}
       \begin{empheq}[box=\widefbox]{<>}
          <>
      \end{empheq}
       \end{subequations}
    ]],
    {
      i(1),
      i(2),
    }
  )
),
s({trig="cas", snippetType="autosnippet", wordTrig=false},
  fmta(
    [[
      \begin{cases}
          <> & <> \\
          <> & <> 
       \end{cases}
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
    }
  ),
  { condition = tex.in_math }
),

}
