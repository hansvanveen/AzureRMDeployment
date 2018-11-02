# AzureRMDeployment

This extension uses the Azure RM PowerShell New-AzureRmDeployment cmdlet for installing
ARM template in Azure DevOps. The cmdlet does not support a ResourceGroup name parameter
so you find that input filed missing in the extension.

This also means that all information required to configure the resource must be present
in the template files.

The extension can handle nested templates, so you can make your configuration as compleet
(or complex) as you like

## Requirements

- "Azure RM PowerShell 6.10.0" or higher
  This extension requires the pipeline Agent to have this module installed.
  The New-AzureRmDeployment cmdlet does not exist in earlier versions!

## Help & Contact

The source for this extension can be found at https://github.com/hansvanveen/AzureRMDeployment
Support requests can be send to hans_vanveen@hotmail.com