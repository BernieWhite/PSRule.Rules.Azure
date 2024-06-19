// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

@sys.description('The login for an administrator.')
param administratorLogin string

@secure()
@description('A default administrator password.')
param administratorLoginPassword string

@sys.description('The object GUID for an administrator account.')
param loginObjectId string

// An example Azure Database for MySQL using the single server deployment model.
resource singleServer 'Microsoft.DBforMySQL/servers@2017-12-01' = {
  name: name
  location: location
  sku: {
    name: 'GP_Gen5_2'
    tier: 'GeneralPurpose'
    capacity: 2
    size: '5120'
    family: 'Gen5'
  }
  properties: {
    createMode: 'Default'
    version: '8.0'
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    minimalTlsVersion: 'TLS1_2'
    sslEnforcement: 'Enabled'
    publicNetworkAccess: 'Disabled'
    storageProfile: {
      storageMB: 5120
      backupRetentionDays: 7
      geoRedundantBackup: 'Enabled'
    }
  }
}

resource entraForSingleServer 'Microsoft.DBforMySQL/servers/administrators@2017-12-01' = {
  parent: singleServer
  name: 'activeDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: administratorLogin
    sid: loginObjectId
    tenantId: tenant().tenantId
  }
}

resource flexibleServer 'Microsoft.DBforMySQL/flexibleServers@2023-12-30' = {
  name: name
  location: location
  sku: {
    name: 'Standard_D16as'
    tier: 'GeneralPurpose'
  }
  properties: {
    createMode: 'Default'
    version: '8.0.21'
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    highAvailability: {
      mode: 'ZoneRedundant'
    }
    maintenanceWindow: {
      customWindow: 'Enabled'
      dayOfWeek: 0
      startHour: 1
      startMinute: 0
    }
  }
}
