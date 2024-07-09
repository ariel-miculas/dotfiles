# Setup
Install [nix](https://nixos.org/download/)
```
sh <(curl -L https://nixos.org/nix/install) --daemon
```
Install [home-manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone). See also https://nixos.wiki/wiki/Home_Manager
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

Apply the configuration:
```
home-manager switch
```
