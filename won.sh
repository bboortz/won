#!/bin/bash

EXPECTED='{"resultList":[{"vaccinationCenterPk":860454893542521,"name":"IZ Braunschweig ","streetName":"St. Leonhard","streetNumber":"14","zipcode":"38102","city":"Braunschweig","scheduleSaturday":false,"scheduleSunday":false,"vaccinationCenterType":0,"vaccineName":"Moderna","vaccineType":"mRNA","interval1to2":42,"offsetStart2Appointment":0,"offsetEnd2Appointment":10,"distance":5,"outOfStock":true,"publicAppointment":true}],"succeeded":true}'
while true; do
	OUT=$(curl -s 'https://www.impfportal-niedersachsen.de/portal/rest/appointments/findVaccinationCenterListFree/38126?stiko=&count=1&birthdate=463701600000'   -H 'authority: www.impfportal-niedersachsen.de'   -H 'sec-ch-ua: " Not;A Brand";v="99", "Google Chrome";v="91", "Chromium";v="91"'   -H 'accept: application/json, text/plain, */*'   -H 'authorization: '   -H 'sec-ch-ua-mobile: ?0'   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-dest: empty'   -H 'referer: https://www.impfportal-niedersachsen.de/portal/'   -H 'accept-language: en-US,en;q=0.9'   --compressed )
	echo -ne "."
	diff -u <( echo $EXPECTED ) <( echo $OUT ) || (
        ./bot.py
        ./mbot.py
    )
	sleep 3
done

