---
reviewed: 2023-07-02
severity: Awareness
pillar: Operational Excellence
category: OE:04 Continuous integration
resource: AI Search
resourceType: Microsoft.Search/searchServices
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.Search.Name/
---

# Azure AI Search name must be valid

## SYNOPSIS

Azure Resource Manager (ARM) has requirements for AI Search service names.

## DESCRIPTION

When naming Azure resources, resource names must meet service requirements.
The requirements for AI Search (previously known as Cognitive Search) service names are:

- Between 2 and 60 characters long.
- Lowercase letters, numbers, and hyphens.
- The first two and last one character must be a letter or a number.
- AI Search service names must be globally unique.

## RECOMMENDATION

Consider using names that meet Azure AI Search service naming requirements.
Additionally consider naming resources with a standard naming convention.

## EXAMPLES

### Configure with Bicep

To deploy AI Search services that pass this rule:

- Set the `name` property to a string that matches the naming requirements.
- Optionally, consider constraining name parameters with `minLength` and `maxLength` attributes.

For example:

```bicep
@minLength(2)
@maxLength(60)
@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

resource search 'Microsoft.Search/searchServices@2023-11-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: 'standard'
  }
  properties: {
    replicaCount: 3
    partitionCount: 1
    hostingMode: 'default'
  }
}
```

<!-- external:avm avm/res/search/search-service name -->

### Configure with Azure template

To deploy AI Search services that pass this rule:

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
      "templateHash": "4357322963880451118"
    }
  },
  "parameters": {
    "name": {
      "type": "string",
      "minLength": 2,
      "maxLength": 60,
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
      "type": "Microsoft.Search/searchServices",
      "apiVersion": "2023-11-01",
      "name": "[parameters('name')]",
      "location": "[parameters('location')]",
      "identity": {
        "type": "SystemAssigned"
      },
      "sku": {
        "name": "standard"
      },
      "properties": {
        "replicaCount": 3,
        "partitionCount": 1,
        "hostingMode": "default"
      }
    }
  ]
}
```

## NOTES

This rule does not check if Azure AI Search service names are unique.

## LINKS

- [OE:04 Continuous integration](https://learn.microsoft.com/azure/well-architected/operational-excellence/release-engineering-continuous-integration)
- [REST API reference](https://learn.microsoft.com/rest/api/searchmanagement/services/create-or-update)
- [Define your naming convention](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
- [Recommended abbreviations for Azure resource types](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.search/searchservices)
