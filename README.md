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


### HTTPLite Fibonacci Example

this is a demonstration of a FireApi HTTPLite service that computes the kth fibonnaci number given as input
in the request body from a client.

in a file called service.🔥
```py
from FireApi import HTTPLite, Service, Request, Response


fn kth_fibonacci(k: Int) raises -> Int:
    if k <= 1:
        return k
    if not (0 < k <= 75):
        raise Error(
            "please submit a number between 1 and 75." + " you entered " + str(k)
        )
    return kth_fibonacci(k - 1) + kth_fibonacci(k - 2)


@value
struct kthFib(Service):
    var endpoint: String
    var method: String

    @always_inline
    fn get_method(self) -> String:
        return self.method

    @always_inline
    fn get_endpoint(self) -> String:
        return self.endpoint

    fn func(self, req: Request) raises -> Response:
        try:
            let k: Int = atol(req.body)
            let result: Int = kth_fibonacci(k=k)
            return Response.success(
                body=str(result),
            )

        except Error:
            return Response.malformed_request_error(
                body=str(Error),
            )


fn main() raises -> None:
    let fib_route = kthFib(
        endpoint="/kth_fibonacci",
        method="GET",
    )

    var server = HTTPLite[kthFib](
        port=9090,
        service=fib_route,
        host_addr="127.0.0.1",
    )

    server.run()

```

in a file called client.🔥
```py

m FireApi import Client, Response, Request
from sys import argv
import random


fn get_k() raises -> Int:
    let args = argv()
    if len(args) < 2:
        raise Error("enter a number for k")
    let inp = args[1]
    let k: Int = atol(inp)
    return k


fn main() raises -> None:
    let k: Int = get_k()
    let suffix = number_suffix(k)

    let client = Client(
        host_name="127.0.0.1",
        port=9090,
        endpoint="/kth_fibonnaci",
    )

    let req = Request(
        body=str(k),
        method="GET",
    )

    let resp = client.send_request(request=req)

    # with current version of FireApi, resp.status_code will always be 200
    # because I need to implement http protocol for reading responses still
    if resp.status_code != 200:
        raise Error("server error: " + resp.body)

    let kth_fib = resp.body
    print(str(k) + " fibonacci = " + kth_fib)

```

run the service first using the mojo cli: `mojo run server.🔥` <br>
then, run the client to connect to the service: `mojo run client.🔥` <br>

### Limitations

The HTTPLite server is built to handle one endpoint, hence the word Lite in the name. This is on purpose as sometmes this is all you need. Use HTTPLite if you want a litght weight HTTP server without extra bloat.

FireApi HTTP Micro Servers can only run one route at a time, that route has to be a struct that inherits from the Route trait defined in the FireApi.route file.

