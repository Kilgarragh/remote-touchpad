{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  hardeningDisable = [ "fortify" ];
  packages = with pkgs; [ #buildInputs = with pkgs; [
    go_1_24
  ];

  buildInputs = with pkgs.xorg; [
    libXi
    libXrandr
    libXt
    libXtst
  ];
  
  CFLAGS="-I${pkgs.glibc.dev}/include";
  LDFLAGS="-L${pkgs.glibc}/lib";
}
