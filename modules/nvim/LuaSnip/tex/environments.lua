return{
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
}
