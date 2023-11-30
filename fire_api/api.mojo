from python import Python, PythonObject


fn _load_socket_module() raises -> PythonObject:
    try:
        let socket = Python.import_module("socket")
        return socket
    except Exception:
        raise Error("error loading python socket module.")

struct FireApi:
    var socket: PythonObject
    var pySocket: PythonObject
    var hostName: String
    var hostAddr: StringLiteral
    var port: Int

    fn __init__(
        inout self, 
        hostAddr: StringLiteral = "127.0.0.1", 
        port: Int = 8080,
        ) raises -> None:
        self.socket = _load_socket_module()
        self.port = port
        self.hostAddr = hostAddr
        self.pySocket = None
        self.hostName = ""

        self.pySocket = self.socket.socket(
            self.socket.AF_INET,
            self.socket.SOCK_STREAM,
        )


    fn bind(borrowed self) raises -> None:
        _ = self.pySocket.bind((self.hostAddr, self.port))
