from python import PythonObject


struct Connection:
    var conn: PythonObject
    var addr: PythonObject

    fn __init__(inout self, connAddr: PythonObject) raises -> None:
        self.conn = connAddr[0]
        self.addr = connAddr[1]

    fn revieve_data(borrowed self, size: Int = 1024) raises -> PythonObject:
        let data = self.conn.recv(size)
        return data

    fn close(borrowed self) raises -> None:
        _ = self.conn.close()
