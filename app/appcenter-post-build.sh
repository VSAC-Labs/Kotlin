#!/usr/bin/env bash

if [ -z "$AppCenterTokenForTest" ]
then
    echo "This script only runs within the context of App Center builds"
    exit
fi

echo "App Center Version"
appcenter -v

echo "App Center Login"
appcenter login --token $AppCenterTokenForTest

if [ "$BUILDBUNDLE" = true ]
then
  echo "Build Is Using AAB"
  Path2APK="/Users/runner/work/1/s/app/build/outputs/apk/release/app-release.aab"
else
  echo "Build Is Using APK"
  Path2APK="/Users/runner/work/1/s/app/build/outputs/apk/release/app-release.apk"
fi

echo "App Center Distribution START"

appcenter distribute release -f "$Path2APK" -r "Manuel App Center Distribution" -g "TestGroup1" -n 1 -b "1.0" -a "VSAC-Labs/Kotlin" --debug

echo "App Center Distribution END"