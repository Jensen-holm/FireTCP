from FireApi.server import Server
from FireApi.response import Response
from FireApi.request import Request
from FireApi.endpoint import EndPoint
from utils.vector import InlinedFixedVector


struct Index(EndPoint):
    var route: String
    var has_get: Bool
    var has_post: Bool

    fn __init__(inout self, has_get: Bool = True, has_post: Bool = False, borrowed route: String = "/") raises -> None:
        self.route = route
        self.has_get = has_get
        self.has_post = has_post
    
    fn get(borrowed self, request: Request) raises -> Response:
        return Response(
            status_code=200,
            body=" --- Hello FireApi ---\nRequest Method: 'GET'\nRequest Body: " + request.body,
        )

    fn post(borrowed self, request: Request) raises -> Response:
        return Response(
            status_code=404,
            body="this endpoint has no method 'POST'"
        )

    fn __copyinit__(inout self, other: Self) -> None:
        self.route = other.route
        self.has_get = other.has_get
        self.has_post = other.has_post


fn main() raises -> None:
    let app = Server(
        endpoint=Index(),
    )

    app.run()
