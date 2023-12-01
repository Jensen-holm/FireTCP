from python import Python, PythonObject
from FireApi.modules import _load_socket_module
from FireApi.connection import Connection


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


    fn _print_running_message(borrowed self) -> None:
        print("listening at http://" + self._hostName + "/" + self._port)

    
    fn _accept_connection(borrowed self) raises -> Connection:
        let connAddr = self._pySocket.accept()
        return Connection(connAddr)


    fn run(borrowed self) raises -> None:
        self._print_running_message()
        _ = self._pySocket.listen()
        let connection = self._accept_connection()
