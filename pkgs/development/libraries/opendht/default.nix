{ stdenv, fetchFromGitHub
, cmake, pkg-config
, asio, nettle, gnutls, msgpack, readline, libargon2
}:

stdenv.mkDerivation rec {
  pname = "opendht";
  version = "2.1.3";

  src = fetchFromGitHub {
    owner = "savoirfairelinux";
    repo = "opendht";
    rev = version;
    sha256 = "0qz9mdkanz4vd38bdpwvcwvbpzf19i6019rmqw3k1vh5mh22ljhr";
  };

  nativeBuildInputs =
    [ cmake
      pkg-config
    ];

  buildInputs =
    [ asio
      nettle
      gnutls
      msgpack
      readline
      libargon2
    ];

  outputs = [ "out" "lib" "dev" "man" ];

  meta = with stdenv.lib; {
    description = "A C++11 Kademlia distributed hash table implementation";
    homepage    = "https://github.com/savoirfairelinux/opendht";
    license     = licenses.gpl3Plus;
    maintainers = with maintainers; [ taeer olynch thoughtpolice ];
    platforms   = platforms.linux;
  };
}
