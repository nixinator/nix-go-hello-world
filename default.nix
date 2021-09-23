with  import (builtins.fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/7e9b0df.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "1ckzhh24mgz6jd1xhfgx0i9mijk6xjqxwsshnvq789xsavrmsc36";
}) {};
{
	devEnv = stdenv.mkDerivation {
		name = "hello-world";
		src = ./.;
		buildInputs = [ go ];
		buildPhase = ''
                        export GOCACHE=/tmp/
			go build -o ./hello
		'';
		installPhase = ''
			mkdir -p "$out/bin"
			cp ./hello "$out/bin/"
		'';
	};
}
