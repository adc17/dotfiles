{ pkgs ? import <nixpkgs> {} }:

with pkgs; (import <nixos-unstable> {}).neovim.override {
  configure = {
    customRC = lib.readFile ~/.config/nvim/init.vim;
    vam.knownPlugins = pkgs.vimPlugins;
    vam.pluginDictionaries = [
      { name = "fzf-vim"; }
      { name = "fzfWrapper"; }
    ];
  };
  #  plug.plugins = with pkgs.vimPlugins; [fzf-vim fzfWrapper];
}
