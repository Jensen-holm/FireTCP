from python import Python, PythonObject


struct PyModules:
    var py: PythonObject
    var http: PythonObject
    var socket: PythonObject
    var threading: PythonObject

    fn __init__(inout self) raises -> None:
        self.py = self.__load_builtins_module()
        self.http = self.__load_http_module()
        self.threading = self.__load_threading_module()
        self.socket = self.__load_socket_module()

    @staticmethod
    fn __load_socket_module() raises -> PythonObject:
        try:
            let socket = Python.import_module("socket")
            return socket
        except Exception:
            raise Error("error loading python socket module.")

    @staticmethod
    fn __load_http_module() raises -> PythonObject:
        try:
            let http_server = Python.import_module("http.server")
            return http_server
        except Exception:
            raise Error("error loading the python http.server module.")

    @staticmethod
    fn __load_threading_module() raises -> PythonObject:
        try:
            let threading = Python.import_module("threading")
            return threading
        except Exception:
            raise Error("error loading the python threading module.")
        
    @staticmethod
    fn __load_builtins_module() raises -> PythonObject:
        try:
            let py = Python.import_module("builtins")
            return py
        except Exception:
            raise Error("error loading python builtins module.")
