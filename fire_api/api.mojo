from python import Python, PythonObject


fn _load_socket_module() raises -> PythonObject:
    try:
        let socket = Python.import_module("socket")
        return socket
    except Exception:
        raise Error("error loading python socket module.")


struct FireApi:
    var _socket: PythonObject
    var _pySocket: PythonObject
    var _hostName: String
    var _hostAddr: StringLiteral
    var _port: Int


    fn __init__(inout self, hostAddr: StringLiteral = "", port: Int = 8080) raises -> None:
        self._socket = _load_socket_module()
        self._port = port
        self._hostAddr = hostAddr
        self._hostName = self._socket.gethostbyname(
            self._socket.gethostname(),
        ).to_string()

        self._pySocket = self._socket.socket(
            self._socket.AF_INET,
            self._socket.SOCK_STREAM,
        )
        self._bind_pySocket()


    fn _bind_pySocket(borrowed self) raises -> None:
        try:
            _ = self._pySocket.bind((self._hostAddr, self._port))
        except Exception:
            raise Error("error binding pysocket to hostAddr & port")


    fn print_run_message(borrowed self) -> None:
        return
    

    fn run(borrowed self) raises -> None:
        _ = self.print_run_message()
        _ = self._pySocket.listen()

        let connAddr = self._pySocket.accept()
        let conn = connAddr[0]
        let addr = connAddr[1]
        print("connected by client ", addr)
