from FireApi import Server, EndPoint, Response, Request


@value
struct MainRoute(EndPoint):
    var route: String
    var method: String

    fn get(borrowed self, request: Request) raises -> Response:
        return Response(
            status_code=200,
            body=" --- Hello FireApi ---\nRequest Method: 'GET'\nRequest Body: "
            + request.body,
        )

    fn post(borrowed self, request: Request) raises -> Response:
        return Response(status_code=404, body="this endpoint has no method 'POST'")

    fn is_get(borrowed self) -> Bool:
        return self.method == "GET"

    fn is_post(borrowed self) -> Bool:
        return self.method == "POST"


fn main() raises -> None:
    let main_route = MainRoute(
        method="GET",
        route="/",
    )

    let app = Server()
    app.run[MainRoute](route=main_route)
