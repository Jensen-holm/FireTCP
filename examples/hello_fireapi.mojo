from FireApi import Server, EndPoint, Response, Request


@value
struct MainRoute(EndPoint):
    var route: String
    var method: String

    fn func(self: Self, request: Request) raises -> Response:
        return Response(
            status_code=200,
            body="Hello FireApi!",
        )

    fn get_method(self) -> String:
        return self.method


fn main() raises -> None:
    let app = Server()

    let main_route = MainRoute(
        route="/",
        method="GET",
    )

    app.run[MainRoute](route=main_route)
