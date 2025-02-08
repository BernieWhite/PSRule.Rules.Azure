---
reviewed: 2025-01-23
severity: Critical
pillar: Security
category: SE:07 Encryption
resource: SQL Database
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.SQL.MinTLS/
---

# Logical SQL Servers accepts insecure TLS versions

## SYNOPSIS

Azure SQL Database servers should reject TLS versions older than 1.2.

## DESCRIPTION

The minimum version of TLS that Azure SQL Database servers accept is configurable.
Older TLS versions are no longer considered secure by industry standards, such as PCI DSS.

Azure lets you disable outdated protocols and require connections to use a minimum of TLS 1.2.
By default, TLS versions 1.0, 1.1, 1.2, and 1.3 are accepted.

When clients connect using an older version of TLS that is disabled, the connection will fail.

## RECOMMENDATION

Consider configuring the minimum supported TLS version to be 1.2.
Also consider enforcing this setting using Azure Policy.

## EXAMPLES

### Configure with Bicep

To deploy logical SQL Servers that pass this rule:

- Set the `properties.minimalTlsVersion` property to `1.2` or `1.3`.

For example:

```bicep
resource server 'Microsoft.Sql/servers@2024-05-01-preview' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
    minimalTlsVersion: '1.2'
    administrators: {
      azureADOnlyAuthentication: true
      administratorType: 'ActiveDirectory'
      login: adminLogin
      principalType: 'Group'
      sid: adminPrincipalId
      tenantId: tenant().tenantId
    }
  }
}
```

<!-- external:avm avm/res/sql/server minimalTlsVersion -->

### Configure with Azure template

To deploy logical SQL Servers that pass this rule:

- Set the `properties.minimalTlsVersion` property to `1.2` or `1.3`.

For example:

```json
{
  "type": "Microsoft.Sql/servers",
  "apiVersion": "2024-05-01-preview",
  "name": "[parameters('name')]",
  "location": "[parameters('location')]",
  "properties": {
    "publicNetworkAccess": "Disabled",
    "minimalTlsVersion": "1.2",
    "administrators": {
      "azureADOnlyAuthentication": true,
      "administratorType": "ActiveDirectory",
      "login": "[parameters('adminLogin')]",
      "principalType": "Group",
      "sid": "[parameters('adminPrincipalId')]",
      "tenantId": "[tenant().tenantId]"
    }
  }
}
```

### Configure with Azure Policy

To address this issue at runtime use the following policies:

- [Azure SQL Database should be running TLS version 1.2 or newer](https://github.com/Azure/azure-policy/blob/master/built-in-policies/policyDefinitions/SQL/SqlServer_MiniumTLSVersion_Audit.json)
  `/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf`

## LINKS

- [SE:07 Encryption](https://learn.microsoft.com/azure/well-architected/security/encryption#data-in-transit)
- [DP-3: Encrypt sensitive data in transit](https://learn.microsoft.com/security/benchmark/azure/baselines/azure-sql-security-baseline#dp-3-encrypt-sensitive-data-in-transit)
- [Minimal TLS Version](https://learn.microsoft.com/azure/azure-sql/database/connectivity-settings#minimum-tls-version)
- [TLS encryption in Azure](https://learn.microsoft.com/azure/security/fundamentals/encryption-overview#tls-encryption-in-azure)
- [Preparing for TLS 1.2 in Microsoft Azure](https://azure.microsoft.com/updates?id=azuretls12)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.sql/servers)
