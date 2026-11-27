NixOS system configuration.

---

Include it on your hosts with:

```nix
den.aspects.<hostname>.includes = [ den.aspects.system ];
```

Also include [hardware](./hardware) needed for your machine.
