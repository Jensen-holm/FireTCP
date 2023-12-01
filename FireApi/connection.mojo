from python import PythonObject


struct Connection:
    var conn: PythonObject
    var addr: PythonObject

    fn __init__(inout self, connAddr: PythonObject) raises -> None:
        self.conn = connAddr[0]
        self.addr = connAddr[1]
