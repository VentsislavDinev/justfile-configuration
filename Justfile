build-machine machine:
  nix build .#nixosConfigurations.{{machine}}.config.system.build.toplevel

build-vm machine:
  nix build .#nixosConfigurations.{{machine}}.config.system.build.vm

start-vm machine: (build-vm machine)
  ./result/bin/run-nixos-vm