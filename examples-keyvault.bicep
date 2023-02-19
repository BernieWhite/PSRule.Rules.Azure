// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The principal GUID of the object to assign to the access policy.')
param objectId string

// An example Key Vault
resource vault 'Microsoft.KeyVault/vaults@2022-07-01' = {
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
