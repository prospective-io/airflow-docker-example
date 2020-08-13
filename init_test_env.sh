#!/bin/bash

mkdir test_env
chmod a+w test_env

mkdir test_env/logs
chmod a+w test_env/logs

mkdir test_env/files
chmod a+w test_env/files

mkdir test_env/database
chmod a+w test_env/database


docker-compose -f  docker-compose-initdb.yml up