---
reviewed: 2025-01-23
severity: Awareness
pillar: Reliability
category: RE:01 Simplicity and efficiency
resource: Network Interface
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.NIC.UniqueDns/
---

# NICs with custom DNS settings

## SYNOPSIS

Network interfaces (NICs) should inherit DNS from virtual networks.

## DESCRIPTION

By default Virtual machine (VM) NICs automatically use a DNS configuration inherited from the virtual network they connect to.
Optionally, DNS servers can be overridden on a per NIC basis with a custom configuration.

Using network interfaces with individual DNS server settings may increase management overhead and complexity.

## RECOMMENDATION

Consider updating NIC DNS server settings to inherit from virtual network.

## EXAMPLES

### Configure with Bicep

To deploy NICs that pass this rule:

- Clear the `properties.dnsSettings.dnsServers` property. OR
- Remove the `properties.dnsSettings` property.

For example:

```bicep
resource nic 'Microsoft.Network/networkInterfaces@2024-05-01' = {
  name: name
  location: location
  properties: {
    dnsSettings: {
      dnsServers: []
    }
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}
```

<!-- external:avm avm/res/network/network-interface dnsServers -->

### Configure with Azure template

To deploy NICs that pass this rule:

- Clear the `properties.dnsSettings.dnsServers` property. OR
- Remove the `properties.dnsSettings` property.

For example:

```json
{
  "type": "Microsoft.Network/networkInterfaces",
  "apiVersion": "2024-05-01",
  "name": "[parameters('name')]",
  "location": "[parameters('location')]",
  "properties": {
    "dnsSettings": {
      "dnsServers": []
    },
    "ipConfigurations": [
      {
        "name": "ipconfig1",
        "properties": {
          "privateIPAllocationMethod": "Dynamic",
          "subnet": {
            "id": "[parameters('subnetId')]"
          }
        }
      }
    ]
  }
}
```

### Configure with Azure CLI

To configure NICs that pass this rule, clear the DNS servers configuration:

```bash
az network nic update -n '<name>' -g '<resource_group>' --dns-servers null
```

### Configure with Azure PowerShell

To configure NICs that pass this rule, clear the DNS servers configuration:

```powershell
# Place the network interface configuration into a variable.
$nic = Get-AzNetworkInterface -Name '<name>' -ResourceGroupName '<resource_group>'

# Remove the DNS servers configuration.
$nic.DnsSettings.DnsServers.Remove("192.168.1.100")
$nic.DnsSettings.DnsServers.Remove("192.168.1.101")

# Apply the new configuration to the network interface.
$nic | Set-AzNetworkInterface
```

## LINKS

- [RE:01 Simplicity and efficiency](https://learn.microsoft.com/azure/well-architected/reliability/simplify)
- [Change DNS servers](https://learn.microsoft.com/azure/virtual-network/virtual-network-network-interface#change-dns-servers)
