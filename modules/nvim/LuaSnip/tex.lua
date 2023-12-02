return {
  -- Example: how to set snippet parameters
 s({trig="hi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
      snippetType="autosnippet"
	},
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
  s({trig=";a", snippetType="autosnippet"},
		{
				t("\\alpha"),
		}
   ),
   s({trig=";b", snippetType="autosnippet"},
		{
				t("\\beta"),
		}
   ),
   s({trig=";g", snippetType="autosnippet"},
		{
				t("\\gamma"),
		}
   ),
   s({trig=";d", snippetType="autosnippet"},
		{
				t("\\delta"),
		}
   ),
   s({trig=";A", snippetType="autosnippet"},
		{
				t("\\Alpha"),
		}
   ),
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
