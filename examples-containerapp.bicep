// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the app environment.')
param envName string

@minLength(2)
@maxLength(32)
@description('The name of the container app.')
param appName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The name of a Log Analytics workspace')
param workspaceId string

@description('The resource ID of a VNET subnet.')
param subnetId string

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

// An example App Environment configured with a consumption workload profile.
resource containerEnv 'Microsoft.App/managedEnvironments@2024-03-01' = {
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
    workloadProfiles: [
      {
        name: 'Consumption'
        workloadProfileType: 'Consumption'
      }
    ]
    vnetConfiguration: {
      infrastructureSubnetId: subnetId
      internal: true
    }
  }
}

// An example Container App using a minimum of 2 replicas.
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
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
        ipSecurityRestrictions: [
          {
            action: 'Allow'
            description: 'Allowed IP address range'
            ipAddressRange: '10.1.1.1/32'
            name: 'ClientIPAddress_1'
          }
          {
            action: 'Allow'
            description: 'Allowed IP address range'
            ipAddressRange: '10.1.2.1/32'
            name: 'ClientIPAddress_2'
          }
        ]
        stickySessions: {
          affinity: 'none'
        }
      }
    }
  }
}
