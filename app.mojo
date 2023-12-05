from FireApi import Route, HTTPMicroService, Response, Request


@value
struct MyRoute(Route):
    var route: String
    var method: String

    fn func(self, request: Request) raises -> Response:
        return Response(
            200,
            "Hello: " + request.body,
        )

    fn get_method(self) -> String:
        return self.method

    fn get_route(self) -> String:
        return self.route


fn main() raises -> None:

    let app = HTTPMicroService()

    let my_route = MyRoute("/", "GET")

    app.run[MyRoute](route=my_route)
