#!/bin/bash -x

choco install nuget.commandline
nuget install WiX

# Create msi installer
./WiX.*/tools/candle.exe -nologo -arch "x64" -out \
    "msi-builder-test.wixobj" "msi-builder-test.wxs"
./WiX.*/tools/light.exe -nologo -out \
    "msi-builder-test-installer.msi" "msi-builder-test.wixobj"
