{
  pkgs,
  pkgs-stable,
  ...
}: let
  my-python-packages = ps:
    with ps; [
      pandas
      numpy
      sympy
      scipy
      dbus-python #needed for eduroam installer
      jupyter
      # python311Packages.jupyter-core
      matplotlib
      pygobject3
      gst-python
      numba
      pint
      # jax
      # jaxlib-bin
      # jaxlibWithCuda
      tqdm
      # tensorflow
      pytest
      ### Machine Learning
      scikit-learn
      seaborn
      torch
      torchvision
      astropy
      ###
      # timeit
      # tenpy
      #tables
      # pymupdf
    ];
in {
  environment.systemPackages = with pkgs; [
    (pkgs-stable.python3.withPackages my-python-packages)
    mypy
    ruff
    black
    python311Packages.debugpy
    python311Packages.pip
    python311Packages.cython
    python312Packages.pyqt6
  ];
}
