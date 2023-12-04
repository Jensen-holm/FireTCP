from FireApi.server import Server
from FireApi.response import Response
from FireApi.request import Request
from FireApi.endpoint import EndPoint


@value
struct Index(EndPoint):
    var route: String
    var has_get: Bool
    var has_post: Bool

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


fn main() raises -> None:
    let index_route = Index(
        has_get=True,
        has_post=False,
        route="/",
    )

    let app = Server(
        endpoint=index_route,
    )

    app.run()
