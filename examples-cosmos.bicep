// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Cosmos database account.')
param dbAccountName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example Cosmos DB account
resource dbAccount 'Microsoft.DocumentDB/databaseAccounts@2021-06-15' = {
  name: dbAccountName
  location: location
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    disableKeyBasedMetadataWriteAccess: true
  }
}

resource accountName_databaseName 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2021-04-15' = {
  name: 'sql-001'
  parent: dbAccount
  properties: {
    resource: {
      id: 'sql-001'
    }
  }
}
