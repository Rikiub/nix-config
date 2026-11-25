{
  den.aspects.rosetta.homeManager = { host, ... }: {
    programs.uv.settings = {
      cache-dir = "${host.dataDrive.mount}/.uv-cache";
    };
  };
}
