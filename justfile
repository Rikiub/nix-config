default:
    @just --list --unsorted

# unix

is_nixos := `grep -q '^ID=nixos' /etc/os-release && echo true || echo false`
nh_cmd := if os() == "macos" { "nh darwin" } else if is_nixos == "true" { "nh os" } else { "nh home" }

[doc("Build and activate the new configuration")]
[group("unix")]
switch host="":
    @just sync
    {{ nh_cmd }} switch .#{{ host }}

[doc("Update flake inputs and external packages with topgrade")]
[group("unix")]
update *args:
    @just sync
    -topgrade {{ args }}

[doc("Shell to a build environment")]
[group("unix")]
develop name="":
    nix develop .#{{ name }}

[doc("Sync flake inputs")]
[group("unix")]
[private]
sync:
    @git add .
    nix run .#write-flake

[doc("Load configuration in a repl")]
[group("unix")]
repl:
    {{ nh_cmd }} repl .

[doc("Collect all garbage and gcroots from the Nix store")]
[group("unix")]
clean:
    nh clean all --optimise

# nixos

[doc("Build and activate the new configuration (until next reboot)")]
[group("nixos")]
test host="":
    @just sync
    nh os test .#{{ host }}

[doc("Rollback to a previous generation")]
[group("nixos")]
rollback:
    nh os rollback .

[doc("Build and run NixOS VM image of current host")]
[group("nixos")]
vm:
    mkdir -p tmp/
    cd tmp/ && nh os build-vm --run

[doc("List available generations from profile path")]
[group("nixos")]
info:
    nh os info

# quality

[doc("Check flake formatting and linting")]
[group("quality")]
check:
    nix flake check

[doc("Fix flake formatting and linting")]
[group("quality")]
format:
    nix fmt

# misc

[doc("Search for a package in Nixpkgs")]
[group("misc")]
search *args:
    nh search {{ args }}

[doc("Open configuration directory on application")]
[group("misc")]
open app=env("EDITOR", ""):
    @{{ app }} .

[doc("Print flake directory")]
[group("misc")]
pwd:
    @pwd

# git

[doc("Run flake directory git")]
[group("git")]
git *args:
    -@git {{ args }}

[doc("Show status")]
[group("git")]
status:
    @git status --short

[doc("Show commit graph")]
[group("git")]
log max="20":
    @git log --graph --decorate --oneline -n {{ max }} --all

[doc("Commit + push in one go")]
[group("git")]
save message="auto-commit":
    @git add .
    -git commit -m "{{ message }}"
    -git push
