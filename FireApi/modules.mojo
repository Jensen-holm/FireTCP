from python import Python, PythonObject


fn _load_socket_module() raises -> PythonObject:
    try:
        let socket = Python.import_module("socket")
        return socket
    except Exception:
        raise Error("error loading python socket module.")
