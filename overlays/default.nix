{ inputs, ...}:


{
  nixpkgs.overlays = [

  # ANYTYPE : This overlay allow more memory for anytype to build (NODE/V8 heap limit of ~2GB isn't enough)
  
    (final: prev: {
      anytype = prev.anytype.overrideAttrs (old: {
        preBuild = (old.preBuild or "") + ''
          export NODE_OPTIONS="--max-old-space-size=4096"
          '';    
      });
    })

  ];


}
