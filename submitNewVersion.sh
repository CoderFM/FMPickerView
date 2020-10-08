#! /bin/bash
basePath=$(cd "$(dirname "$0")";pwd)
cd $basePath
pod repo push FMPodSpec FMPickerView.podspec --allow-warnings &&
pod trunk push FMPickerView.podspec --allow-warnings

