from python import PythonObject
from .common_messages import INVLAID_METHOD_MESSAGE


trait Req(Copyable):
    @always_inline
    fn body(self) -> String:
        ...

    fn to_bytes(self, py_builtins: PythonObject) raises -> PythonObject:
        ...
