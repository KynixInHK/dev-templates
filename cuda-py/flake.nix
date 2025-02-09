{
      description = "Python 3 development environment";
      outputs = { self, nixpkgs }:
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.cudaSupport = true;
        };
      in {
        devShells.${system}.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cudatoolkit linuxPackages.nvidia_x11
            cudaPackages.cudnn
            libGLU libGL
            xorg.libXi xorg.libXmu freeglut
            xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
            ncurses5 stdenv.cc binutils
            conda
            (pkgs.python3.withPackages(ps: with ps; [
              pip
              virtualenv
              stdenv
            ]))
          ];

          shellHook = ''
              export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/:${pkgs.linuxPackages.nvidia_x11}/lib"
          '';          
        };
      };
    }
