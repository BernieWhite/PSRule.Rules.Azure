// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Event Grid Topic.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example Event Grid Topic with local auth and public access disabled.
resource eventGrid 'Microsoft.EventGrid/topics@2022-06-15' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    disableLocalAuth: true
    publicNetworkAccess: 'Disabled'
    inputSchema: 'CloudEventSchemaV1_0'
  }
}
