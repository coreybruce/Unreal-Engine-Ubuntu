#Unrela Engine Install Script Version 1.0 Ubuntu Derivatives

echo Installing depenancies: &&
#Dependacies
sudo apt-get install mono-mcs && sudo apt-get install mono-gmcs && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list && sudo apt-get update && sudo apt-get install mono-gmcs mono-xbuild mono-dmcs libmono-corlib4.0-cil libmono-system-data-datasetextensions4.0-cil libmono-system-web-extensions4.0-cil libmono-system-management4.0-cil libmono-system-xml-linq4.0-cil cmake dos2unix clang-3.3 libfreetype6-dev libsdl2-dev libgtk-3-dev libmono-microsoft-build-tasks-v4.0-4.0-cil xdg-user-dirs && sudo apt-get install mono-devel &&

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
