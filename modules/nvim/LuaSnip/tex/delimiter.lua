local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local conditions = require('luasnip-conditions')
local in_mathzone = conditions.in_mathzone
local in_textzone = conditions.in_textzone


local function mathDelimiter(trig,open,close)
				-- function for math delimiter like 
				return s({trig="" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"".. open .. "<>" .. close,
								{ d(1, get_visual) }
				    ),
						{ condition = in_mathzone }
				)
end

local function textDelimiter(trig,open,close)
				-- function for text delimiter like 
				return s({trig="" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"".. open .. "<>" .. close,
								{ d(1, get_visual) }
				    ),
				   { condition = in_textzone }
				)
end

return {
				mathDelimiter("kk","(",")"),
				mathDelimiter("qk","\\qty(",")"),
				mathDelimiter("qs","\\qty[","]"),
				mathDelimiter("sk","[","]"),
				mathDelimiter("qc","\\qty{","}"),
				mathDelimiter("ck","{","}"),
				--
				textDelimiter("kk","(",")"),
				textDelimiter("sk","[","]"),
				textDelimiter("qc","\\{","\\}"),
				textDelimiter("ck","{","}"),
}
