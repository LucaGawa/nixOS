{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim-remote #backwards search latex
    #luaformatter
    ltex-ls #lsp server latex
    texlab #lsp server latex
    alejandra # nix code formatter
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars # syntax highlighting
      comment-nvim # comment and uncomment code
      nvim-tree-lua # file explorer
      # coc-pyright
      # vim-latex-live-preview
      vimtex # LaTeX plugin
      luasnip # Snipets
      deoplete-nvim
      nvim-lspconfig #communtication with language server
      # lsp-zero-nvim
      nvim-cmp #completion
      cmp-nvim-lsp
      cmp_luasnip
      friendly-snippets # bunch of snippets
      neodev-nvim
      gitsigns-nvim
      # better-escape-nvim
      nord-nvim
      telescope-nvim
      harpoon
      undotree
      vim-fugitive
      null-ls-nvim
      nvim-dap #for debugger
      nvim-dap-python
      nvim-dap-ui
      vim-nix
      lualine-nvim
      lualine-lsp-progress
      nvim-julia-autotest
      # which-key-nvim
      copilot-vim
      # copilot-lua
    ];
    extraConfig = ''
      packadd! nvim-tree.lua
      lua require("nvim-tree").setup()
      autocmd FileType nix setlocal commentstring=#\ %s
           	set cc=80
           	set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
           	if &diff
             	colorscheme blue
           	endif

      " This is necessary for VimTeX to load properly. The "indent" is optional.
      " Note that most plugin managers will do this automatically.
      filetype plugin indent on

      " This enables Vim's and neovim's syntax-related features. Without this, some
      " VimTeX features will not work (see ":help vimtex-requirements" for more
      " info).
      syntax enable
      " Use Zathura as the default VimTeX PDF viewer
      let g:vimtex_view_method = 'zathura'
      let g:latex_view_general_viewer = 'zathura'
      let g:vimtex_compiler_progname = 'nvr'
      let g:vimtex_quickfix_method = 'pplatex'
      let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \]
      luafile ${./nvim/nvim.lua}
      colorscheme nord
    '';
  };
}
