local helpers = require('luasnip-helper-funcs')
local tex = require('luasnip-conditions')
local get_visual = helpers.get_visual

local function text(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true, snippetType='autosnippet'},
  fmta(
      "<>\\" .. expr .. "{<>}",
			{ f ( function(_, snip) return snip.captures[1] end),
							d(1,get_visual)}
        ),
{ condition = tex.in_text }
	)
end


local function mathtext(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false, snippetType='autosnippet'},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
{condition = tex.in_math}
	)
end

return{
     text('tt','texttt'),
     text('tbb','textbf'),
     text('tii','textit'),
     text('tss','textsc'),
     text('uu','underline'),
     mathtext('tt', 'text'),
     mathtext('it', 'intertext'),
     mathtext('uu', 'uline'),
     mathtext('du', 'uuline'),
     mathtext('mr', 'mathrm'),
     mathtext('mbb', 'mathbb'),
     mathtext('du', 'uuline'),
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
