#!/usr/bin/sh

# Verify that the docker containers are running properly
echo 'Wait until sites and apps database installed (9-10 minutes)' && sleep 500

if [ ! -f "${FRAPPE_WD}/sites/apps.txt" ] || [ ! -f "${FRAPPE_WD}/sites/.docker-app-init" ]; then
    echo 'Apps were not installed in time!'
    exit -1
fi

if [ ! -f "${FRAPPE_WD}/sites/currentsite.txt" ] || [ ! -f "${FRAPPE_WD}/sites/.docker-site-init" ]; then
    echo 'Site was not installed in time!'
    exit -2
fi

if [ ! sudo ping -c 10 -q erpnext_db ]; then
    echo 'ERPNext database container is not responding!'
    exit -4
fi

if [ ! sudo ping -c 10 -q erpnext_app ]; then
    echo 'ERPNext app container is not responding!'
    exit -8
fi

if [ ! sudo ping -c 10 -q erpnext_web ]; then
    echo 'ERPNext web container is not responding!'
    exit -16
fi

# Success
exit 0
