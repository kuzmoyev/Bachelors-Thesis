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

curl "${HEADERS[@]/#/-H}" "$elate_URL"

ab -c 100 -n 5000 "${HEADERS[@]/#/-H}" "$elate_URL"