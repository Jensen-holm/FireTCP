from python import PythonObject
from .common_messages import *


trait Resp(Copyable):
    @always_inline
    fn body(self) -> String:
        ...

    fn to_bytes(
        self, py_builtins: PythonObject, encoding: StringLiteral = "utf-8"
    ) raises -> PythonObject:
        ...

    @always_inline
    fn log_message(
        self, execution_time: Float64, raw_request: String, symbol: String = ""
    ) -> String:
        ...

    @always_inline
    fn print_log_message(
        self, execution_time: Float64, raw_request: String, symbol: String
    ) -> None:
        ...
