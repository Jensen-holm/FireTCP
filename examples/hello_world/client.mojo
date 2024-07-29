from FireTCP import TCPRequest, TCPResponse
from FireTCP.clients import TCPClient


fn main() raises -> None:
    var client = TCPClient(
        port=9090,
        host_name="127.0.0.1",
    )

    var request = TCPRequest(
        body="Hello FireTCP",
    )

    var response = client.send_request(request)
    print(response.body())
