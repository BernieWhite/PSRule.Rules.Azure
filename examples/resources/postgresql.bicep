// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

@sys.description('The login for an administrator.')
param localAdministrator string

@secure()
@description('A default administrator password.')
param localAdministratorPassword string

@sys.description('The object GUID for an administrator account.')
param loginObjectId string

// An example PostgreSQL server.
resource single 'Microsoft.DBforPostgreSQL/servers@2017-12-01' = {
  name: name
  location: location
  properties: {
    createMode: 'Default'
    administratorLogin: localAdministrator
    administratorLoginPassword: localAdministratorPassword
    minimalTlsVersion: 'TLS1_2'
    sslEnforcement: 'Enabled'
    publicNetworkAccess: 'Disabled'
    version: '11'
  }
}

// Configure administrators for single server.
resource single_admin 'Microsoft.DBforPostgreSQL/servers/administrators@2017-12-01' = {
  parent: single
  name: 'activeDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: localAdministrator
    sid: loginObjectId
    tenantId: tenant().tenantId
  }
}

// An example PostgreSQL using the flexible server model.
resource flexible 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_D2ds_v4'
    tier: 'GeneralPurpose'
  }
  properties: {
    createMode: 'Default'
    authConfig: {
      activeDirectoryAuth: 'Enabled'
      passwordAuth: 'Disabled'
      tenantId: tenant().tenantId
    }
    version: '14'
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Enabled'
    }
    highAvailability: {
      mode: 'ZoneRedundant'
    }
  }
}

// Configure administrators for a flexible server.
resource flexible_admin 'Microsoft.DBforPostgreSQL/flexibleServers/administrators@2022-12-01' = {
  parent: flexible
  name: loginObjectId
  properties: {
    principalType: 'ServicePrincipal'
    principalName: localAdministrator
    tenantId: tenant().tenantId
  }
}
