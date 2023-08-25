{ lib, stdenv, fetchFromGitHub,
  autoconf, automake }:
stdenv.mkDerivation ( finalAttrs: {
  name = "qstat";
  version = "2.17";

  src = fetchFromGitHub {
    owner = "Unity-Technologies";
    repo = "qstat";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-xHWxt43jswvzpJYeJL9/QXK0tmfhVSU29PBhIliIFh4="; 
  };

  nativeBuildInputs = [ autoconf automake ];
  preConfigure = "QSTAT_VERSION=${finalAttrs.version} sh autogen.sh";

  meta = {
    mainProgram = "qstat";
    platforms = lib.platforms.linux;

    homepage = "https://github.com/Unity-Technologies/qstat";
    description = "Command-line program that displays information about Internet game servers";
    license = lib.licenses.artistic2;
  };
} )

