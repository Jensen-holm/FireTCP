from python import Python


struct FireApi:
    var __socket_module: PythonObject
    var __py: PythonObject
    var __server: PythonObject
    var __host: String
    var __port: Int

    fn __init__(inout self, host: String, port: Int) raises -> None:
        self.__socket_module = None
        self.__py = None
        self.__server = None
        self.__host = host
        self.__port = port

        # load nessessary python modules
        self.load_builtins()
        self.load_socket()

        # create server
        self.__server = self.create_server()


    """ init functions """
    fn load_builtins(inout self) raises -> None:
        try:
            self.__py = Python.import_module("builtins")
        except:
            raise("error loading python builtins module.")
    
    fn load_socket(inout self) raises -> None:
        try:
            self.__socket_module = Python.import_module("socket")
        except:
            raise("error loading python socket module")

    fn create_server(inout self) raises -> PythonObject:
        try:
            let server = self.__socket_module.socket(
                self.__socket_module.AF_INET,
                self.__socket_module.SOCK_STREAM,
            )
            return server
        except:
            raise("error creating server object.")


    """ getters (not sure how nessesary this is) """
    fn server(borrowed self) raises -> PythonObject:
        if not self.__server:
            raise("tried getting FireApi object server, but server is none.")
        return self.__server

    fn host(borrowed self) raises -> String:
        if not self.__host:
            raise("tried getting FireApi object host, but host is none.")
        return self.__host
    
    fn port(borrowed self) raises -> Int:
        if not self.__port:
            raise("tried getting FireApi object port, but port is none.")


    """ main function """
    fn run(inout self) raises -> None:
        ...
