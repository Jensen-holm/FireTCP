from FireApi.server import Server
from FireApi.response import Response
from FireApi.request import Request
from FireApi.endpoint import EndPoint


"""
EXAMPLE: FireApi Server EndPoint:
FireApi currently only supports API's that have one route. This route must be 
a struct (you can call it whatever you would like) that inherits from the 
'EndPoint' trait defined in FireApi.endpoint file. 
"""


struct Index(EndPoint):
    var route: String
    var methods: DynamicVector[String]

    fn __init__(
        inout self, 
        owned methods: DynamicVector[String], 
        borrowed route: String = "/",
    ) raises -> None:
        self.route = route
        self.methods = methods

    fn func(borrowed self, request: Request) raises -> Response:
        return Response(
            statusCode=200,
            body=" --- Hello FireApi ---\nRequest body: " + request.body,
        )

    fn __copyinit__(inout self, other: Self) -> None:
        self.route = other.route
        self.methods = other.methods


fn main() raises -> None:
    let methods = DynamicVector[String](2)
    let index = Index(
        methods=methods,
    )

    let app = Server(endpoint=index)
    app.run()
