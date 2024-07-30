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
