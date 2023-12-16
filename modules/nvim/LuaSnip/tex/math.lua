local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local conditions = require('luasnip-conditions')
local in_mathzone = conditions.in_mathzone

local function static(trig,expr)
				return s({trig="".. trig, wordTrig=false, snippetType="autosnippet"},
				t("" .. expr),
				{condition = in_mathzone}
)
end

local function fracSnippet(trig,expr)
				-- function for text snippets like \frac oder \dv
				return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\".. expr .. "{<>}{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1),
									i(2)},
									{ condition = in_mathzone }
				    )
				)
end

local function sumSimilar(trig,expr)
				-- function for snippets like sum, prod or int
  return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true},
  fmta(
    "<>\\".. expr .. "_{<>}^{<>}",
    { f( function(_, snip) return snip.captures[1] end),
      i(1),
      i(2)},
			{ condition = in_mathzone }
		)
)
end

return {
				fracSnippet('ff','frac'),
				fracSnippet('dv','dv'),
				fracSnippet('pdv','pdv'),
				fracSnippet('fdv','fdv'),

				static("da", "^\\dagger"),
				static("dd", "\\dd"),
				static("DD", "\\mathcal{D}"),
				static("HH", "\\mathcal{H}"),
				static("LL", "\\mathcal{L}"),
				static("vv", "\\vb*"),
				static("hh", "\\hat"),
				static("in", "\\int"),
				static("ss", "\\sum"),
				

s({trig="([^%a])ev" , wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\expval{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  d(1, get_visual)},
								{condition = in_mathzone}
				    )
				),
s({trig="([^%a])me" , wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\mel{<>}{<>}{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1),
								  i(2),
								  i(3)},
									{condition = in_mathzone}
				    )
				),

sumSimilar("sum","sum"),
sumSimilar("prod","prod"),
sumSimilar("int","int"),

}
