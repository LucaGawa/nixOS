local function generateSnippet(trig, symbol)
    return s(
               {
            trig = ";" .. trig,
            snippetType = "autosnippet",
            wordTrig = false
        }, {t("\\" .. symbol)})
end

return {
    generateSnippet('a', 'alpha'), generateSnippet('A', 'Alpha'),
    generateSnippet('b', 'beta'), generateSnippet('g', 'gamma'),
    generateSnippet('G', 'Gamma'), generateSnippet('d', 'delta'),
    generateSnippet('D', 'Delta'), generateSnippet('e', 'epsilon'),
    generateSnippet('ve', 'varepsilon'), generateSnippet('e', 'epsilon'),
    generateSnippet('z', 'zeta'), generateSnippet('th', 'theta'),
    generateSnippet('vth', 'vartheta'), generateSnippet('Th', 'Theta'),
    generateSnippet('k', 'kappa'), generateSnippet('l', 'lambda'),
    generateSnippet('L', 'Lambda'), generateSnippet('m', 'mu'),
    generateSnippet('n', 'nu'), generateSnippet('x', 'xi'),
    generateSnippet('X', 'Xi'), generateSnippet('pi', 'pi'),
    generateSnippet('Pi', 'Pi'), generateSnippet('r', 'rho'),
    generateSnippet('s', 'sigma'), generateSnippet('S', 'Sigma'),
    generateSnippet('ta', 'tau'), generateSnippet('f', 'phi'),
    generateSnippet('vf', 'varphi'), generateSnippet('F', 'Phi'),
    generateSnippet('ch', 'chi'), generateSnippet('y', 'psi'),
    generateSnippet('Y', 'Psi'), generateSnippet('o', 'omega'),
    generateSnippet('O', 'Omega'), -- generateSnippet('N', 'nabla'),
    generateSnippet('h', 'eta')
    -- generateSnippet('pp', 'partial'),
}
