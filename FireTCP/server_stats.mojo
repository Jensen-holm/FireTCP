struct ServerStats:
    var total_requests: Int
    var total_execution_time: Float64
    var average_execution_time: Float64
    var most_recent_et: Float64

    fn __init__(inout self) -> None:
        self.total_requests = 0
        self.total_execution_time = 0
        self.average_execution_time = 0
        self.most_recent_et = 0

    fn increment_reqs(inout self) -> None:
        self.total_requests += 1

    fn update_total_et(inout self, et: Float64) -> None:
        self.total_execution_time += et

    fn update_average_et(inout self) -> None:
        self.average_execution_time = (
            self.total_execution_time / self.total_requests
        )

    fn update(inout self, execution_time: Float64) -> None:
        self.increment_reqs()
        self.update_total_et(et=execution_time)
        self.update_average_et()
        self.most_recent_et = execution_time

    fn avg_seconds(self) -> Float64:
        return self.average_execution_time / 1e9

    fn tot_seconds(self) -> Float64:
        return self.total_execution_time / 1e9

    fn most_recent_secs(self) -> Float64:
        return self.most_recent_et / 1e9

    fn most_recent_ms(self) -> Float64:
        return self.most_recent_et
