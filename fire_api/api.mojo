from python import Python, PythonObject


fn _load_socket_module() raises -> PythonObject:
    try:
        let socket = Python.import_module("socket")
        return socket
    except Exception:
        raise Error("error loading python socket module.")



fn FireApi() raises -> None:
    let socket = _load_socket_module()
    let host = socket.gethostbyname("").to_string()
    let py_socket = socket.socket(
        socket.AF_INET,
        socket.SOCK_STREAM,
    )
    _ = py_socket.bind(("127.0.0.1", 8080)) 
