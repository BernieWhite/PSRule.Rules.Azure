---
severity: Important
pillar: Security
category: SE:06 Network controls
resource: SQL Database
resourceType: Microsoft.Sql/servers,Microsoft.Sql/servers/firewallRules
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.SQL.AllowAzureAccess/
ms-content-id: 30a551f6-54e0-4e51-b068-f9695d891a89
---

# Limit SQL database network access to trusted IP addresses

## SYNOPSIS

Determine if access from Azure services is required.

## DESCRIPTION

Allow access to Azure services, permits any Azure service network based access to databases.
Network based access it not limited to a single customer, all Azure IP addresses are permitted.
Network access can also be allowed/ blocked on individual databases, which takes precedence over server firewall rules.

If network based access is permitted, authentication is still required.

Enabling access from Azure Services is useful in certain cases for on demand PaaS workloads where configuring a stable IP address is not possible.
For example Azure Functions, Container Instances and Logic Apps.

## RECOMMENDATION

Consider using a stable IP address or configure virtual network based firewall rules.
Determine if access from Azure services is required for the services connecting to the hosted databases.

## LINKS

- [SE:06 Network controls](https://learn.microsoft.com/azure/well-architected/security/networking)
- [Connections from inside Azure](https://learn.microsoft.com/azure/azure-sql/database/firewall-configure?view=azuresql#connections-from-inside-azure)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.sql/servers)
