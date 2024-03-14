{
  config,
  pkgs,
  ...
}: {
  users.users = {
    alice = {
      isNormalUser = true;
    };
    pesho = {
      isNormalUser = true;
    };
  };
}
