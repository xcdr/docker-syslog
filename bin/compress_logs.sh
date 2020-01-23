#!/bin/sh

find /app_data -type f -name *.log -mmin +1440 -exec bzip2 {} \;
