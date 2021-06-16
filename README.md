# Envoy Partial Evaluation Example

Run `opa build` to produce the bundle:

* -e specifies the _entrypoint_. This is the path/query you want to optimize.
* -O specifies the optimization level.
* src/ is the directory containing policy & data to build.
* -o specifies the output bundle filename.

```
opa build -e istio/authz/allow -O=1 src/ -o bundle-O1.tar.gz
opa build -e istio/authz/allow -O=2 src/ -o bundle-O2.tar.gz
```

Run `opa bench` to benchmark the queries. The results on my machine:

* Unoptimized: 180 microseconds
* Optimized w/ -O=1: 80 microseconds
* Optimized w/ -O=2: 60 microseconds

```
torin:~/scratch/envoy-pe$ opa bench -b src -i input.json 'data.istio.authz.allow=true'
+-------------------------------------------------+------------+
| samples                                         |       6722 |
| ns/op                                           |     178500 |
| B/op                                            |      66042 |
| allocs/op                                       |       1509 |
| histogram_timer_rego_external_resolve_ns_75%    |        300 |
| histogram_timer_rego_external_resolve_ns_90%    |        400 |
| histogram_timer_rego_external_resolve_ns_95%    |        400 |
| histogram_timer_rego_external_resolve_ns_99%    |        400 |
| histogram_timer_rego_external_resolve_ns_99.9%  |      11393 |
| histogram_timer_rego_external_resolve_ns_99.99% |      11700 |
| histogram_timer_rego_external_resolve_ns_count  |       6722 |
| histogram_timer_rego_external_resolve_ns_max    |      11700 |
| histogram_timer_rego_external_resolve_ns_mean   |        297 |
| histogram_timer_rego_external_resolve_ns_median |        300 |
| histogram_timer_rego_external_resolve_ns_min    |        100 |
| histogram_timer_rego_external_resolve_ns_stddev |        364 |
| histogram_timer_rego_query_eval_ns_75%          |     154000 |
| histogram_timer_rego_query_eval_ns_90%          |     166810 |
| histogram_timer_rego_query_eval_ns_95%          |     183405 |
| histogram_timer_rego_query_eval_ns_99%          |     630836 |
| histogram_timer_rego_query_eval_ns_99.9%        |     789661 |
| histogram_timer_rego_query_eval_ns_99.99%       |     790000 |
| histogram_timer_rego_query_eval_ns_count        |       6722 |
| histogram_timer_rego_query_eval_ns_max          |     790000 |
| histogram_timer_rego_query_eval_ns_mean         |     160820 |
| histogram_timer_rego_query_eval_ns_median       |     145350 |
| histogram_timer_rego_query_eval_ns_min          |     131700 |
| histogram_timer_rego_query_eval_ns_stddev       |      75998 |
+-------------------------------------------------+------------+
torin:~/scratch/envoy-pe$ opa bench -b bundle-O1.tar.gz -i input.json 'data.istio.authz.allow=true'
+-------------------------------------------+------------+
| samples                                   |      15328 |
| ns/op                                     |      77801 |
| B/op                                      |      31124 |
| allocs/op                                 |        579 |
| histogram_timer_rego_query_eval_ns_75%    |      69275 |
| histogram_timer_rego_query_eval_ns_90%    |      77810 |
| histogram_timer_rego_query_eval_ns_95%    |      85300 |
| histogram_timer_rego_query_eval_ns_99%    |     311679 |
| histogram_timer_rego_query_eval_ns_99.9%  |     512740 |
| histogram_timer_rego_query_eval_ns_99.99% |     514900 |
| histogram_timer_rego_query_eval_ns_count  |      15328 |
| histogram_timer_rego_query_eval_ns_max    |     514900 |
| histogram_timer_rego_query_eval_ns_mean   |      70011 |
| histogram_timer_rego_query_eval_ns_median |      64100 |
| histogram_timer_rego_query_eval_ns_min    |      55300 |
| histogram_timer_rego_query_eval_ns_stddev |      34987 |
+-------------------------------------------+------------+
torin:~/scratch/envoy-pe$ opa bench -b bundle-O2.tar.gz -i input.json 'data.istio.authz.allow=true'
+-------------------------------------------+------------+
| samples                                   |      20044 |
| ns/op                                     |      59902 |
| B/op                                      |      21119 |
| allocs/op                                 |        413 |
| histogram_timer_rego_query_eval_ns_75%    |      51400 |
| histogram_timer_rego_query_eval_ns_90%    |      58440 |
| histogram_timer_rego_query_eval_ns_95%    |      66000 |
| histogram_timer_rego_query_eval_ns_99%    |     228928 |
| histogram_timer_rego_query_eval_ns_99.9%  |     518472 |
| histogram_timer_rego_query_eval_ns_99.99% |     522100 |
| histogram_timer_rego_query_eval_ns_count  |      20044 |
| histogram_timer_rego_query_eval_ns_max    |     522100 |
| histogram_timer_rego_query_eval_ns_mean   |      52425 |
| histogram_timer_rego_query_eval_ns_median |      47300 |
| histogram_timer_rego_query_eval_ns_min    |      39900 |
| histogram_timer_rego_query_eval_ns_stddev |      30663 |
+-------------------------------------------+------------+
```