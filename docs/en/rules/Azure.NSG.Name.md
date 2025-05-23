---
reviewed: 2021-11-27
severity: Awareness
pillar: Operational Excellence
category: OE:04 Continuous integration
resource: Network Security Group
resourceType: Microsoft.Network/networkSecurityGroups
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.NSG.Name/
---

# Network Security Group name must be valid

## SYNOPSIS

Azure Resource Manager (ARM) has requirements for Network Security Group (NSG) names.

## DESCRIPTION

When naming Azure resources, resource names must meet service requirements.
The requirements for NSG names are:

- Between 1 and 80 characters long.
- Alphanumerics, underscores, periods, and hyphens.
- Start with alphanumeric.
- End alphanumeric or underscore.
- NSG names must be unique within a resource group.

## RECOMMENDATION

Consider using names that meet Network Security Group naming requirements.
Additionally consider naming resources with a standard naming convention.

## EXAMPLES

### Configure with Bicep

To deploy Network Security Groups that pass this rule:

- Set the `name` property to a string that matches the naming requirements.
- Optionally, consider constraining name parameters with `minLength` and `maxLength` attributes.

For example:

```bicep
@minLength(1)
@maxLength(80)
@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
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
```

<!-- external:avm avm/res/network/network-security-group name -->

### Configure with Azure template

To deploy Network Security Groups that pass this rule:

- Set the `name` property to a string that matches the naming requirements.
- Optionally, consider constraining name parameters with `minLength` and `maxLength` attributes.

For example:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "metadata": {
    "_generator": {
      "name": "bicep",
      "version": "0.34.44.8038",
      "templateHash": "3901699113779854347"
    }
  },
  "parameters": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 80,
      "metadata": {
        "description": "The name of the resource."
      }
    },
    "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]",
      "metadata": {
        "description": "The location resources will be deployed."
      }
    }
  },
  "resources": [
    {
      "type": "Microsoft.Network/networkSecurityGroups",
      "apiVersion": "2024-05-01",
      "name": "[parameters('name')]",
      "location": "[parameters('location')]",
      "properties": {
        "securityRules": [
          {
            "name": "AllowLoadBalancerHealthInbound",
            "properties": {
              "description": "Allow inbound Azure Load Balancer health check.",
              "access": "Allow",
              "direction": "Inbound",
              "priority": 100,
              "protocol": "*",
              "sourcePortRange": "*",
              "sourceAddressPrefix": "AzureLoadBalancer",
              "destinationPortRange": "*",
              "destinationAddressPrefix": "*"
            }
          },
          {
            "name": "AllowApplicationInbound",
            "properties": {
              "description": "Allow internal web traffic into application.",
              "access": "Allow",
              "direction": "Inbound",
              "priority": 300,
              "protocol": "Tcp",
              "sourcePortRange": "*",
              "sourceAddressPrefix": "10.0.0.0/8",
              "destinationPortRange": "443",
              "destinationAddressPrefix": "VirtualNetwork"
            }
          },
          {
            "name": "DenyAllInbound",
            "properties": {
              "description": "Deny all other inbound traffic.",
              "access": "Deny",
              "direction": "Inbound",
              "priority": 4000,
              "protocol": "*",
              "sourcePortRange": "*",
              "sourceAddressPrefix": "*",
              "destinationPortRange": "*",
              "destinationAddressPrefix": "*"
            }
          },
          {
            "name": "DenyTraversalOutbound",
            "properties": {
              "description": "Deny outbound double hop traversal.",
              "access": "Deny",
              "direction": "Outbound",
              "priority": 200,
              "protocol": "Tcp",
              "sourcePortRange": "*",
              "sourceAddressPrefix": "VirtualNetwork",
              "destinationAddressPrefix": "*",
              "destinationPortRanges": [
                "3389",
                "22"
              ]
            }
          }
        ]
      }
    }
  ]
}
```

## NOTES

This rule does not check if NSG names are unique.

If creating resources using CI/CD pipelines consider programmatically Generating Cloud Resource Names using
[PowerShell](https://blog.tyang.org/2022/09/10/programmatically-generate-cloud-resource-names-part-1/) or
[Bicep](https://4bes.nl/2021/10/10/get-a-consistent-azure-naming-convention-with-bicep-modules/)

## LINKS

- [OE:04 Continuous integration](https://learn.microsoft.com/azure/well-architected/operational-excellence/release-engineering-continuous-integration)
- [Naming rules and restrictions for Azure resources](https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules)
- [Recommended abbreviations for Azure resource types](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Parameters in Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/parameters)
- [Bicep functions](https://learn.microsoft.com/azure/azure-resource-manager/bicep/bicep-functions)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.network/networksecuritygroups)
