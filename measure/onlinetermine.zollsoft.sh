#!/bin/bash

OUT=$(curl -s 'https://onlinetermine.zollsoft.de/includes/searchTermine_app_feature.php' \
  -H 'accept: */*' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'origin: https://onlinetermine.zollsoft.de' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'accept-language: en-US,en;q=0.9' \
  --data-raw 'versichert=1&terminsuche=&uniqueident=606d8c512d1ce' \
  --compressed)
echo $OUT | grep "1. Impfung" && (
	./tbot.py "https://www.hausarztpraxis-gifhorn.de/"
	./mbot.py "https://www.hausarztpraxis-gifhorn.de/" "gifhorn"
)
