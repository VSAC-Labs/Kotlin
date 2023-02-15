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

if [ "$BUILDBUNDLE" = true ]
then
  echo "Build Is Using AAB"
  Path2APK="'/Users/runner/work/1/s/app/build/outputs/apk/release/app-release.aab'"
else
  echo "Build Is Using APK"
  Path2APK="'/Users/runner/work/1/s/app/build/outputs/apk/release/app-release.apk'"
fi

ReleaseNotes="'Manuel App Center Distribution'"
Group="'TestGroup1'"
BuildNumber=$BUILD_BUILDNUMBER
BuildVersion="'1.0.0.0'"
AppSlug="VSAC-Labs\Kotlin"

echo "Path2APK"
echo $Path2APK
echo "ReleaseNotes"
echo $ReleaseNotes
echo "Group"
echo $Group
echo "Build Number"
echo $BuildNumber
echo "Build Version"
echo $BuildVersion
echo "AppSlug"
echo $AppSlug

echo "App Center Distribution START"

appcenter distribute release -f $Path2APK -r $ReleaseNotes -g $Group -n $BuildNumber -b $BuildVersion -a VSAC-Labs/Kotlin --debug


echo "App Center Distribution END"