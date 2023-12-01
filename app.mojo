from FireApi.server import FireApi
from FireApi.endpoint import EndPoint
from python import PythonObject


fn main() raises -> None:
    let app = FireApi()
    app.run()


