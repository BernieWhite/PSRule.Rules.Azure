// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the app environment.')
param envName string

@description('The name of the container app.')
param appName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The name of a Log Analytics workspace')
param workspaceId string

@description('The revision of the container app.')
param revision string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' existing = {
  name: workspaceId
}

var containers = [
  {
    name: 'simple-hello-world-container'
    image: 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
    resources: {
      cpu: json('0.25')
      memory: '.5Gi'
    }
  }
]

// An example App Environment
resource containerEnv 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: envName
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: workspace.properties.customerId
        sharedKey: workspace.listKeys().primarySharedKey
      }
    }
    zoneRedundant: true
  }
}

// An example Container App
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: appName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    environmentId: containerEnv.id
    template: {
      revisionSuffix: revision
      containers: containers
      scale: {
        minReplicas: 2
      }
    }
    configuration: {
      ingress: {
        allowInsecure: false
        stickySessions: {
          affinity: 'none'
        }
      }
    }
  }
}
