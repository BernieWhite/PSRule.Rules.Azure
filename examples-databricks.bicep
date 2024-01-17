// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Databricks workspace.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

resource managedRg 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  scope: subscription()
  name: 'example-mg'
}

// An example Azure Databricks workspace with secure cluster connectivity enabled.
resource databricks 'Microsoft.Databricks/workspaces@2023-02-01' = {
  name: name
  location: location
  sku: {
    name: 'standard'
  }
  properties: {
    managedResourceGroupId: managedRg.id
    publicNetworkAccess: 'Disabled'
    parameters: {
      enableNoPublicIp: {
        value: true
      }
    }
  }
}
