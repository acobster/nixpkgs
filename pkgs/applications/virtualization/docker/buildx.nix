{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "docker-buildx";
  version = "0.13.1";

  src = fetchFromGitHub {
    owner = "docker";
    repo = "buildx";
    rev = "v${version}";
    hash = "sha256-mesFwYgDCZ44/EJ31mzx9yLeMyV2bXpxaNSx6L3BQG0=";
  };

  doCheck = false;

  vendorHash = null;

  ldflags = [
    "-w" "-s"
    "-X github.com/docker/buildx/version.Package=github.com/docker/buildx"
    "-X github.com/docker/buildx/version.Version=v${version}"
  ];

  installPhase = ''
    runHook preInstall
    install -D $GOPATH/bin/buildx $out/libexec/docker/cli-plugins/docker-buildx

    mkdir -p $out/bin
    ln -s $out/libexec/docker/cli-plugins/docker-buildx $out/bin/docker-buildx
    runHook postInstall
  '';

  meta = with lib; {
    description = "Docker CLI plugin for extended build capabilities with BuildKit";
    homepage = "https://github.com/docker/buildx";
    license = licenses.asl20;
    maintainers = with maintainers; [ ivan-babrou developer-guy ];
  };
}
