// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Container Registry.')
param registryName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example container registry
resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: registryName
  location: location
  sku: {
    name: 'Premium'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    adminUserEnabled: false
    policies: {
      quarantinePolicy: {
        status: 'enabled'
      }
      trustPolicy: {
        status: 'enabled'
        type: 'Notary'
      }
      softDeletePolicy: {
        retentionDays: 90
        status: 'enabled'
      }
    }
  }
}
