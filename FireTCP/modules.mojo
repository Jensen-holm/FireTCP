from python import Python, PythonObject


struct PyModules:
    var py: PythonObject
    var socket: PythonObject

    fn __init__(inout self) raises -> None:
        self.py = self.__load_builtins_module()
        self.socket = self.__load_socket_module()

    @staticmethod
    fn __load_socket_module() raises -> PythonObject:
        var socket = Python.import_module("socket")
        return socket

    @staticmethod
    fn __load_builtins_module() raises -> PythonObject:
        var builtins = Python.import_module("builtins")
        return builtins
