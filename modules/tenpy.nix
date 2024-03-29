# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  "lxml" = super.buildPythonPackage rec {
    pname = "lxml";
    version = "5.1.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/2b/b4/bbccb250adbee490553b6a52712c46c20ea1ba533a643f1424b27ffc6845/lxml-5.1.0.tar.gz";
      sha256 = "1jk4jny89vyrfb6dkpbh1cqwqfiwgzq1xi4kwrlf8669wvb6xsiy";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "tenpy" = super.buildPythonPackage rec {
    pname = "tenpy";
    version = "0.1";
    src = ./.cache/pip/wheels/3e/68/75/86301e95befc134295fa7fe93ad335a166390b09158ceeb19c/tenpy-0.1-py3-none-any.whl;
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."lxml"
    ];
  };
}
