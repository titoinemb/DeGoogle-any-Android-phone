#!/bin/bash

# List of package names to uninstall
packages=(
    # add all other packages here
)

# Uninstall packages and verify
for package in "${packages[@]}"
do
    adb shell pm uninstall -k --user 0 $package
    result=$(adb shell pm list packages | grep $package)
    if [ -n "$result" ]; then
        echo "Failed to uninstall package: $package"
    else
        echo "Successfully uninstalled package: $package"
    fi
done
