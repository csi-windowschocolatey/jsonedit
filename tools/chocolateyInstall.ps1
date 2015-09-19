$packageName = 'jsonedit'
$url = 'http://tomeko.net/software/JSONedit/bin/JSONedit_0_9_12.zip'
$validExitCodes = @(0)
$exeName = "jsonedit.exe"

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$AppPathKey = "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$exeName"
If (!(Test-Path $AppPathKey)) {New-Item "$AppPathKey" | Out-Null}
Set-ItemProperty -Path $AppPathKey -Name "(Default)" -Value "$env:chocolateyinstall\lib\$packagename\tools\$exeName"
Set-ItemProperty -Path $AppPathKey -Name "Path" -Value "$env:chocolateyinstall\lib\$packagename\tools\"
If (Test-Path "$env:chocolateyinstall\bin\$exeName") {Remove-Item "$env:chocolateyinstall\bin\$exeName" -Force -EA SilentlyContinue}

Write-Output "************************************************************************************************"
Write-Output "*  INSTRUCTIONS: In the search prompt of your start menu type `"$exeName`"                     *"
Write-Output "*   More Info:                                                                                 *"
Write-Output "*   http://tomeko.net/software/JSONedit/                                                       *"
Write-Output "************************************************************************************************"