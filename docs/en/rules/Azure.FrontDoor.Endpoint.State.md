---
severity: Awareness
pillar: Cost Optimization
category: Resource usage
resource: Front Door
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.FrontDoor.Endpoint.State/
---

# Enable Front Door instance

## SYNOPSIS

Enable Azure Front Door instance.

## DESCRIPTION

The operational state of a Front Door instance is configurable, either enabled or disabled.
By default, a Front Door is enabled.

Optionally, a Front Door instance may be disabled to temporarily prevent traffic being processed.

## RECOMMENDATION

Consider enabling Front Door service or remove the instance if it no longer required.

## EXAMPLES

### Configure with Azure template

=== "Premium / Standard"

    To deploy a Front Door resource that passes this rule:

    - Set the `properties.enabledState` property to `Enabled` of the `afdEndpoints` sub-resource.

    For example:

    ```json
    {
      "type": "Microsoft.Cdn/profiles",
      "apiVersion": "2021-06-01",
      "name": "[parameters('name')]",
      "location": "Global",
      "sku": {
        "name": "Premium_AzureFrontDoor"
      }
    },
    {
      "type": "Microsoft.Cdn/profiles/afdEndpoints",
      "apiVersion": "2021-06-01",
      "name": "[format('{0}/{1}', parameters('name'), parameters('name'))]",
      "location": "Global",
      "properties": {
        "enabledState": "Enabled"
      },
      "dependsOn": [
        "[parameters('name')]"
      ]
    }
    ```

=== "Classic"

    To deploy a Front Door resource that passes this rule:

    - Set the `properties.enabledState` property to `Enabled`.

    For example:

    ```json
    {
      "type": "Microsoft.Network/frontDoors",
      "apiVersion": "2021-06-01",
      "name": "[parameters('name')]",
      "location": "global",
      "properties": {
        "enabledState": "Enabled",
        "frontendEndpoints": "[variables('frontendEndpoints')]",
        "loadBalancingSettings": "[variables('loadBalancingSettings')]",
        "backendPools": "[variables('backendPools')]",
        "healthProbeSettings": "[variables('healthProbeSettings')]",
        "routingRules": "[variables('routingRules')]"
      }
    }
    ```

### Configure with Bicep

=== "Premium / Standard"

    To deploy a Front Door resource that passes this rule:

    - Set the `properties.enabledState` property to `Enabled` of the `afdEndpoints` sub-resource.

    For example:

    ```bicep
    resource afd_premium 'Microsoft.Cdn/profiles@2021-06-01' = {
      name: name
      location: 'Global'
      sku: {
        name: 'Premium_AzureFrontDoor'
      }
    }

    resource adf_endpoint 'Microsoft.Cdn/profiles/afdEndpoints@2021-06-01' = {
      parent: afd_premium
      name: name
      location: 'Global'
      properties: {
        enabledState: 'Enabled'
      }
    }
    ```

=== "Classic"

    To deploy a Front Door resource that passes this rule:

    - Set the `properties.enabledState` property to `Enabled`.

    For example:

    ```bicep
    resource afd_classic 'Microsoft.Network/frontDoors@2021-06-01' = {
      name: name
      location: 'global'
      properties: {
        enabledState: 'Enabled'
        frontendEndpoints: frontendEndpoints
        loadBalancingSettings: loadBalancingSettings
        backendPools: backendPools
        healthProbeSettings: healthProbeSettings
        routingRules: routingRules
      }
    }
    ```
