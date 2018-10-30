#!/bin/bash
php artisan config:clear
tries=10;
try=0;
status=0;
while [[ $status != "200" ]] && [ $try -lt $tries ];
    do sleep 5;
    status="$(curl -s -o /dev/null -w ''%{http_code}'' nginx/status)"
    echo "Connecting DB [attempt: $try]";
    echo "Response: $status";
    try=$((try + 1))
done

if [ $status -ne "200" ]
then
    exit 1;
fi

php artisan passport:install
php vendor/bin/codecept run -d

