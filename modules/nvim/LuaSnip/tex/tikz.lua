local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local function feynCMc(trig,expr)
				return s({trig=trig, wordTrig=true},
				fmta(
[[
\begin{tikzpicture}[baseline={([yshift=5ex]a.base)}]
  \begin{feynman}[scale=0.5,transform shape]
]]
..expr..
[[
  \end{feynman}
\end{tikzpicture}<>
]],
{i(1)}
)
)
end
local function feynCMd(trig,expr)
				return s({trig=trig, wordTrig=true},
				fmta(
[[
\begin{tikzpicture}[baseline={([yshift=-0.5ex]current 
                          bounding box.center)}]
  \begin{feynman}[scale=0.5,transform shape]
]]
..expr..
[[
  \end{feynman}
\end{tikzpicture}<>
]],
{i(1)}
)
)
end


-- local function environments(trig,expr)
-- -- function for environment snippets like 
-- return s({trig="" .. trig, wordTrig=false},
--   fmta(
--       [[\begin{]] .. expr .. [[*}
-- 				<>
-- \end{]] .. expr .. [[*}]],
--     {d(1,get_visual)}
-- ),
--
--   	{condition = tex.line_begin }
-- )
-- end

return{
feynCMd("x1",
[[
  \vertex [dot] (a) {};
  \vertex [right=of a] (c);
  \vertex [dot,right=of c] (b) {}; 
  \diagram* {
    (a) -- [fermion,bend left]  (b),
    (b) -- [fermion,bend left]  (a),
  };
]]),
feynCMd("x2",
[[
  \vertex [dot] (a) {};
  \vertex [right=1.2of a] (a2);
  \vertex [right=of a] (c);
  \vertex [dot,right=of c] (b) {}; 
  \vertex [left=1.2of b] (b2); 
    \diagram* {
      (a) -- [fermion, half left] (a2);
      (a2) -- [fermion, half left] (a);
      (b2) -- [fermion, half right] (b);
      (b) -- [fermion, half right] (b2);
    };
]]),
feynCMc("c1",
   [[
      \vertex [] (a) ;
      \vertex [right=of a] (b); 
     \vertex [above=of b] (c) {}; 
      \diagram* {
     (a) -- [fermion]  (b),
    };]]
),
feynCMc("c2",
   [[
  \vertex [] (a) ;
  \vertex [dot,right=of a] (b) {} ; 
  \vertex [right=of b] (c) ; 
  \vertex [dot,above=of b] (d) {}; 
  \vertex [above=of d] (e) ; 
  \diagram* {
  (a) -- [fermion]  (b) 
      -- [fermion] (c),
  (b) -- [photon] (d),
  (d) -- [fermion,half left] (e)
      -- [fermion, half left] (d)
  };
]]
),
feynCMc("c3",
   [[
  \vertex [] (a) ;
  \vertex [dot, right = of a] (b) {}; 
  \vertex [dot, right = of b] (c) {}; 
  \vertex [right = of c] (d); 
  \diagram* {
  (a) -- [fermion]  (b) -- [fermion] (c)
      -- [fermion] (d),
  (b) -- [photon,half left] (c)
  };
]]
),
feynCMc("c4",
   [[
  \vertex [] (a) ;
  \vertex [dot, right = of a] (b) {}; 
  \vertex [dot, right = of b] (c) {}; 
  \vertex [dot, above = of b] (b2) {}; 
  \vertex [dot, above = of c] (c2) {}; 
  \vertex [right = of c] (d); 
  \diagram* {
    (a) -- [fermion]  (b) -- [fermion] (c)
        -- [fermion] (d),
    (b) -- [photon] (b2),
    (c) -- [photon] (c2),
    (b2) -- [fermion, bend left] (c2)
         -- [fermion, bend left] (b2)
   };
]]
),
feynCMc("c5",
   [[
  \vertex [] (a) ;
  \vertex [dot, right = of a] (b) {}; 
  \vertex [dot, right = of b] (c) {}; 
  \vertex [dot, right = of c] (d) {}; 
  \vertex [dot, right = of d] (e) {}; 
  \vertex [right = of e] (f); 
  \diagram* {
    (a) -- [fermion]  (b) -- [fermion] (c)
        -- [fermion] (d) -- [fermion] (e) -- [fermion] (f),
    (b) -- [photon,half left] (d),
    (c) -- [photon,half left] (e),
};
]]
),
feynCMd("d1",
   [[
   \vertex [dot] (a) {};
  \vertex [dot, right=of a] (b) {}; 
  \diagram* {
  (a) -- [photon]  (b),
  (a) -- [fermion, half left]  (b),
  (b) -- [fermion, half left]  (a),
  };
]]
),
feynCMd("d2",
   [[
  \vertex [dot] (a) {};
  \vertex [above=0.5of a] (a2) ;
  \vertex [dot,below=of a] (b) {}; 
  \vertex [below=0.5of b] (b2) ;
  \diagram* {
    (a) -- [photon]  (b),
    (a) -- [fermion, half left] (a2) 
        -- [fermion, half left] (a);
    (b) -- [fermion, half left] (b2) 
        -- [fermion, half left] (b);
   };
]]
),
feynCMd("d3",
   [[
  \vertex [dot] (a) {};
  \vertex [dot,above right=of a] (b) {}; 
  \vertex [dot,below right=of b] (c) {}; 
  \vertex [dot,below left=of c] (d) {}; 
  \diagram* {
   (a) -- [fermion, bend left]  (b)
       -- [fermion,bend left] (c)
       -- [fermion, bend left] (d)
       -- [fermion, bend left] (a),
   (a) -- [photon,bend left] (d),
   (b) -- [photon, bend right] (c),
   };
]]
),
feynCMd("d4",
   [[
  \vertex [dot] (a) {};
  \vertex [dot, right=of a] (b) {}; 
  \vertex [dot, below=of b] (c) {}; 
  \vertex [dot, below=of a] (d) {}; 
  \diagram* {
    (a) -- [photon]  (d),
    (b) -- [photon]  (c),
    (a) -- [fermion,bend left]  (b)
        -- [fermion,bend left] (a),
    (c) -- [fermion,bend left]  (d)
        -- [fermion,bend left] (c),
  };
]]
),

s({trig="fmm", wordTrig=true},
				fmta(
[[
\begin{tikzpicture}[baseline={([yshift=-0.5ex]current 
                            bounding box.center)}]
  \begin{feynman}[scale=1,transform shape]
    \vertex [<>] (<>) {<>};
    \vertex [<>] (<>) {<>}; 
    \diagram* {
      (<>) -- [<>]  (<>),
    };
  \end{feynman}
\end{tikzpicture}
]],
{ i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9)}
)
),

s({trig="intl", wordTrig=true},
			t(
[[
\begin{tikzpicture}[baseline=(a.base)]
          \begin{feynman}[scale=1,transform shape]
            \vertex (a);
            \vertex [left=of a] (b); 
            \diagram* {
              (a) -- [photon]  (b),
            };
          \end{feynman}
        \end{tikzpicture}
]]
)
),

}
