from python import PythonObject
from FireTCP.common_messages import INVLAID_METHOD_MESSAGE


trait Request(Copyable):
    @always_inline
    fn body(self) -> String:
        ...

    fn to_bytes(self, py_builtins: PythonObject) raises -> PythonObject:
        ...


@value
struct TCPRequest(Request):
    var __body: String

    fn __init__(inout self, body: String) -> None:
        self.__body = body

    @always_inline
    fn body(self) -> String:
        return self.__body

    fn to_bytes(self, py_builtins: PythonObject) raises -> PythonObject:
        var byte_string = py_builtins.bytes(self.body(), "utf-8")
        return byte_string
