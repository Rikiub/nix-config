<p align="center">
    <img src="./assets/logo.webp" width="200" height="200">
</p>

My personal future-proof **Nix** configuration built with the [den](https://den.denful.dev/) framework.

Should work in **NixOS** and **home-manager** standalone.

## Host Setup

Before switch on a new machine, please create a [host](./modules/hosts) including all the aspects you need.

---

On **NixOS** distros, you need take in account:

- Include [system](./modules/system/+system.nix) to get core configuration.
- Include [hardware](./modules/system/hardware) needed for your machine.

## Installation

### NixOS

```bash
sudo nixos-rebuild switch --flake /your/flake/path
```

## Workflow

The main way to interact with the configuration is from the [justfile](./justfile).

- Run `just` in the flake directory and see all available commands.
- Run [nx](./modules/defaults/justfile/helper.nix) wrapper, which allows access to flake [justfile](./justfile) from anywhere.
