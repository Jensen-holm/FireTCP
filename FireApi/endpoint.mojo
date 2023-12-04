from FireApi.response import Response
from FireApi.request import Request


trait EndPoint(Copyable):
    fn func(borrowed self, request: Request) raises -> Response:
        ...
