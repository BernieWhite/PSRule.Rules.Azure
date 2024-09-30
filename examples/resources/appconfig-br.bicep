// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The resource id of the Log Analytics workspace to send diagnostic logs to.')
param workspaceId string

// An example App Configuration Store using the public registry with a Standard SKU.
module store 'br/public:app/app-configuration:1.1.1' = {
  name: 'store'
  params: {
    skuName: 'Standard'
    disableLocalAuth: true
    enablePurgeProtection: true
    publicNetworkAccess: 'Disabled'
    diagnosticSettingsProperties: {
      diagnosticReceivers: {
        workspaceId: workspaceId
      }
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
    }
  }
}
