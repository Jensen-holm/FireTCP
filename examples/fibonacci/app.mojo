from FireTCP import TCP


fn nth_fibonacci(n: Int) -> Int:
    if n == 0 or n == 1:
        return n

    var fibs: List[Int] = List(0, 1)
    for _ in range(2, n + 1):
        var fib = fibs[0] + fibs[1]
        fibs[0] = fibs[1]
        fibs[1] = fib

    return fibs[1]


@value
struct Fibonacci(TCP.Service):
    fn func(self, req: TCP.Request) raises -> TCP.Response:
        try:
            var n = atol(req.body())
            var fib = nth_fibonacci(n)
            return TCP.Response(body=String(n) + "th fibonacci: " + String(fib))
        except Error:
            return TCP.Response(
                body="Error computing the nth fibonacci of '" + req.body() + "'"
            )


fn main() raises -> None:
    var server = TCP.TCPLite[Fibonacci](
        service=Fibonacci(),
        port=9090,
        host_addr="127.0.0.1",
    )

    server.serve()
