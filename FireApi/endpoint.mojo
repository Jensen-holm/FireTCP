from FireApi.response import Response
from FireApi.request import Request


trait EndPoint(Copyable):
    fn get(borrowed self, request: Request) raises -> Response:
        ...

    fn post(borrowed self, request: Request) raises -> Response:
        ...

    fn is_get(borrowed self) -> Bool:
        ...

    fn is_post(borrowed self) -> Bool:
        ...
