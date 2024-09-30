// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@secure()
@description('Local administrator password for virtual machine.')
param adminPassword string

output accountPassword string = adminPassword
