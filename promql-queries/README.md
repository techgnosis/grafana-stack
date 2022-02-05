## Tips

1. The way to get data not as a time series is with the "Instant" button in Grafana. "Instant" basically means "right now".

2. Both the distributor and the ruler both push metrics to ingester.


## All series

`{__name__=~".+"}`

## Count every metric and metric dimension that is not stale
Only shows series that are not stale in past 5 minutes

`count({__name__=~".+"})`

## List all labels in an Instance

This is handled by the Cortex API instead of PromQL

`all-labels.sh`

## List all values for a label

This is handled by the Cortex API instead of PromQL

`label-values.sh`


## Show all metrics and their cardinality
This tends to show a lot of histograms

`sort_desc(count by (__name__)({__name__=~".+"}))`


## Find top 10 metrics with highest cardinality

`topk(10, count by (__name__)({__name__=~".+"}))`


## Count cardinality of a single label
`count(count by (label_name) (metric_name))`

`count(count by (route) (cortex_request_duration_seconds_bucket))`


## Number of series - the series dropped by relabel configs
`sum(scrape_samples_post_metric_relabeling) by (namespace)`


## Less useful queries that I see around

`group by(__name__) ({__name__!=""})`




## Key metrics
cortex_distributor_replication_factor
cortex_ingester_active_series

cortex_ingester_memory_series_created_total
cortex_ingester_memory_series_removed_total

cortex_distributor_received_samples_total
cortex_distributor_samples_in_total

cortex_ingester_ingested_samples_total

cortex_ingester_ingestion_rate_samples_per_second

cortex_ingester_tsdb_storage_blocks_bytes

cortex_distributor_ingester_appends_total