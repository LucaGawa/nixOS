local helpers = require('luasnip-helper-funcs')
local conditions = require('luasnip-conditions')
local mathzone = conditions.in_mathzone
local textzone = conditions.in_textzone
local get_visual = helpers.get_visual
local function textSnippets(trig,expr)
				-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
	{condition = textzone}
)
end

return{
     textSnippets('tt','texttt'),
     textSnippets('tbb','textbf'),
     textSnippets('tii','textit'),

s({trig="te",wordTrig=false},
  fmta(
      "\\text{<>}",
			{d(1, get_visual)}
  )
),
s({trig="it",wordTrig=false},
  fmta(
      "\\intertext{<>}",
			{i(1)}
  )
),
s({trig="cal",wordTrig=false},
  fmta(
      "\\mathcal{<>}",
			{i(1)}
  )
),
s({trig="rm",wordTrig=false},
  fmta(
      "\\mathrm{<>}",
			{i(1)}
  )
),
s({trig="bb",wordTrig=false},
  fmta(
      "\\mathbb{<>}",
			{i(1)}
  )
),

 }
