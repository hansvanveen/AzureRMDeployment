Write-Output "Starting AzureRmDeployment task (v1.2.2)"

Import-Module $PSScriptRoot\ps_modules\VstsAzureHelpers_ -Force
Initialize-Azure

#  Get primary input from extension
$resourceLocation  = Get-VstsInput -Name resourceLocation  -Require
$templateLocation  = Get-VstsInput -Name templateLocation  -Require
$extendedLogging   = Get-VstsInput -Name extendedLogging   -Require

if ($extendedLogging) {
  $VerbosePreference = "Continue"
  Write-Output ">> Resource location : $resourceLocation"
  Write-Output ">> Template location : $templateLocation"
}

#  Get secondary input from extension (depends on the primary)
#  Let the cmdlet figure out whether the Files/Uri's exist
  if ($templateLocation -eq 'Linked artifact') {
  $templateFile  = Get-VstsInput -Name csmFile -Require
  $parameterFile = Get-VstsInput -Name csmParametersFile -Require
  $result = New-AzureRmDeployment -Location "$resourceLocation" -TemplateFile "$templateFile" -TemplateParameterFile "$parameterFile" -Verbose
}
else {
  $templateUri  = Get-VstsInput -Name csmFileLink -Require
  $parameterUri = Get-VstsInput -Name csmParametersFileLink -Require
  $result = New-AzureRmDeployment -Name $deploymentName -Location "$resourceLocation" -TemplateUri "$templateUri" -TemplateParameterUri "$parameterUri" -Verbose
}

if ($extendedLogging) { Write-Output $result }