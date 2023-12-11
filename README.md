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


### Simple TCP Server Fibonacci Example

this is a demonstration of a FireApi HTTPLite service that computes the kth fibonnaci number given as input
in the request body from a client.

in a file called service.🔥
```py
from FireApi import TCPService, Request, Response
from FireApi.servers import TCPServer


fn kth_fibonacci(k: Int) raises -> Int:
    if k <= 1:
        return k
    if k <= 0:
        let message = "invalid input to the kth_fib() function: '" + str(k) + "'"
        raise Error(message)
    return kth_fibonacci(k - 1) + kth_fibonacci(k - 2)


@value
struct kthFib(TCPService):
    fn func(self, req: Request) raises -> Response:
        try:
            let k: Int = atol(req.body())
            let result: Int = kth_fibonacci(k=k)
            return Response.success(
                body=str(result),
            )

        except Error:
            return Response.error(
                status_code=400,
                body="error while attempting to convert "
                + "request body into string: '"
                + str(Error)
                + "'",
            )


fn main() raises -> None:
    let fib_service = kthFib()

    var lite_server = TCPServer[kthFib](
        service=fib_service,
        port=9090,
        host_addr="127.0.0.1",
    )

    lite_server.run()
```

in a file called client.🔥
```py
from FireApi import Request, Response
from FireApi.clients import TCPClient
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

    let client = TCPClient(
        host_name="127.0.0.1",
        port=9090,
    )

    let req = Request(
        body=str(k),
    )

    let resp = client.send_request(request=req)
    if resp.status_code != 200:
        raise Error("server error: " + resp.body)

    let kth_fib = resp.body
    print(str(k) + " fibonacci = " + kth_fib)
```

run the service first using the mojo cli: `mojo run server.🔥` <br>
then, run the client to connect to the service: `mojo run client.🔥` <br>

### Roadmap

Currently simple TCP Servers / Clients like the one shown above is the only thing working. In the near future I plan on implementing clients and servers that follow HTTP so that users of FireApi can host their mojo api's on the web.
