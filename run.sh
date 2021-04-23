#!/bin/sh

for i in /etc/nginx/conf.d/default.conf /etc/nginx/stream.conf; do
	envsubst "`env | awk -F = '{printf \" \\\\$%s\", $1}'`" < $i.template > $i
done

echo Executing nginx...

exec nginx -g 'daemon off;'
