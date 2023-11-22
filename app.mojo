from python import Python
from fire_api.api import FireApi

var HOST: String = "127.0.0.1"
var PORT: Int = 5000 


fn main() raises -> None:
    var app = FireApi(host=HOST, port=PORT)


# fn main() raises:
#     let py = Python.import_module("builtins")
#     while True:
#         try:
#             let socket = Python.import_module("socket")
#             let HOST = "127.0.0.1"
#             let PORT = 65432
#             let s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#             let aaaaa = s.bind((HOST, PORT))
#             let bbbbb = s.listen()
#             let conn_and_addr = s.accept()
#             let conn = conn_and_addr[0]
#             let addr = conn_and_addr[1]
#             while True:
#                 let data = conn.recv(1024)
#                 let str_data = data.to_string()
#                 if not data:
#                     break
#                 let function_result = is_ten_length(str_data)
#                 var send_back = py.bytes(py.str("True"), "utf-8")
#                 if not function_result:
#                     send_back = py.bytes(py.str("False"), "utf-8")
#                 let x = conn.sendall(send_back)
#         except:
#             print("Error happened")

