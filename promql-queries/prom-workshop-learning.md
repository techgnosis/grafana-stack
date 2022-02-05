Expressions can evaluate to one of four types:
* Instant vector - a time series. Only thing that can be graphed
* Range vector - a time series with a time duration like `[Xtimeunit]`
* Scalar - a floating point value
* String - unused as of today

Good wording:
`http_requests_total` selects all time series that have the `http_requests_total` metric name

`offset` returns historical data. `node_network_receive_bytes_total offset 7d` returns week old data



An instant vector does two things:
1. In the "Console" tab it shows the latest value of the time series
2. In the "Graph" tab it uses the time picker to graph the value of the time series over time

A range vector shows you the values of the time series over the requested duration. BUT, since the `Graph` tab already allows you to show historical data, a range vector needs to be turned into an instant vector to be graphed in the `Graph` tab


TIPS -
* `shift+enter` will execute the query in Grafana instead of clicking `Run Query`
* It seems like the real work happens in the `Console` tab and you switch to graph once you've got the instant vector you want
* the `~` character lets you include regex in a string comparison. For instance, `status_code!~"2.."`
* Counters usually end in `_count`