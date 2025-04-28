# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Install dependencies
#

if ($Null -eq (Get-PackageProvider -Name NuGet -ErrorAction Ignore)) {
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser;
}

if ($Null -eq (Get-InstalledModule -Name PowerShellGet -MinimumVersion 2.2.1 -ErrorAction Ignore)) {
    Install-Module PowerShellGet -MinimumVersion 2.2.1 -Scope CurrentUser -Force -AllowClobber;
}
