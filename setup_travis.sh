#!/usr/bin/env bash

rm -rf docker && docker build -t demo-php:latest . && docker-compose -f docker-compose.yml up --exit-code-from php_test