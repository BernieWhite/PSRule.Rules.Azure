// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the App Configuration Store.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The name of the configuration store replica.')
param replicaName string

@description('The location of the configuration store replica.')
param replicaLocation string

@description('The resource id of the Log Analytics workspace to send diagnostic logs to.')
param workspaceId string

// An example App Configuration store with a Standard SKU.
resource store 'Microsoft.AppConfiguration/configurationStores@2023-03-01' = {
  name: name
  location: location
  sku: {
    name: 'standard'
  }
  properties: {
    disableLocalAuth: true
    enablePurgeProtection: true
    publicNetworkAccess: 'Disabled'
  }
}

// An example App Configuration store replica in a secondary region.
resource replica 'Microsoft.AppConfiguration/configurationStores/replicas@2023-03-01' = {
  parent: store
  name: replicaName
  location: replicaLocation
}

// Configure audit logs to be saved to a Log Analytics workspace.
resource diagnostic 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: store
  name: '${name}-diagnostic'
  properties: {
    logs: [
      {
        categoryGroup: 'audit'
        enabled: true
        retentionPolicy: {
          days: 90
          enabled: true
        }
      }
    ]
    workspaceId: workspaceId
  }
}

@description('An App Configuration store with a replica in a secondary region.')
module br_public_store 'br/public:app/app-configuration:1.1.2' = {
  name: 'store'
  params: {
    skuName: 'Standard'
    disableLocalAuth: true
    enablePurgeProtection: true
    publicNetworkAccess: 'Disabled'
    replicas: [
      {
        name: 'eastus'
        location: 'eastus'
      }
    ]
  }
}
