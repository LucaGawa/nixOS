{
  pkgs,
  lib,
  ...
}: {
  # vim.theme.enable = true;
  # vim.theme.name = "gruvbox";
  # vim.theme.sytle = "dark";
  #
  # vim.languages.nix.enable = true;
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        theme = {
          enable = true;
          name = "nord";
          style = "dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        snippets.luasnip.enable = true;
        comments.comment-nvim.enable = true;
        # vimtex.enable = true;
        assistant.copilot.enable = true;
        assistant.chatgpt.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;
          lua.enable = true;
          julia.enable = true;
          markdown.enable = true;
          r.enable = true;     
          # latex.enable = true;
        };
      };
    };
  };
} 
