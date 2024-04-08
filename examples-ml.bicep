// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the ML - Compute Instance.')
param name string

@description('A friendly name for the workspace.')
param friendlyName string = name

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The VM SKU to be deployed.')
param vmSize string = 'STANDARD_D2_V2'

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: 'example'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: 'example'
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' existing = {
  name: 'example'
}

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-07-01' existing = {
  name: 'example'
}

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: 'example'
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' existing = {
  name: 'vnet/subnet'
}

resource workspace 'Microsoft.MachineLearningServices/workspaces@2023-04-01' = {
  name: name
  location: location
  sku: {
    name: 'basic'
    tier: 'basic'
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identity.id}': {}
    }
  }
  properties: {
    friendlyName: friendlyName
    keyVault: keyVault.id
    storageAccount: storageAccount.id
    applicationInsights: appInsights.id
    containerRegistry: containerRegistry.id
    publicNetworkAccess: 'Disabled'
    primaryUserAssignedIdentity: identity.id
  }
}

resource compute_instance 'Microsoft.MachineLearningServices/workspaces/computes@2023-06-01-preview' = {
  parent: workspace
  name: name
  location: location
  properties: {
    computeType: 'ComputeInstance'
    disableLocalAuth: true
    properties: {
      vmSize: vmSize
      idleTimeBeforeShutdown: 'PT15M'
      subnet: {
        id: subnet.id
      }
    }
  }
}
