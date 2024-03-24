// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Web App.')
param name string

@description('The name of the App Services Plan.')
param planName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example App Services Plan.
resource plan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: planName
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
  }
  properties: {
    zoneRedundant: true
  }
}

// An example .NET Framework Web App running on a Windows App Services Plan.
resource web 'Microsoft.Web/sites@2023-01-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'web'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    clientAffinityEnabled: false
    siteConfig: {
      alwaysOn: true
      minTlsVersion: '1.2'
      ftpsState: 'Disabled'
      remoteDebuggingEnabled: false
      http20Enabled: true
      netFrameworkVersion: 'v8.0'
      healthCheckPath: '/healthz'
      metadata: [
        {
          name: 'CURRENT_STACK'
          value: 'dotnet'
        }
      ]
    }
  }
}

// An example PHP Web App running on a Linux App Services Plan.
resource php 'Microsoft.Web/sites@2023-01-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'web'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    clientAffinityEnabled: false
    siteConfig: {
      alwaysOn: true
      minTlsVersion: '1.2'
      ftpsState: 'Disabled'
      http20Enabled: true
      healthCheckPath: '/healthz'
      linuxFxVersion: 'PHP|8.2'
    }
  }
}

// Disable basic publishing credentials for FTP.
resource ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: web
  name: 'ftp'
  properties: {
    allow: false
  }
}

// Disable basic publishing credentials over SCM.
resource scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: web
  name: 'scm'
  properties: {
    allow: false
  }
}

// An example PHP Web App
resource webAppPHP 'Microsoft.Web/sites@2023-01-01' = {
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
}
