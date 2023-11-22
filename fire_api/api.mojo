from python import Python


fn FireApi(host: String, port: Int = 5000) raises -> None:
    # load nessessary modules
    let py = load_builtins()
    let socket = load_socket()


fn load_builtins() raises -> PythonObject:
    try:
        let py = Python.import_module("builtins")
        return py
    except:
        raise("error importing builtins module.")


fn load_socket() raises -> PythonObject:
    try:
        let socket = Python.import_module("socket")
        return socket
    except:
        raise("error importing socket module.")

