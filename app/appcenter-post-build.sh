#!/usr/bin/env bash

if [ -z "$AppCenterTokenForTest" ]
then
    echo "This script only runs within the context of App Center builds"
    exit
fi

echo "App Center Version"
appcenter -v
appcenter -v

echo "App Center Login"
appcenter login --token $AppCenterTokenForTest

echo "Print printenv"
printenv

