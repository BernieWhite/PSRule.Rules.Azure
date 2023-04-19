// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

targetScope = 'subscription'

@description('The name of the resource group.')
param name string

@description('The location resource group will be deployed.')
param location string = 'eastus'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: name
  location: location
  tags: {
    environment: 'production'
    costCode: '349921'
  }
}
