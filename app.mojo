from python import Python
from fire_api.api import FireApi


var HOST: String = "127.0.0.1"
var PORT: Int = 5000 


fn main() raises -> None:
    let app = FireApi(
        host=HOST,
        port=PORT,
    )

    print(app.server())

