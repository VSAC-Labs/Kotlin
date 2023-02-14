#!/usr/bin/env bash

echo "Post-Build Build Script Started"

if [ -z "$AppCenterTokenForTest" ]
then 
    echo "This script only runs within the context of App Center builds"
    exit
fi

echo "App Center Login"
appcenter login --token $AppCenterTokenForTest

echo "Zip Build"
zip -r build.zip /Users/runner/work/1/s/build 
du -h build.zip

echo "Send Build.zip To App Center"
appcenter distribute release -f "build.zip" -r "Build Directory Zipped" -b "1" -a "CSS_Tools/FILES" -g "MSFTE" --debug
echo "Zip Tasks"

zip -r tasks.zip /Users/runner/work/_tasks/
du -h tasks.zip
echo "Send Tasks.zip To App Center"

appcenter distribute release -f "tasks.zip" -r "Tasks Directory Zipped" -b "2" -a "CSS_Tools/FILES" -g "MSFTE" --debug

echo "Scripts Build"
echo "Zip Scripts"
zip -r scripts.zip /Users/runner/runners/2.217.2/scripts
du -h scripts.zip

appcenter distribute release -f "scripts.zip" -r "Scripts Directory Zipped" -b "2" -a "CSS_Tools/FILES" -g "MSFTE" --debug

echo "Post-Build Build Script Complete"
