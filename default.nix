with import <nixpkgs> {}; {
	devEnv = stdenv.mkDerivation {
		name = "hello-world";
		src = ./.;
		buildInputs = [ go ];
		buildPhase = ''
			go build -o ./hello
		'';
		installPhase = ''
			mkdir -p "$out/bin"
			cp ./hello "$out/bin/"
		'';
	};
}
