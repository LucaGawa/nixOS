local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end



local helpers = require('luasnip-helper-funcs')
local conditions = require('luasnip-conditions')
local in_mathzone = tex_utils.in_mathzone
local in_textzone = tex_utils.in_textzone
local get_visual = helpers.get_visual

local function text(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false,condition=in_textzone},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)},
      {condition = in_textzone}
        ),
{condition = in_textzone}
	)
end

local function mathtext(trig,expr)
-- function for text snippets like \textit{}
				return s({trig="" .. trig, wordTrig=false},
  fmta(
      "\\" .. expr .. "{<>}",
			{d(1,get_visual)}
  ),
{condition = in_mathzone}
	)
end

return{
     text('tt','texttt'),
     text('tbb','textbf'),
     text('tii','textit'),
     -- mathtext('tt', 'text'),
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
