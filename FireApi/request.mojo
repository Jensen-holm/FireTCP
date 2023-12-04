struct Request:
    var body: String
    var json: String

    fn __init__(inout self, body: String, json: String) raises -> None:
        self.body = body
        self.json = json
