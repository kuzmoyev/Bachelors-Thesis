#!/bin/bash

elate_URL=https://api.elateme.com/wishes/
local_URL=http://127.0.0.1:8000/wishes/

elate_token="Token 86f8a6739ac068776708fcd09837bba46a384760"
local_token="Token 3bb97f3b17452e21ba3e698d3daed65bf81f9b38"

HEADERS=(
        "Authorization: $elate_token" \
        "Content-Type: application/json" \
        "User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36"
)


# wrk -t16 -c400 -d30s "${HEADERS[@]/#/-H}" "$elate_URL"


ab -c 100 -n 5000 "${HEADERS[@]/#/-H}" "$elate_URL"


# curl "${HEADERS[@]/#/-H}" "$elate_URL"


#    Server Software:        nginx/1.10.0
#    Server Hostname:        api.elateme.com
#    Server Port:            443
#    SSL/TLS Protocol:       TLSv1.2,ECDHE-RSA-AES128-GCM-SHA256,2048,128
#
#    Document Path:          /wishes/
#    Document Length:        5427 bytes
#
#    Concurrency Level:      100
#    Time taken for tests:   117.644 seconds
#    Complete requests:      5000
#    Failed requests:        0
#    Total transferred:      29500000 bytes
#    HTML transferred:       27135000 bytes
#    Requests per second:    42.50 [#/sec] (mean)
#    Time per request:       2352.888 [ms] (mean)
#    Time per request:       23.529 [ms] (mean, across all concurrent requests)
#    Transfer rate:          244.88 [Kbytes/sec] received
#
#    Connection Times (ms)
#                  min  mean[+/-sd] median   max
#    Connect:       31 1977 2107.3   1451   33402
#    Processing:     3  305 1006.6     38    9499
#    Waiting:        3  301 993.1     37    9499
#    Total:         39 2282 2323.7   1659   33436
#
#    Percentage of the requests served within a certain time (ms)
#      50%   1659
#      66%   2152
#      75%   2527
#      80%   3042
#      90%   4367
#      95%   6363
#      98%   9319
#      99%  10716
#     100%  33436 (longest request)