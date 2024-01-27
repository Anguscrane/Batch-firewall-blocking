# Function to create firewall rules 
function Create-FirewallRule {
  param(
    [string]$executablePath 
  )
  
  # Generate display name
  $displayName = (Get-Item $executablePath).BaseName + " Block Rule"

  # Create inbound rule
  $ruleNameIN = "$displayName Inbound"
  New-NetFirewallRule -DisplayName $ruleNameIN -Direction Inbound -Action Block -Program $executablePath

  # Create outbound rule
  $ruleNameOUT = "$displayName Outbound" 
  New-NetFirewallRule -DisplayName $ruleNameOUT -Direction Outbound -Action Block -Program $executablePath
}

# Get folder paths as an array 
$folderPaths = @("INSERT FOLDER PATH","")

# Loop through each folder
foreach ($folderPath in $folderPaths) {

  # Get all .exe files in the folder
  $exeFiles = Get-ChildItem -Path $folderPath -Filter *.exe -Recurse

  # Loop through each .exe and create firewall rules
  foreach ($exeFile in $exeFiles) {
    $executablePath = $exeFile.FullName
    Create-FirewallRule -executablePath $executablePath
  }

}