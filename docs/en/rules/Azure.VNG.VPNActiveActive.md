---
severity: Important
pillar: Reliability
category: RE:05 Redundancy
resource: Virtual Network Gateway
resourceType: Microsoft.Network/virtualNetworkGateways
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.VNG.VPNActiveActive/
---

# Use Active-Active VPN gateways

## SYNOPSIS

Use VPN gateways configured to operate in an Active-Active configuration to reduce connectivity downtime.

## DESCRIPTION

VPN Gateways can be configured as either Active-Passive or Active-Active for Site-to-Site (S2S) connections.
When deploying VPN gateways, Azure deploys two instances for high-availability (HA).

When using an Active-Passive configuration, one instance is designated a standby for failover.

Gateways configured to use an Active-Active configuration:

- Establish two IPSEC tunnels, one from each instance per connection.
- Each instance will load balance network traffic.

## RECOMMENDATION

Consider using Active-Active VPN gateways to reduce connectivity downtime during HA failover.

## EXAMPLES

### Configure with Azure template

To configure VPN gateways that pass this rule:

- Set `properties.activeActive` to `true`.

For example:

```json
{
  "type": "Microsoft.Network/virtualNetworkGateways",
  "apiVersion": "2023-11-01",
  "name": "[parameters('name')]",
  "location": "[parameters('location')]",
  "properties": {
    "gatewayType": "Vpn",
    "ipConfigurations": [
      {
        "name": "default",
        "properties": {
          "privateIPAllocationMethod": "Dynamic",
          "subnet": {
            "id": "[parameters('subnetId')]"
          },
          "publicIPAddress": {
            "id": "[parameters('pipId')]"
          }
        }
      }
    ],
    "activeActive": true,
    "vpnType": "RouteBased",
    "vpnGatewayGeneration": "Generation2",
    "sku": {
      "name": "VpnGw1AZ",
      "tier": "VpnGw1AZ"
    }
  }
}
```

### Configure with Bicep

To configure VPN gateways that pass this rule:

- Set `properties.activeActive` to `true`.

For example:

```bicep
resource vng 'Microsoft.Network/virtualNetworkGateways@2023-11-01' = {
  name: name
  location: location
  properties: {
    gatewayType: 'Vpn'
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
          publicIPAddress: {
            id: pipId
          }
        }
      }
    ]
    activeActive: true
    vpnType: 'RouteBased'
    vpnGatewayGeneration: 'Generation2'
    sku: {
      name: 'VpnGw1AZ'
      tier: 'VpnGw1AZ'
    }
  }
}
```

<!-- external:avm avm/res/network/virtual-network-gateway activeActive -->

## NOTES

Azure provisions a single instance for Basic (legacy) VPN gateways.
As a result, Basic VPN gateways do not support Active-Active connections.
To use Active-Active VPN connections, migrate to a gateway configured as VpnGw1 or higher SKU.

## LINKS

- [RE:05 Redundancy](https://learn.microsoft.com/azure/well-architected/reliability/redundancy)
- [Highly Available Cross-Premises and VNet-to-VNet Connectivity](https://learn.microsoft.com/azure/vpn-gateway/vpn-gateway-highlyavailable)
- [Update an existing VPN gateway](https://learn.microsoft.com/azure/vpn-gateway/vpn-gateway-activeactive-rm-powershell#update-an-existing-vpn-gateway)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.network/virtualnetworkgateways)
