from FireTCP.server_stats import ServerStats
from testing import assert_true


fn test_server_stats_init() raises -> None:
    var stats = ServerStats()

    assert_true(stats.total_requests == 0)
    assert_true(stats.total_execution_time == 0)
    assert_true(stats.most_recent_et == 0)
    assert_true(stats.average_execution_time == 0)


fn test_update() raises -> None:
    var stats = ServerStats()
    stats.update(execution_time=10)

    assert_true(stats.total_requests == 1)
    assert_true(stats.most_recent_et == 10)
    assert_true(stats.average_execution_time == 10)
