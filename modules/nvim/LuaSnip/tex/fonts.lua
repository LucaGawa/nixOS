local helpers = require('luasnip-helper-funcs')
local conditions = require('luasnip-conditions')
local mathzone = conditions.in_mathzone
local textzone = conditions.in_textzone
local get_visual = helpers.get_visual

local function text(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
	{condition = textzone}
)
end

local function mathtext(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
	{condition = mathzone}
)
end

return{
     text('tt','texttt'),
     text('tbb','textbf'),
     text('tii','textit'),
     mathtext('tt', 'text'),
     mathtext('it', 'intertext'),
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
