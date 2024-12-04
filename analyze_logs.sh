#!/bin/bash

total_requests=$(wc -l < access.log)
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)
method_counts=$(awk '{print $6}' access.log | tr -d '"' | sort | uniq -c | sort -nr)
popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

echo "cat report.txt running now"
cat <<EOL > report.txt
Total requests: $total_requests
Unique IPs: $unique_ips
Method counts: $method_counts
Most popular URL: $popular_url
EOL

cat report.txt
