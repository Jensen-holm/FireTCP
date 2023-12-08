# FireApi

Bring your [mojo]() AI model to the web with a simple HTTP FireApi server!!
FireApi is an HTTP API for the AI programming language [mojo]()

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi
Step 1: `$ mkdir hello_fire_api && cd hello_fire_api` <br>
Step 2: `$ curl -sS https://raw.githubusercontent.com/Jensen-holm/FireApi/main/install.sh | bash`
Step 3: Once you have made a project and cloned the FireApi you can get coding! Bellow is the hello world.


### HTTP Micro Service Hello World

in a file called service.🔥
```py
from FireApi import Route, HTTPMicro, Response, Request

@value
struct MyRoute(Route):
    var endpoint: String
    var method: String

    fn func(self, request: Request) raises -> Response:
        let response = Response(
            status_code=200,
            body="You sent: " + request.body,
        )
        return response

    fn get_method(self) -> String:
        return self.method

    fn get_endpoint(self) -> String:
        return self.endpoint


fn main() raises -> None:
    let service = HTTPMicro(port=9090)

    let main_route = MyRoute(
        endpoint="/index",
        method="GET",
    )

    service.run[MyRoute](route=main_route)
```

### Client Hello World

in a file called client.🔥
```py
from FireApi import Client, Request, Response


fn main() raises -> None:
    let client = Client(
        host_name="127.0.0.1",
        port=9090,
        endpoint="/index",
    )

    let request = Request(
        body="hello world",
    )

    let response: Response = client.send_request(
        request=request,
    )

    print(response.body)
```

run the service first using the mojo cli: `mojo run server.🔥` <br>
then, run the client to connect to the service: `mojo run client.🔥` <br>

### Limitations

The HTTPLite server is built to handle one endpoint, hence the word Lite in the name. This is on purpose as sometmes this is all you need. Use HTTPLite if you want a litght weight HTTP server without extra bloat.

FireApi HTTP Micro Servers can only run one route at a time, that route has to be a struct that inherits from the Route trait defined in the FireApi.route file.
