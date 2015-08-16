#Unreal Engine Install Script Version 1.1 Ubuntu Derivatives

echo Preparing Graphics For Unreal Engine &&
#Graphics For Unreal Engine
sudo apt-add-repository ppa:oibaf/graphics-drivers && sudo apt-get update && sudo apt-get dist-upgrade &&

echo Get The Source: &&
#get the source
git clone https://github.com/3dluvr/UnrealEngine.git && cd UnrealEngine && ./Setup.sh &&

echo Generate Makefiles:&&
#Generate Makefiles
find Engine/Source/Programs/AutomationTool -name "*Automation.csproj" -exec sed -i "s/ToolsVersion=\"11.0\"/ToolsVersion=\"4.0\"/g" "{}" \; && export MSBuildToolsVersion=4.0 && ./GenerateProjectFiles.sh &&

echo Cleaning up and Enhancing the Makefile &&
#Cleaning up and Enhancing the Makefile
make UE4Editor ARGS=-clean

