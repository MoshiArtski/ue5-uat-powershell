# Import assembly
Add-Type -AssemblyName System.Windows.Forms

# Create an instance of OpenFileDialog
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog

# Set the initial directory
$openFileDialog.InitialDirectory = "D:\"

# Show the dialog and get the result
$result = $openFileDialog.ShowDialog()

# Check the result
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    # Get the selected file
    $projectFilePath = $openFileDialog.FileName

    # Get the project name and directory from the selected file
    $projectDirectory = Split-Path $projectFilePath
    $projectName = Split-Path $projectFilePath -Leaf
    $projectName = $projectName.Replace(".uproject", "")

    # Check if .sln file exists for the project
    if(Test-Path "$projectDirectory\$projectName.sln")
    {
        # Clean the project
        Write-Host "Cleaning project..."
        & 'D:\unreal\UE_5.1\Engine\Build\BatchFiles\Clean.bat' "$projectName" -project="$projectFilePath" Win64 Development -waitmutex

        # Build the project
        Write-Host "Building project..."
        & 'D:\unreal\UE_5.1\Engine\Build\BatchFiles\Build.bat' "$projectName" Win64 Development "$projectFilePath" -waitmutex

        Write-Host "Done!"
    }
    else
    {
        Write-Host "This project seems to be a Blueprint project. There's nothing to build."
    }
}
else
{
    Write-Host "No file was selected."
}
