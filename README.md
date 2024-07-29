# FireTCP

Bring your [mojo](https://www.modular.com/max/mojo) Api to the web with a simple FireTCP server!!

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi
Step 1: `$ mkdir hello_fire_api && cd hello_fire_api` <br>

Step 2: `$ curl -sS https://raw.githubusercontent.com/Jensen-holm/FireTCP/main/install.sh | bash`

Step 3: Once you have made a project and cloned the FireApi you can get coding! Check out the examples below or in the examples directory before getting started or [read this tutorial I made on medium](https://medium.com/@jensen.dev.01/socket-programming-in-mojo-e113f6c8cbef).

### Example code

app.mojo
```mojo
from FireTCP import TCP


@value
struct HelloService(TCP.Service):
    fn func(self, req: TCP.Request) raises -> TCP.Response:
        return TCP.Response(
            body="You sent the following data: " + req.body(),
        )


fn main() raises -> None:
    var server = TCP.TCPLite[HelloService](
        service=HelloService(),
        port=9090,
        host_addr="127.0.0.1",
    )

    server.serve()
```

client.mojo
```mojo
from FireTCP import TCP


fn main() raises -> None:
    var client = TCP.Client(
        port=9090,
        host_name="127.0.0.1",
    )

    var request = TCP.Request(
        body="Hello FireTCP",
    )

    var response = client.send_request(request)
    print(response.body())
```

output: "You sent the following data: Hello FireTCP"
