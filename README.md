# Winget Installer

Winget Installer is a Powershell script to install [Windows Package Manager CLI](https://github.com/microsoft/winget-cli/)

## This Install file isn't fully tested, so it may not work in some machines.

## Installation

Run the `Install.ps1` file by downloading it or calling by Powershell console
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/AdrianoCahete/winget-installer/master/Install.ps1'))
```

## Usage

Usage follows the Winget parameters. See their documentations or run
```
winget --help
```

## License
[?](https://choosealicense.com/licenses/)