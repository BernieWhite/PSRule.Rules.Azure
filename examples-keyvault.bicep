// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The principal GUID of the object to assign to the access policy.')
param objectId string

@description('A resource ID to a Log Analytics workspace.')
param workspaceId string

// An example Key Vault with access policies.
resource vaultWithAccessPolicies 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'premium'
    }
    tenantId: tenant().tenantId
    softDeleteRetentionInDays: 90
    enableSoftDelete: true
    enablePurgeProtection: true
    accessPolicies: [
      {
        objectId: objectId
        permissions: {
          secrets: [
            'get'
            'list'
            'set'
          ]
        }
        tenantId: tenant().tenantId
      }
    ]
  }
}

// An example Key Vault with RBAC authorization.
resource vault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'premium'
    }
    tenantId: tenant().tenantId
    softDeleteRetentionInDays: 90
    enableSoftDelete: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

// Configure auditing for Key Vault.
resource logs 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'logs'
  scope: vault
  properties: {
    workspaceId: workspaceId
    logs: [
      {
        category: 'AuditEvent'
        enabled: true
      }
    ]
  }
}
