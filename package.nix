{
  rustPlatform,
  lib,
  fetchFromGitHub,
  fetchurl,
  pkgs,
}:
rustPlatform.buildRustPackage rec {
  pname = "near-cli-rs";
  version = "0.25.1";

  src = fetchFromGitHub {
    owner = "near";
    repo = "near-cli-rs";
    tag = "v${version}";
    hash = "sha256-r/DyZn2eDB94iBT7StRVm5C6BEVJLbSbnjcE/86kYRQ=";
  };
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  NEAR_RELEASE_BUILD = "release";

  OPENSSL_NO_VENDOR = 1; # we want to link to OpenSSL provided by Nix

  doCheck = false; # needs network

  buildInputs = with pkgs; [
    openssl
    systemd
  ];

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  meta = with lib; {
    description = "near CLI is your human-friendly companion that helps to interact with NEAR Protocol from command line.";
    homepage = "https://github.com/near/near-cli-rs";
    license = [
      licenses.asl20
      licenses.mit
    ];
    mainProgram = "near";
  };
}
