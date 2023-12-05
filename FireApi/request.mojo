struct Request:
    var body: String

    fn __init__(inout self, body: String) raises -> None:
        self.body = body

    fn is_valid(borrowed self) -> Bool:
        return True

    # should only be ran if is_valid() is True
    fn method(borrowed self) -> String:
        var method: String = ""
        for i in range(len(self.body)):
            if not self.body[i]:
                break
            method += self.body[i]
        return method
