from .response import Response
from .request import Request


trait Service(Copyable):
    fn func(self, req: Request) raises -> Response:
        ...
