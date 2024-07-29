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
