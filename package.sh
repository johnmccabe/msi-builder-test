#!/bin/bash -x

choco install 7zip nuget.commandline
nuget install WiX

# Create zip archive
7z a -tzip "./msi-builder-test.exe"

# Create msi installer
./WiX.*/tools/candle.exe -nologo -arch "x64" -ext WixUIExtension -ext WixUtilExtension -out \
    "msi-builder-test.wixobj" "msi-builder-test.wxs"
./WiX.*/tools/light.exe -nologo -ext WixUIExtension -ext WixUtilExtension -out \
    "installer.msi" -sice:ICE61 -sice:ICE91 "msi-builder-test.wixobj"
mv "installer.msi" "msi-builder-test-installer.msi"
