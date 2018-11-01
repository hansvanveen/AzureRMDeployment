# AzureRMDeployment

This extension uses the Azure RM PowerShell New-AzureRmDeployment cmdlet for installing any ARM template in Azure DevOps.

If the specified json parameter file contains the parameter 'ProductName', it will use it as deploymentname (after converting spaces to hyphens).
If the parameter is not found, the resourcegroup name will be used as deploymentname (again after converting spaces to hyphens).

## Notes

This extension requires the Agent to have "Azure RM PowerShell 6.10.0" or higher installed
The New-AzureRmDeployment cmdlet does not exist in earlier versions!

## Help & Contact

The source for this extension can be found at https://github.com/hansvanveen/AzureRMDeployment
Support requests can be send to hvveen@gmail.com