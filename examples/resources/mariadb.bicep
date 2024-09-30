// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

@sys.description('The name of the admin user account.')
param administratorLogin string

@secure()
@sys.description('The secret for the admin user account.')
param administratorLoginPassword string

@sys.description('The sku to deploy.')
param sku string = 'GP_Gen5_2'

@sys.description('The sku capacity.')
param skuCapacity int = 2

@sys.description('The size of the storage.')
param skuSizeMB int = 51200

// An example Azure Database for MariaDB server using a general purpose SKU.
resource server 'Microsoft.DBforMariaDB/servers@2018-06-01' = {
  name: name
  location: location
  sku: {
    name: sku
    tier: 'GeneralPurpose'
    capacity: skuCapacity
    size: '${skuSizeMB}'
    family: 'Gen5'
  }
  properties: {
    sslEnforcement: 'Enabled'
    minimalTlsVersion: 'TLS1_2'
    createMode: 'Default'
    version: '10.3'
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    publicNetworkAccess: 'Disabled'
    storageProfile: {
      storageMB: skuSizeMB
      backupRetentionDays: 7
      geoRedundantBackup: 'Enabled'
    }
  }
}
