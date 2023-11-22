from python import Python


struct FireApi:
    var __socket_module: PythonObject
    var __py: PythonObject
    var __server: PythonObject

    fn __init__(inout self, host: String, port: Int) raises -> None:
        self.__py = None
        self.__socket_module = None
        self.__server = None

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

    """ getters """
    fn server(borrowed self) -> PythonObject:
        return self.__server
