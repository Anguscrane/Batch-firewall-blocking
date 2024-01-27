# Batch Firewall Blocking

This repository contains two PowerShell scripts for blocking executable (.exe) files in the Windows firewall.

## Scripts

- `block-folder.ps1` - Blocks all .exe files in a single specified folder 
- `block-multiple.ps1` - Blocks all .exe files in multiple specified folders

The `block-folder.ps1` script prompts the user to input a single folder path, then iterates through all .exe files in that folder and creates inbound and outbound firewall rules to block them.

The `block-multiple.ps1` script allows specifying an array of folder paths upfront, then loops through each folder and blocks the .exe files found within each one. This avoids needing to run the script multiple times for different folders.
