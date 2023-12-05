from FireApi.response import Response
from FireApi.request import Request


trait EndPoint(Copyable):
    fn func(borrowed self, request: Request) -> Response:
        ...

    fn is_get(borrowed self) -> Bool:
        ...

    fn is_post(borrowed self) -> Bool:
        ...

    fn method(borrowed self) -> String:
        ...
