{ lib, stdenv, fetchurl, cmake, pkg-config }:

stdenv.mkDerivation rec {
  name = "resolv_wrapper-1.1.7";

  src = fetchurl {
    url = "mirror://samba/cwrap/${name}.tar.gz";
    sha256 = "sha256-Rgrn/V5TSFvn3ZmlXFki8csWNrnoghmB1JrRZQfIoHQ=";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  meta = with lib; {
    description = "A wrapper for the user, group and hosts NSS API";
    homepage = "https://git.samba.org/?p=uid_wrapper.git;a=summary;";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
