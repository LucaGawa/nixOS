local function fracSnippet(trig,expr)
				-- function for text snippets like \frac oder \dv
				return s({trig="" .. trig, wordTrig=false, regTrig=true, autosnippet=true},
				fmta(
								"\\".. expr .. "{<>}{<>}",
								{i(1),i(2)}
				    )
				)
end

return {
				fracSnippet('ff','frac'),
--   s({trig="ff"},
--   fmta(
--     "\\frac{<>}{<>}",
--     {
--       i(1),
--       i(2)
--     }
-- 		)
-- ),
s({trig="dv"},
  fmta(
    "\\dv{<>}{<>}",
    {
      i(1),
      i(2)
    }
		)
),
s({trig="pdv"},
  fmta(
    "\\pdv{<>}{<>}",
    {
      i(1),
      i(2)
    }
		)
),
s({trig="fdv"},
  fmta(
    "\\fdv{<>}{<>}",
    {
      i(1),
      i(2)
    }
		)
),
s({trig="sum"},
  fmta(
    "\\sum_{<>}^{<>}",
    {
      i(1),
      i(2)
    }
		)
),
s({trig="int"},
  fmta(
    "\\int_{<>}^{<>}",
    {
      i(1),
      i(2)
    }
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
}
