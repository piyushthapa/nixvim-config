{ pkgs
, ...
}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "aiken";
      src = pkgs.fetchFromGitHub {
        owner = "aiken-lang";
        repo = "editor-integration-nvim";
        rev = "master";
        sha256 = "sha256-GFJmpE5J8DNjvmoGdDpy9JWhd2g+oKoEKVphbvuBAFQ=";
      };
    })
  ];

  extraConfigLua = ''
    require'lspconfig'.aiken.setup({})
  '';
}
