{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
  };

  outputs = { self, nixpkgs }: 
    let
      pythonEnv = nixpkgs.python3.withPackages (ps: with ps; [ pip ]);
    in
    {
      devShell = nixpkgs.mkShell {
        buildInputs = with nixpkgs; [
          pythonEnv
          git gitRepo gnupg autoconf curl
          procps gnumake util-linux m4 gperf unzip
          cudatoolkit linuxPackages.nvidia_x11
          libGLU libGL
          xorg.libXi xorg.libXmu freeglut
          xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
          ncurses5 stdenv.cc binutils
        ];
        shellHook = ''
          export CUDA_PATH=${nixpkgs.cudatoolkit}
          export LD_LIBRARY_PATH=${nixpkgs.linuxPackages.nvidia_x11}/lib:${nixpkgs.ncurses5}/lib
          export EXTRA_LDFLAGS="-L/lib -L${nixpkgs.linuxPackages.nvidia_x11}/lib"
          export EXTRA_CCFLAGS="-I/usr/include"

          # 可选：激活Python虚拟环境
          source ${pythonEnv}/bin/activate
        '';
      };
    };
}
