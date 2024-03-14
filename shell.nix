{pkgs, ...}:
pkgs.mkShellNoCC {
  packages = [
    pkgs.just
  ];
}
