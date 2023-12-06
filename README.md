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
Step 3: Once you have made a project and cloned the FireApi you can get coding! Check out the example in examples/hello_fireapi.🔥


### HTTP Micro Service Hello World
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
        time.sleep(1)
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

```py

```


FireApi HTTP Micro Servers can only run one route at a time, that route has to be a struct that inherits from the Route trait defined in the FireApi.route file.
