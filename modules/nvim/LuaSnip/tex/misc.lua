return {
  s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
  fmta(
    "\\texttt{<>}",
    { i(1) }
  )
),
s({trig="bf"},
  fmta(
    "\\textbf{<>}",
    { i(1) }
  )
),
s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
  fmt(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2)
    },
    {delimiters = "<>"} -- manually specifying angle bracket delimiters
  )
),
-- Equation
s({trig="eq", dscr="Expands 'eq' into an equation environment"},
  fmta(
     [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
     { i(1) }
  )
),
s({trig="ga"},
  fmta(
     [[
       \begin{gather*}
           <>
       \end{gather*}
     ]],
     { i(1) }
  )
),
s({trig="h",wordTrig=false},
  fmta(
      "\\hat{<>}",
     { i(1) }
  )
),
s({trig="da",wordTrig=false},
  t(
      "^\\dagger"
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
