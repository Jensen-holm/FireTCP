struct Response:
    var statusCode: Int
    var body: String

    fn __init__(inout self, statusCode: Int, body: String) raises -> None:
        self.statusCode = statusCode
        self.body = body
