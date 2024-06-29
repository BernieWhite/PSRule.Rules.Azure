// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

param adminLogin string
param adminPrincipalId string

var maxSize = 32 * 1048576

// An example Azure SQL Database logical server.
resource server 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
    minimalTlsVersion: '1.2'
    administrators: {
      azureADOnlyAuthentication: true
      administratorType: 'ActiveDirectory'
      login: adminLogin
      principalType: 'Group'
      sid: adminPrincipalId
      tenantId: tenant().tenantId
    }
  }
}

// An example administrator configuration for an Azure SQL Database logical server.
resource sqlAdministrator 'Microsoft.Sql/servers/administrators@2023-08-01-preview' = {
  parent: server
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: adminLogin
    sid: adminPrincipalId
  }
}

// An example configuration to enable SQL Advanced Threat Protection for an Azure SQL Database logical server.
resource defenderSql 'Microsoft.Sql/servers/securityAlertPolicies@2023-08-01-preview' = {
  name: 'default'
  parent: server
  properties: {
    state: 'Enabled'
  }
}

// An example configuration to enable Azure SQL auditing for an Azure SQL Database logical server.
resource sqlAuditSettings 'Microsoft.Sql/servers/auditingSettings@2023-08-01-preview' = {
  name: 'default'
  parent: server
  properties: {
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    retentionDays: 7
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
  }
}

// An example Azure SQL Database.
resource database 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: server
  name: name
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: maxSize
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    readScale: 'Disabled'
    zoneRedundant: true
  }
}

// An example configuration to enable TDE for an Azure SQL Database.
resource tde 'Microsoft.Sql/servers/databases/transparentDataEncryption@2023-08-01-preview' = {
  parent: database
  name: 'current'
  properties: {
    state: 'Enabled'
  }
}
