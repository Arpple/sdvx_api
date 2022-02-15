let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    unstable.elixir_1_12
    heroku
  ];
}
