local function fracSnippet(trig,expr)
				-- function for text snippets like \frac oder \dv
				return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\".. expr .. "{<>}{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1),
									i(2)}
				    )
				)
end

return {
				fracSnippet('ff','frac'),
				fracSnippet('dv','dv'),
				fracSnippet('pdv','pdv'),
				fracSnippet('fdv','fdv'),

s({trig="([^%a])ev" , wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\expval{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1)}
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
