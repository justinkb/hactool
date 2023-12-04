{ stdenv
, fetchFromGitHub
, mbedtls
}:
stdenv.mkDerivation {
  pname = "hactool";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "justinkb";
    repo = "hactool";
    rev = "4f5b0b6f6c4f84eb372d1f27a4130eda7c897463";
    hash = "sha256-rhgyE8/VbmQNE7P1sa7vB48OJ0iC0VC8FWkKZGVtwg8=";
  };

  buildInputs = [
    mbedtls
  ];

  buildPhase = ''
    sed -i '/.\/mbedtls\//d' Makefile
    cp config.mk{.template,}
    make hactool
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hactool $out/bin
  '';
}
