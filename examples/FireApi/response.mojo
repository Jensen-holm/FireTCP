struct Response:
    var status_code: Int
    var body: String

    fn __init__(inout self, status_code: Int, body: String) raises -> None:
        self.status_code = status_code
        self.body = body
