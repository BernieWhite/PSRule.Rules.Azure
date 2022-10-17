// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The location resources will be deployed.')
param location string = resourceGroup().location

param asgName string = 'asg-001'
param nsgName string = 'nsg-001'
param lbName string = 'lb-001'

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowLoadBalancerHealthInbound'
        properties: {
          description: 'Allow inbound Azure Load Balancer health check.'
          access: 'Allow'
          direction: 'Inbound'
          priority: 100
          protocol: '*'
          sourcePortRange: '*'
          sourceAddressPrefix: 'AzureLoadBalancer'
          destinationPortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'AllowApplicationInbound'
        properties: {
          description: 'Allow internal web traffic into application.'
          access: 'Allow'
          direction: 'Inbound'
          priority: 300
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '10.0.0.0/8'
          destinationPortRange: '443'
          destinationAddressPrefix: 'VirtualNetwork'
        }
      }
      {
        name: 'DenyAllInbound'
        properties: {
          description: 'Deny all other inbound traffic.'
          access: 'Deny'
          direction: 'Inbound'
          priority: 4000
          protocol: '*'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'DenyTraversalOutbound'
        properties: {
          description: 'Deny outbound double hop traversal.'
          access: 'Deny'
          direction: 'Outbound'
          priority: 200
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: '*'
          destinationPortRanges: [
            '3389'
            '22'
          ]
        }
      }
    ]
  }
}

resource asg 'Microsoft.Network/applicationSecurityGroups@2022-01-01' = {
  name: asgName
  location: location
  properties: {}
}

// An example VNET with NSG configured
resource vnet 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: 'vnet-001'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        '10.0.1.4'
        '10.0.1.5'
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'snet-001'
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
      {
        name: 'snet-002'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'HSM'
              properties: {
                serviceName: 'Microsoft.HardwareSecurityModules/dedicatedHSMs'
              }
            }
          ]
        }
      }
    ]
  }
}

// An example internal load balancer
resource lb_001 'Microsoft.Network/loadBalancers@2022-01-01' = {
  name: lbName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'frontendIPConfig'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: vnet.properties.subnets[1].id
          }
        }
        zones: [
          '1'
          '2'
          '3'
        ]
      }
    ]
  }
}

// An example VNET with a GatewaySubnet and an AzureBastionSubnet
resource virtualnetwork01 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: 'vnet-01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        '10.0.1.4'
        '10.0.1.5'
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: '10.0.0.0/27'
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.0.0/26'
        }
      }
    ]
  }
}

// An example VNET with subnet sub-resources GatewaySubnet and AzureBastionSubnet
resource virtualnetwork02 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: 'vnet-02'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        '10.0.1.4'
        '10.0.1.5'
      ]
    }
  }
}

resource subnet01 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = {
  name: 'GatewaySubnet'
  parent: virtualnetwork02
  properties: {
    addressPrefix: '10.0.0.0/27'
  }
}

resource subnet02 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = {
  name: 'AzureBastionSubnet'
  parent: virtualnetwork02
  properties: {
    addressPrefix: '10.0.0.0/26'
  }
}
