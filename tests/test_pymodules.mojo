from FireTCP.modules import PyModules
from testing import assert_true


fn test_py_modules() raises -> None:
    """
    Tests the __init__() method of PyModules struct that loads the python socket and builtins packages.
    """
    _ = PyModules()
