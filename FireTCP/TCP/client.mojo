from ..modules import PyModules
from ..client import Cli
from .request import Request
from .response import Response


struct Client(Cli):
    var _modules: PyModules
    var _client_socket: PythonObject
    var host_name: StringLiteral
    var port: Int

    fn __init__(inout self, host_name: StringLiteral, port: Int) raises -> None:
        self._modules = PyModules()
        self._client_socket = self._modules.socket.socket()
        self.host_name = host_name
        self.port = port

    fn send_request(self, request: Request) raises -> Response:
        _ = self._client_socket.connect((self.host_name, self.port))
        var request_bytes = request.to_bytes(
            py_builtins=self._modules.py,
        )

        _ = self._client_socket.send(request_bytes)
        var raw_response = self._client_socket.recv(1024).decode()

        _ = self._client_socket.close()
        return Response(body=str(raw_response))
