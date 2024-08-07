from ..response import Resp


@value
struct Response(Resp):
    var __body: String

    fn __init__(inout self, body: String) -> None:
        self.__body = body

    @always_inline
    fn body(self) -> String:
        return self.__body

    fn to_bytes(
        self, py_builtins: PythonObject, encoding: StringLiteral = "utf-8"
    ) raises -> PythonObject:
        return py_builtins.bytes(self.body(), encoding)

    @always_inline
    fn log_message(
        self, execution_time: Float64, raw_request: String, symbol: String = ""
    ) -> String:
        var body = self.body()
        var short_body = body if not len(body) > 40 else body[:40] + "..."
        var short_input = raw_request if not len(
            raw_request
        ) > 40 else raw_request[:40] + "..."
        return (
            "\t--- raw request body: '"
            + short_input
            + "'\n\t"
            + "--- response body: '"
            + short_body
            + "'\n\t"
            + "--- execution time: "
            + str(execution_time)
            + " secs "
            + symbol
        )

    @always_inline
    fn print_log_message(
        self, execution_time: Float64, raw_request: String, symbol: String
    ) -> None:
        var message = self.log_message(
            execution_time=execution_time,
            raw_request=raw_request,
            symbol=symbol,
        )
        print(message)

    @staticmethod
    fn error(error_str: String) -> Self:
        return Self(MALFORMED_REQUEST_MESSAGE + " '" + error_str + "'")

    @staticmethod
    fn empty_error(error_str: String) -> Self:
        return Self(body=EMPTY_REQUEST_MESSAGE + " '" + error_str + ")")
