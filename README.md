# ue5-uat-powershell
PowerShell Script for Cleaning and Building Unreal Engine Projects
This repository contains a PowerShell script that helps in cleaning and building Unreal Engine projects. The script is particularly useful for developers working with Unreal Engine 5.1.

Description
The script presents an open file dialog that lets you choose an Unreal Engine project (.uproject) file. Once you select a project, the script checks for the corresponding solution (.sln) file in the project directory. If it exists, the script first cleans and then builds the project. If there's no .sln file, the script assumes it's a Blueprint-only project and skips the build process.

Requirements
Windows OS
PowerShell
Unreal Engine 5.1 installed (or adjust the paths accordingly if you're using a different version)
.NET Framework (for the Windows Forms assembly)
Usage
To use the script, follow these steps:

Open a PowerShell window.
Navigate to the directory where the script is located.
Execute the script.
Script Explanation
The script's working is explained below:

It starts by loading the necessary assembly for creating a file dialog.
Then it creates an instance of OpenFileDialog and sets the initial directory.
It shows the file dialog and waits for the user to select a .uproject file.
If a file is selected, it extracts the project directory and name from the file path.
It then checks if a corresponding .sln file exists in the project directory.
If the .sln file exists, it means the project contains C++ code. The script will clean the project and then build it.
If the .sln file does not exist, it assumes the project is a Blueprint project and skips the building process.
Note
The script assumes that Unreal Engine is installed at the path 'D:\unreal\UE_5.1\Engine\Build\BatchFiles'. Please adjust the paths according to your Unreal Engine installation path.
The script assumes that the project contains C++ code if a .sln file exists in the project directory. If the .sln file does not exist, the script assumes that the project is a Blueprint project and there's nothing to build. Please consider this when you're dealing with mixed projects.
Contribution
Feel free to fork the project, make changes, and submit pull requests. If you find any bugs or have any suggestions, please open an issue.

License
This project is licensed under the MIT License.
