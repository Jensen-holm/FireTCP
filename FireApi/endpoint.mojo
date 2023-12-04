from FireApi.response import Response
from FireApi.request import Request


trait EndPoint(Copyable):
    fn get(borrowed self, request: Request) raises -> Response:
        ...

    fn post(borrowed self, request: Request) raises -> Response:
        ...
