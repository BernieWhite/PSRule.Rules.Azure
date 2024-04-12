// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

param lbName string = 'lb-001'

// An example virtual network (VNET) with NSG configured.
resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: name
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

// An example network security group.
resource nsg 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: name
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

// An example application security group.
resource asg 'Microsoft.Network/applicationSecurityGroups@2023-09-01' = {
  name: name
  location: location
  properties: {}
}

// An example internal load balancer with availability zones configured.
resource internal_lb 'Microsoft.Network/loadBalancers@2023-09-01' = {
  name: lbName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
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

// An example zone redundant public IP address.
resource pip 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: 'pip-001'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
  zones: [
    '1'
    '2'
    '3'
  ]
}

// An example load balancer with serving HTTPS from a backend pool.
resource https_lb 'Microsoft.Network/loadBalancers@2023-09-01' = {
  name: lbName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'frontend1'
        properties: {
          privateIPAddressVersion: 'IPv4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnet01.id
          }
        }
        zones: [
          '2'
          '3'
          '1'
        ]
      }
    ]
    backendAddressPools: [
      {
        name: 'backend1'
      }
    ]
    probes: [
      {
        name: 'https'
        properties: {
          protocol: 'HTTPS'
          port: 443
          requestPath: '/health'
          intervalInSeconds: 5
          numberOfProbes: 1
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'https'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', lbName, 'frontend1')
          }
          frontendPort: 443
          backendPort: 443
          enableFloatingIP: false
          idleTimeoutInMinutes: 4
          protocol: 'TCP'
          loadDistribution: 'Default'
          probe: {
            id: resourceId('Microsoft.Network/loadBalancers/probes', lbName, 'https')
          }
          disableOutboundSnat: true
          enableTcpReset: false
          backendAddressPools: [
            {
              id: resourceId('Microsoft.Network/loadBalancers/backendAddressPools', lbName, 'backend1')
            }
          ]
        }
      }
    ]
    inboundNatRules: []
    outboundRules: []
  }
}

// An example public load balancer.
resource public_lb 'Microsoft.Network/loadBalancers@2023-09-01' = {
  name: lbName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'frontendIPConfig'
        properties: {
          publicIPAddress: {
            id: pip.id
          }
        }
      }
    ]
  }
}

// An example VNET with a GatewaySubnet, AzureBastionSubnet, and AzureBastionSubnet.
resource spoke 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: name
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
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: '10.0.1.0/26'
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.1.64/26'
        }
      }
    ]
  }
}

// An simple VNET with DNS servers defined.
resource hub 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: name
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

// An example peering connection from a spoke to a hub VNET.
resource toHub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-09-01' = {
  parent: spoke
  name: 'peer-to-${hub.name}'
  properties: {
    remoteVirtualNetwork: {
      id: hub.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

// An example peering connection from a hub to a spoke VNET.
resource toSpoke 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-09-01' = {
  parent: hub
  name: 'peer-to-${spoke.name}'
  properties: {
    remoteVirtualNetwork: {
      id: spoke.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

// A gateway subnet defined as a separate sub-resource.
resource subnet01 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' = {
  name: 'GatewaySubnet'
  parent: hub
  properties: {
    addressPrefix: '10.0.0.0/27'
  }
}

// A Azure Bastion Subnet defined as a separate sub-resource.
resource subnet02 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' = {
  name: 'AzureBastionSubnet'
  parent: hub
  properties: {
    addressPrefix: '10.0.0.0/26'
  }
}
