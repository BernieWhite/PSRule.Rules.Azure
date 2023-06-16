// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Web App.')
param name string

@description('The name of the App Services Plan.')
param planName string

@description('Tags to apply to the resource.')
param tags object

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example App Services Plan
resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: planName
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 2
  }
}

// An example .NET Framework Web App
resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'web'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    siteConfig: {
      alwaysOn: true
      minTlsVersion: '1.2'
      ftpsState: 'FtpsOnly'
      remoteDebuggingEnabled: false
      http20Enabled: true
      netFrameworkVersion: 'v6.0'
      healthCheckPath: '/healthz'
    }
  }
  tags: tags
}

// An example PHP Web App
resource webAppPHP 'Microsoft.Web/sites@2022-09-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'web'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    siteConfig: {
      alwaysOn: true
      minTlsVersion: '1.2'
      ftpsState: 'FtpsOnly'
      remoteDebuggingEnabled: false
      http20Enabled: true
      netFrameworkVersion: 'OFF'
      phpVersion: '7.4'
      healthCheckPath: '/healthz'
    }
  }
  tags: tags
}
