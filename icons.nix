{ pkgs }:

pkgs.stdenv.mkDerivation {
				name = "nordzy";

				src = pkgs.fetchurl {
								url = "https://github.com/alvatip/Nordzy-icon/releases/download/1.8.6/Nordzy-cyan--dark_panel.tar.gz";
								sha256 = "0l6a2hb8i5996hcpcx0iz9rwl5kndr7cyd5p2nn48gpml69svqca";
								};

								dontUnpack = true;

								installPhase = ''
								mkdir -p $out
								tar -zxf $src -C $out/
								'';
								}
