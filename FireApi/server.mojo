from python import Python, PythonObject
from FireApi.connection import Connection
from FireApi.endpoint import EndPoint
from FireApi.request import Request
from FireApi.response import Response
from FireApi.modules import _load_socket_module


struct Server:
    var _socket: PythonObject
    var _py_socket: PythonObject
    var _host_name: PythonObject
    var _host_addr: StringLiteral
    var _port: Int

    fn __init__(
        inout self: Self, host_addr: StringLiteral = "", port: Int = 8080
    ) raises -> None:
        self._port = port
        self._host_addr = host_addr
        self._host_name = None
        self._py_socket = None
        self._socket = _load_socket_module()
        self._pre_run_setup()

    fn _bind_pySocket(borrowed self) raises -> None:
        try:
            _ = self._py_socket.bind((self._host_addr, self._port))
        except Exception:
            raise Error("error binding pysocket to hostAddr & port")

    fn _close_socket(borrowed self) raises -> None:
        _ = self._py_socket.close()

    fn _print_running_message(borrowed self) raises -> None:
        print("listening at http://" + self._host_name.__str__() + "/" + self._port)

    fn _accept_connection(borrowed self) raises -> Connection:
        let connAddr = self._py_socket.accept()
        return Connection(connAddr)

    fn _pre_run_setup(inout self) raises -> None:
        self._host_name = self._socket.gethostbyname(
            self._socket.gethostname(),
        )

        self._py_socket = self._socket.socket(
            self._socket.AF_INET,
            self._socket.SOCK_STREAM,
        )

    fn run[T: EndPoint](borrowed self: Self, route: T) raises -> None:
        self._bind_pySocket()
        self._print_running_message()
        _ = self._py_socket.listen()

        # accept incoming connections
        let connection: Connection = self._accept_connection()
        while True:
            # recieve data from the accepted connection
            let request_str: String = connection.revieve_data()  # 1024 bytes by default
            if not request_str:
                break

            # make a request object that can be passed into the users endpoint
            let request = Request(body=request_str)

            if not request.is_valid():
                let response = Response(
                    status_code=505,
                    body="bad request, not valid",
                )
                # return to the user
                break

            # if the request is the wrong kind of request for this api
            if route.get_method() != request.method():
                break

            # if it is valid

            break

        connection.close()
        self._close_socket()
