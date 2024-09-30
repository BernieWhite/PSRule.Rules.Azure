// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Web PubSub service.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('A Standard tier Web PubSub service with key based auth disabled.')
resource service 'Microsoft.SignalRService/webPubSub@2023-02-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_S1'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    disableLocalAuth: true
  }
}
