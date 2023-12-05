# FireApi

Bring your [mojo]() AI model to the web with a simple HTTP FireApi server!!
FireApi is an HTTP API for the AI programming language [mojo]()

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi
Step 1: `$ mkdir hello_fire_api && cd hello_fire_api` <br>
Step 2: `git clone https://github.com/Jensen-holm/FireApi.git`

Once you have made a project and cloned the FireApi you can get coding! Here is an example of a FireApi server:


```mojo
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

```


FireApi Servers' can only run one route at a time, that route has to be a struct that inherits from the EndPoint
trait defined in the FireApi.endpoint file.
