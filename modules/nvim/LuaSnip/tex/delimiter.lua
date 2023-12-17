local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')


local function mathDelimiter(trig,open,close)
				-- function for math delimiter like 
				return s({trig="" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"".. open .. "<>" .. close,
								{ d(1, get_visual) }
				    ),
						{ condition = tex.in_math }
				)
end

local function textDelimiter(trig,open,close)
				-- function for text delimiter like 
				return s({trig="" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"".. open .. "<>" .. close,
								{ d(1, get_visual) }
				    ),
				   { condition = tex.in_text }
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
				textDelimiter("ssk","[","]"),
				textDelimiter("qqc","\\{","\\}"),
				textDelimiter("cck","{","}"),
}
