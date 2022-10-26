// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('Name of the App Service Environment')
param aseName string = '001-ase'

@description('The name of the vnet')
param virtualNetworkName string = 'ase-001-vnet'

@description('The resource group name that contains the vnet')
param vnetResourceGroupName string = 'ase-001-rg'

@description('Subnet name that will contain the App Service Environment')
param subnetName string = 'ase-001-sn'

@description('Location for the resources')
param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-05-01' existing = {
  scope: resourceGroup(vnetResourceGroupName)
  name: virtualNetworkName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' existing = {
  parent: virtualNetwork
  name: subnetName
}

resource hostingEnvironment 'Microsoft.Web/hostingEnvironments@2022-03-01' = {
  name: aseName
  location: location
  kind: 'ASEV3'
  tags: {
    displayName: 'App Service Environment'
    usage: 'Hosting awesome applications'
    owner: 'Platform'
  }
  properties: {
    virtualNetwork: {
      id: subnet.id
    }
  }
}
