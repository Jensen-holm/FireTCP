from python import Python, PythonObject
from FireApi.connection import Connection
from FireApi.endpoint import EndPoint
from FireApi.modules import _load_socket_module


struct Server:
    var _socket: PythonObject
    var _pySocket: PythonObject
    var _hostName: PythonObject
    var _hostAddr: StringLiteral
    var _port: Int
    var _endpoint: EndPoint

    fn __init__(inout self, endpoint: EndPoint, hostAddr: StringLiteral = "", port: Int = 8080) raises -> None:
        self._socket = _load_socket_module()
        self._port = port
        self._hostAddr = hostAddr
        self._hostName = self._socket.gethostbyname(
            self._socket.gethostname(),
        )

        self._pySocket = self._socket.socket(
            self._socket.AF_INET,
            self._socket.SOCK_STREAM,
        )
        self._endpoint = endpoint
        self._bind_pySocket()

    fn __copyinit__(inout self, other: Self) -> None:
        self._socket = other._socket
        self._pySocket = other._pySocket
        self._hostName = other._hostName
        self._hostAddr = other._hostAddr
        self._port = other._port
        self._endpoint = other._endpoint
    
    fn set_endpoint(inout self, endpoint: EndPoint) -> None:
        self._endpoint = endpoint

    fn _bind_pySocket(borrowed self) raises -> None:
        try:
            _ = self._pySocket.bind((self._hostAddr, self._port))
        except Exception:
            raise Error("error binding pysocket to hostAddr & port")

    fn _close_socket(borrowed self) raises -> None:
        _ = self._pySocket.close()

    fn _print_running_message(borrowed self) raises -> None:
        print("listening at http://" + self._hostName.__str__() + "/" + self._port)

    fn _accept_connection(borrowed self) raises -> Connection:
        let connAddr = self._pySocket.accept()
        return Connection(connAddr)

    fn run(borrowed self) raises -> None:
        self._print_running_message()
        _ = self._pySocket.listen()

        # accept incoming connections
        let connection: Connection = self._accept_connection()
        while True:
            # recieve data from the accepted connection
            let data = connection.revieve_data()  # 1024 bytes by default
            if not data:
                break

            # make a request object that can be passed into the users endpoint

            # run the request through the users endpoint function to get a response

            # turn that response into something that can be sent over http

            # return it to the client

            # end loop
            break

        connection.close()
        self._close_socket()
