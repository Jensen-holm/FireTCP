from FireTCP.response import TCPResponse


trait TCPService(Copyable):
    fn func(self, req: TCPRequest) raises -> TCPResponse:
        ...
