Getting better at PromQL
---------------------------




Metric types
--------------------
Types = counter, gauge, histogram, summary
all the metric "types" are just time series in Prometheus
counter, gauge, histogram, these things come from the Prom libraries. in Prometheus it is just time series

For example, a histogram is many time series
using http_respons_duration_ms as an example metric name

http_reponse_duration_ms_count = 10
http_response_duration_ms_sum = 8682 (the sum in ms of all 10 response durations)
http_response_duration_ms_bucket{le="100"} = 1
http_response_duration_ms_bucket{le="250"} = 3
http_response_duration_ms_bucket{le="500"} = 6
http_response_duration_ms_bucket{le="1000"} = 9
http_response_duration_ms_bucket{le="Inf"} = 10

Those are all just time series. The distinction is only client side.


Functions
-----------
You can do
sum by (name) (rate(whatever))
or
sum (rate(whatever)) by (name)


Time Series
------------
Time Series == metric name plus optional labels
Almost all series have labels
If you query for the metric name by itself you will get all the permutations of labels



What is a histogram
-------------------
Histogram is a collection of measurements sorted into buckets detailing what percentile the measurements are in.
For example, there might be 1000 measurements in 10 buckets. The lowest 10% are in one bucket, the lowest 20% (includes overlap of the first 10%) are in the second bucket, etc..

Histograms exist as three metric names
name_bucket - the actual histogram
name_count - a counter
name_sum - a counter

le = less than or equal to

+Inf is the catch all bucket and its value will match the value of the _count counter


Rules
----------
Prometheus has built in "ruler" that can handle recording rules (queries that create metrics) and alerting rules (queries that create alerts)

Cortex has a service called Ruler that does the same thing. It handles recording rules and alerting rules. 

Both systems send the active alerts to Alertmanager

Prometheus has built-in compaction, while Cortex has a separate service called Compactor

