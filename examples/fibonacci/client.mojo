from python import Python
from FireTCP import TCP


fn main() raises -> None:
    var client = TCP.Client(
        port=9090,
        host_name="127.0.0.1",
    )

    var py = Python.import_module("builtins")
    var user_inp = py.input("n = ")

    var request = TCP.Request(
        body=user_inp,
    )

    var response = client.send_request(request)
    print(response.body())
