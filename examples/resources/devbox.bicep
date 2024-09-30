// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the center and project.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The name of the definition to use.')
param devBoxDefinitionName string

@description('The name of a network connection to use.')
param networkConnectionName string

// An example Dev Center for deploying Dev Boxes.
resource center 'Microsoft.DevCenter/devcenters@2023-04-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

// An example Project for developing Dev Boxes.
resource project 'Microsoft.DevCenter/projects@2023-04-01' = {
  name: name
  location: location
  properties: {
    devCenterId: center.id
    maxDevBoxesPerUser: 2
  }
}

// An example Dev Box Pool.
resource pool 'Microsoft.DevCenter/projects/pools@2023-04-01' = {
  parent: project
  name: name
  location: location
  properties: {
    devBoxDefinitionName: devBoxDefinitionName
    networkConnectionName: networkConnectionName
    licenseType: 'Windows_Client'
    localAdministrator: 'Enabled'
  }

  resource shutdown 'schedules@2023-04-01' = {
    name: name
    properties: {
      frequency: 'Daily'
      type: 'StopDevBox'
      state: 'Enabled'
      time: '19:00'
      timeZone: 'Australia/Brisbane'
    }
  }
}
