from python import Python


struct EndPoint:
    var route: String

    fn __init__(inout self, route: String, method: String = "GET") -> None:
        self.route = route
    
    # create custom method here named fn route_method()
    fn route_method(inout self, x: Int) -> Int:
        return x * 5


fn _load_builtins_module() raises -> PythonObject:
    try:
        let py = Python.import_module("builtins")
        return py
    except:
        raise("error loading python builtins module.")


fn _load_socket_module() raises -> PythonObject:
    try:
        let socket_module = Python.import_module("socket")
        return socket_module
    except:
        raise("error loading python socket module.")


fn _create_server(inout socket_module: PythonObject) raises -> PythonObject:
    try:
        var server = socket_module.socket(
            socket_module.AF_INET,
            socket_module.SOCK_STREAM,
        )
        return server
    except:
        raise("error creating socket server.")


fn _print_run_message(host: String, port: Int) -> None:
    let message = "FireApi server listening @ http://"
    print(message + host + ":" + port + "/")


fn FireApi(host: String = "127.0.0.1", port: Int = 5000) raises -> None:
    # try loading builtins module
    let py = Python.import_module("builtins")
    # try loading socket module
    let socket_module = Python.import_module("socket")

    _print_run_message(host, port)
    while True:
        try:
            let socket_module = Python.import_module("socket")
            let server = socket_module.socket(
                socket_module.AF_INET,
                socket_module.SOCK_STREAM,
            )
            _ = server.bind((host, port))
        except:
            raise("error listening.")
