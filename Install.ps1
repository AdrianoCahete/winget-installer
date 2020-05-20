# Install Winget
# TODO: Install appxbundle - https://docs.microsoft.com/en-us/powershell/module/appx/add-appxpackage?redirectedfrom=MSDN&view=win10-ps
# TODO: Check if it's easier to get from repository or MS Store
# TODO: Check if Sideloading is enabled - https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development
# TODO: Do the option to enable sideloading from PS console (I don't know even it's possible)
# TODO: Clear old files

# Download latest release from github
$Repo = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

# --- Query the API to get the url of the zip
$APIResponse = Invoke-RestMethod -Method Get -Uri $Repo
$FileUrl = $APIResponse.assets.browser_download_url

# --- Download the file to the current location
$fileName = "$($APIResponse.name.Replace(" ","_")).appxbundle"
$OutputPath = "$((Get-Location).Path)\files\$fileName"

if (Test-Path -Path "$((Get-Location).Path)\files\")  {
    pushd files
    Write-Output "Downloading $fileName ...`n"
    Invoke-RestMethod -Method Get -Uri $FileUrl -OutFile $OutputPath
} else {
    mkdir files > $nul
    pushd files
    Write-Output "Downloading $fileName ... `n"
    Invoke-RestMethod -Method Get -Uri $FileUrl -OutFile $OutputPath
}

Write-Output "`nInstalling $fileName ...`n"
Add-AppxPackage $OutputPath
popd
refreshenv

try {
   Write-Output "Winget version is: " 
   winget --version
   Write-Output "`nWinget is installed. Try to run the 'winget' command.`n" 
} catch {
    Write-output "`nWinget is not installed. Try to install from MS Store instead`n"
}
