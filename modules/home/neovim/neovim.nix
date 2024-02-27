{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = "\n${builtins.readFile ./base.lua}\n";
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter
      {
        plugin = lualine-nvim;
        type = "lua";
        config = "require('lualine').setup({})";
      }
      {
        plugin = neogit;
        type = "lua";
        config = "require('neogit').setup({})";
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = "require('ibl').setup({})";
      }
      {
        plugin = auto-save-nvim;
        type = "lua";
        config = "require('auto-save').setup({})";
      }
      {
        plugin = base16-nvim;
				config = "colorscheme base16-tokyo-city-dark";
      }
			{
				plugin = telescope-nvim;
        type = "lua";
        config = "require('telescope').setup({})";
			}
			{
				plugin = telescope-fzf-native-nvim;
        type = "lua";
        config = "require('telescope').load_extension('fzf')";
			}
			{
				plugin = hop-nvim;
        type = "lua";
        config = "require('hop').setup({})";
			}
			{
				plugin = nvim-autopairs;
        type = "lua";
        config = "require('nvim-autopairs').setup({})";
			}
			luasnip
			cmp_luasnip
			cmp-nvim-lsp
			cmp-buffer
			cmp-cmdline
			cmp-nvim-lsp-signature-help
			cmp-path
			{
				plugin = nvim-cmp;
        type = "lua";
				config = "${builtins.readFile ./cmp.lua}";
			}
    ];
  };
}
