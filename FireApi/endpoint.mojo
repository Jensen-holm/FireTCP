from python import PythonObject


struct EndPoint:
    var _endpoint: String
    var _GET: Bool
    var _POST: Bool

    fn __init__(inout self, endpoint: String) raises -> None:
        self._endpoint = endpoint
    
    fn set_endpoint(inout self, new_endpoint: String) -> None:
        self._endpoint = new_endpoint
    
    fn func(borrowed self):
        pass


struct MyEndpoint(EndPoint):
    fn func(borrowed self, data: PythonObject) raises -> None:
        print("welcome to my api")
