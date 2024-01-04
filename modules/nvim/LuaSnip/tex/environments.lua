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
return s({trig="" .. trig, wordTrig=true},
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
-- lists('en', 'enumerate'),

s({trig="dds", wordTrig=true, snippetType='autosnippet'},
  fmta(
      [[\begin{description}
				\item[<>] <>
\end{description}]],
    {i(1), i(2)}
),

  	{condition = tex.in_text and line_begin}
),

s({trig="en", wordTrig=true},
  fmta(
[[
\begin{enumerate}[label=(\arabic*)]
				\item <>
\end{enumerate}
]],
    {i(1)}
),

  	{condition = tex.in_text and line_begin}
),

s({trig="ii", wordTrig=true},
				t("\\item"),
				{condition = tex.in_text and tex.in_list and line_begin and not tex.in_description }
),

s({trig="mm", snippetType='autosnippet'},
  fmta(
     [[
       $<>$
     ]],
     { d(1, get_visual) }
  )
),
s({trig="env", wordTrig=true, snippetType="autosnippet"},
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
s({trig="emm", wordTrig=true, snippetType="autosnippet"},
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
s({trig="cas", snippetType="autosnippet", wordTrig=true},
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
s({trig="report"},
  fmta(
    [[\documentclass[english]{scrreprt}
    \usepackage{pakete}
      \begin{document}
          <>
      \end{document}
    ]],
    {
      i(1),
    }
  )
),

}
