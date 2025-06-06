---
reviewed: 2021-12-20
severity: Awareness
pillar: Operational Excellence
category: OE:04 Continuous integration
resource: Application Insights
resourceType: Microsoft.Insights/components
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.AppInsights.Name/
---

# Use valid Application Insights resource names

## SYNOPSIS

Azure Resource Manager (ARM) has requirements for Application Insights resource names.

## DESCRIPTION

When naming Azure resources, resource names must meet service requirements.
The requirements for Application Insights resource names are:

- Between 1 and 255 characters long.
- Letters, numbers, hyphens, periods, underscores, and parenthesis.
- Must not end in a period.
- Resource names must be unique within a resource group.

## RECOMMENDATION

Consider using names that meet Application Insights resource naming requirements.
Additionally consider naming resources with a standard naming convention.

## EXAMPLES

### Configure with Bicep

To deploy resources that pass this rule:

- Set the `name` property to a string that matches the naming requirements.
- Optionally, consider constraining name parameters with `minLength` and `maxLength` attributes.

For example:

```bicep
@minLength(1)
@maxLength(255)
@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: name
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtension'
    WorkspaceResourceId: workspaceId
    DisableLocalAuth: true
  }
}
```

<!-- external:avm avm/res/insights/component name -->

### Configure with Azure template

To deploy resources that pass this rule:

- Set the `name` property to a string that matches the naming requirements.
- Optionally, consider constraining name parameters with `minLength` and `maxLength` attributes.

For example:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255,
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
      "type": "Microsoft.Insights/components",
      "apiVersion": "2020-02-02",
      "name": "[parameters('name')]",
      "location": "[parameters('location')]",
      "kind": "web",
      "properties": {
        "Application_Type": "web",
        "Flow_Type": "Redfield",
        "Request_Source": "IbizaAIExtension",
        "WorkspaceResourceId": "[parameters('workspaceId')]",
        "DisableLocalAuth": true
      }
    }
  ]
}
```

## NOTES

This rule does not check if Application Insights resource names are unique.

## LINKS

- [OE:04 Continuous integration](https://learn.microsoft.com/azure/well-architected/operational-excellence/release-engineering-continuous-integration)
- [Naming rules and restrictions for Azure resources](https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules)
- [Recommended abbreviations for Azure resource types](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Parameters in Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/parameters)
- [Bicep functions](https://learn.microsoft.com/azure/azure-resource-manager/bicep/bicep-functions)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.insights/components)
