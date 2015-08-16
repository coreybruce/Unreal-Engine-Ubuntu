#!/bin/sh
## Unreal Engine Install Script Version 1.0 Ubuntu Derivatives
# Check for updates
echo "Checking for updates..."
sudo apt-get update; sudo apt-get dist-upgrade -y

# Installing Dependencies
echo "Installing dependencies..."
sudo apt-get install -y build-essential mono-{xbuild,dmcs,gmcs} libmono-{corlib4.0,system-data-datasetextensions4.0-cil,system-web-extensions4.0-cil,system-management4.0-cil,system-xml-linq4.0-cil} cmake dos2unix clang xdg-user-dirs libqt4-dev git

# Obtain Source
echo "Obtaining source through Github..."
git clone https://github.com/3dluvr/UnrealEngine.git
cd UnrealEngine; ./Setup.sh

# Building Unreal 4 Editor
echo "Building the Unreal 4 Editor..."
./GenerateProjectFiles.sh
make SlateViewer
make ShaderCompileWorker UnrealLightmass UnrealPak UE4Editor

# Launch UE4 Editor
./Engine/Binaries/Linux/UE4Editor
