// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Event Grid Topic.')
param topicName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example Event Grid Topic
resource eventGrid 'Microsoft.EventGrid/topics@2021-06-01-preview' = {
  name: topicName
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
