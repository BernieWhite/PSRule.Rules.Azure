// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the SignalR Service.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('A Standard tier SignalR Service with key based auth disabled.')
resource service 'Microsoft.SignalRService/signalR@2023-02-01' = {
  name: name
  location: location
  kind: 'SignalR'
  sku: {
    name: 'Standard_S1'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    disableLocalAuth: true
    features: [
      {
        flag: 'ServiceMode'
        value: 'Serverless'
      }
    ]
  }
}
