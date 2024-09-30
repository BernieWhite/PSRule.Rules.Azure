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
  name: split(workspaceId, '/')[8]
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

var ipSecurityRestrictions = [
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

// An example App Environment configured with a consumption workload profile.
module containerEnv 'br/public:avm/res/app/managed-environment:0.8.0' = {
  params: {
    name: envName
    logAnalyticsWorkspaceResourceId: workspaceId
    managedIdentities: {
      systemAssigned: true
    }
    location: location
    infrastructureSubnetId: subnetId
    internal: true
    zoneRedundant: true
    workloadProfiles: [
      {
        name: 'Consumption'
        workloadProfileType: 'Consumption'
      }
    ]
  }
}

// An example Container App using a minimum of 2 replicas.
module containerApp 'br/public:avm/res/app/container-app:0.11.0' = {
  params: {
    name: appName
    environmentResourceId: containerEnv.outputs.resourceId
    containers: containers
    ipSecurityRestrictions: ipSecurityRestrictions
    scaleMinReplicas: 2
  }
}
