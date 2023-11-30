from python import Python, PythonObject



fn FireApi() raises -> None:
    let socket = Python.import_module("socket")
    let host = socket.gethostbyname("").to_string()
    let py_socket = socket.socket(
        socket.AF_INET,
        socket.SOCK_STREAM,
    )
    _ = py_socket.bind(("127.0.0.1", 8080)) 
