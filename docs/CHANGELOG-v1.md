---
discussion: false
link_users: true
---

# Change log

See [upgrade notes][1] for helpful information when upgrading from previous versions.

[1]: upgrade-notes.md

**Important notes**:

- Issue #741: `Could not load file or assembly YamlDotNet`.
  See [troubleshooting guide] for a workaround to this issue.
- The configuration option `Azure_AKSMinimumVersion` is replaced with `AZURE_AKS_CLUSTER_MINIMUM_VERSION`.
  If you have this option configured, please update it to `AZURE_AKS_CLUSTER_MINIMUM_VERSION`.
  Support for `Azure_AKSMinimumVersion` will be removed in v2.
  See [upgrade notes][1] for more information.
- The `SupportsTag` PowerShell function has been replaced with the `Azure.Resource.SupportsTags` selector.
  Update PowerShell rules to use the `Azure.Resource.SupportsTags` selector instead.
  Support for the `SupportsTag` function will be removed in v2.
  See [upgrade notes][1] for more information.

## Unreleased

What's changed since pre-release v1.23.0-B0046:

- New features:
  - Added December 2022 baselines `Azure.GA_2022_12` and `Azure.Preview_2022_12` by @BernieWhite.
    [#1961](https://github.com/Azure/PSRule.Rules.Azure/issues/1961)
    - Includes rules released before or during December 2022.
    - Marked `Azure.GA_2022_09` and `Azure.Preview_2022_09` baselines as obsolete.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.25.4` by @BernieWhite.
      [#1960](https://github.com/Azure/PSRule.Rules.Azure/issues/1960)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Engineering:
  - Bump Microsoft.NET.Test.Sdk v17.4.1.
    [#1964](https://github.com/Azure/PSRule.Rules.Azure/pull/1964)

## v1.23.0-B0046 (pre-release)

What's changed since pre-release v1.23.0-B0025:

- New rules:
  - Bastion:
    - Check Bastion hosts names meet naming requirements by @BenjaminEngeset.
      [#1950](https://github.com/Azure/PSRule.Rules.Azure/issues/1950)
  - Recovery Services Vault:
    - Check Recovery Services vaults names meet naming requirements by @BenjaminEngeset.
      [#1953](https://github.com/Azure/PSRule.Rules.Azure/issues/1953)
- Bug fixes:
  - Fixed `Azure.Deployment.SecureValue` with `reference` function expression by @BernieWhite.
    [#1882](https://github.com/Azure/PSRule.Rules.Azure/issues/1882)

## v1.23.0-B0025 (pre-release)

What's changed since pre-release v1.23.0-B0009:

- New rules:
  - Application Gateway:
    - Check Application Gateways names meet naming requirements by @BenjaminEngeset.
      [#1943](https://github.com/Azure/PSRule.Rules.Azure/issues/1943)
  - Azure Cache for Redis:
    - Check Azure Cache for Redis instances uses Redis 6 by @BenjaminEngeset.
      [#1077](https://github.com/Azure/PSRule.Rules.Azure/issues/1077)
  - Virtual Machine Scale Sets:
    - Check virtual machine scale sets has Azure Monitor Agent installed by @BenjaminEngeset.
      [#1867](https://github.com/Azure/PSRule.Rules.Azure/issues/1867)
- General improvements:
  - Added support to export exemptions related to policy assignments by @BernieWhite.
    [#1888](https://github.com/Azure/PSRule.Rules.Azure/issues/1888)
  - Added support for Bicep `flatten` function by @BernieWhite.
    [#1536](https://github.com/Azure/PSRule.Rules.Azure/issues/1536)
- Engineering:
  - Bump Az.Resources to v6.5.0.
    [#1945](https://github.com/Azure/PSRule.Rules.Azure/pull/1945)

## v1.23.0-B0009 (pre-release)

What's changed since v1.22.1:

- New rules:
  - API Management:
    - Check API management instances has multi-region deployment gateways enabled by @BenjaminEngeset.
      [#1910](https://github.com/Azure/PSRule.Rules.Azure/issues/1910)
  - Azure Database for MariaDB:
    - Check Azure Database for MariaDB servers limits the amount of firewall permitted IP addresses by @BenjaminEngeset.
      [#1856](https://github.com/Azure/PSRule.Rules.Azure/issues/1856)
    - Check Azure Database for MariaDB servers limits the amount of firewall rules allowed by @BenjaminEngeset.
      [#1855](https://github.com/Azure/PSRule.Rules.Azure/issues/1855)
    - Check Azure Database for MariaDB servers does not have Azure services bypassed on firewall by @BenjaminEngeset.
      [#1857](https://github.com/Azure/PSRule.Rules.Azure/issues/1857)
  - Virtual Machine:
    - Check virtual machines has Azure Monitor Agent installed by @BenjaminEngeset.
      [#1868](https://github.com/Azure/PSRule.Rules.Azure/issues/1868)
- Bug fixes:
  - Fixed Azure.AKS.Version ignore clusters with auto-upgrade enabled by @BenjaminEngeset.
    [#1926](https://github.com/Azure/PSRule.Rules.Azure/issues/1926)

## v1.22.2

What's changed since v1.22.1:

- Bug fixes:
  - Fixed `Azure.Deployment.SecureValue` with `reference` function expression by @BernieWhite.
    [#1882](https://github.com/Azure/PSRule.Rules.Azure/issues/1882)

## v1.22.1

What's changed since v1.22.0:

- Bug fixes:
  - Fixed template parameter does not use the required format by @BernieWhite.
    [#1930](https://github.com/Azure/PSRule.Rules.Azure/issues/1930)

## v1.22.0

What's changed since v1.21.2:

- New rules:
  - API Management:
    - Check API management instances uses multi-region deployment by @BenjaminEngeset.
      [#1030](https://github.com/Azure/PSRule.Rules.Azure/issues/1030)
    - Check api management instances limits control plane API calls to apim with version `'2021-08-01'` or newer by @BenjaminEngeset.
      [#1819](https://github.com/Azure/PSRule.Rules.Azure/issues/1819)
  - App Service Environment:
    - Check app service environments uses version 3 (ASEv3) instead of classic version 1 (ASEv1) and version 2 (ASEv2) by @BenjaminEngeset.
      [#1805](https://github.com/Azure/PSRule.Rules.Azure/issues/1805)
  - Azure Database for MariaDB:
    - Check Azure Database for MariaDB servers, databases, firewall rules and VNET rules names meet naming requirements by @BenjaminEngeset.
      [#1854](https://github.com/Azure/PSRule.Rules.Azure/issues/1854)
    - Check Azure Database for MariaDB servers only uses TLS 1.2 version by @BenjaminEngeset.
      [#1853](https://github.com/Azure/PSRule.Rules.Azure/issues/1853)
    - Check Azure Database for MariaDB servers only accept encrypted connections by @BenjaminEngeset.
      [#1852](https://github.com/Azure/PSRule.Rules.Azure/issues/1852)
    - Check Azure Database for MariaDB servers have Microsoft Defender configured by @BenjaminEngeset.
      [#1850](https://github.com/Azure/PSRule.Rules.Azure/issues/1850)
    - Check Azure Database for MariaDB servers have geo-redundant backup configured by @BenjaminEngeset.
      [#1848](https://github.com/Azure/PSRule.Rules.Azure/issues/1848)
  - Azure Database for PostgreSQL:
    - Check Azure Database for PostgreSQL servers have Microsoft Defender configured by @BenjaminEngeset.
      [#286](https://github.com/Azure/PSRule.Rules.Azure/issues/286)
    - Check Azure Database for PostgreSQL servers have geo-redundant backup configured by @BenjaminEngeset.
      [#285](https://github.com/Azure/PSRule.Rules.Azure/issues/285)
  - Azure Database for MySQL:
    - Check Azure Database for MySQL servers have Microsoft Defender configured by @BenjaminEngeset.
      [#287](https://github.com/Azure/PSRule.Rules.Azure/issues/287)
    - Check Azure Database for MySQL servers uses the flexible deployment model by @BenjaminEngeset.
      [#1841](https://github.com/Azure/PSRule.Rules.Azure/issues/1841)
    - Check Azure Database for MySQL Flexible Servers have geo-redundant backup configured by @BenjaminEngeset.
      [#1840](https://github.com/Azure/PSRule.Rules.Azure/issues/1840)
    - Check Azure Database for MySQL servers have geo-redundant backup configured by @BenjaminEngeset.
      [#284](https://github.com/Azure/PSRule.Rules.Azure/issues/284)
  - Azure Resource Deployments:
    - Check for nested deployment that are scoped to `outer` and passing secure values by @ms-sambell.
      [#1475](https://github.com/Azure/PSRule.Rules.Azure/issues/1475)
    - Check custom script extension uses protected settings for secure values by @ms-sambell.
      [#1478](https://github.com/Azure/PSRule.Rules.Azure/issues/1478)
  - Front Door:
    - Check front door uses caching by @BenjaminEngeset.
      [#548](https://github.com/Azure/PSRule.Rules.Azure/issues/548)
  - Virtual Machine:
    - Check virtual machines running SQL Server uses Premium disks or above by @BenjaminEngeset.
      [#9](https://github.com/Azure/PSRule.Rules.Azure/issues/9)
  - Virtual Network:
    - Check VNETs with a GatewaySubnet also has an AzureFirewallSubnet by @BernieWhite.
      [#875](https://github.com/Azure/PSRule.Rules.Azure/issues/875)
- General improvements:
  - Added debug logging improvements for Bicep expansion by @BernieWhite.
    [#1901](https://github.com/Azure/PSRule.Rules.Azure/issues/1901)
- Engineering:
  - Bump PSRule to v2.6.0.
    [#1883](https://github.com/Azure/PSRule.Rules.Azure/pull/1883)
  - Bump Az.Resources to v6.4.1.
    [#1883](https://github.com/Azure/PSRule.Rules.Azure/pull/1883)
  - Bump Microsoft.NET.Test.Sdk to v17.4.0
    [#1838](https://github.com/Azure/PSRule.Rules.Azure/pull/1838)
  - Bump coverlet.collector to v3.2.0.
    [#1814](https://github.com/Azure/PSRule.Rules.Azure/pull/1814)
- Bug fixes:
  - Fixed ref and name duplicated by @BernieWhite.
    [#1876](https://github.com/Azure/PSRule.Rules.Azure/issues/1876)
  - Fixed an item with the same key for parameters by @BernieWhite
    [#1871](https://github.com/Azure/PSRule.Rules.Azure/issues/1871)
  - Fixed policy parse of `requestContext` function by @BernieWhite.
    [#1654](https://github.com/Azure/PSRule.Rules.Azure/issues/1654)
  - Fixed handling of policy type field by @BernieWhite.
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)
  - Fixed `Azure.AppService.WebProbe` with non-boolean value set by @BernieWhite.
    [#1906](https://github.com/Azure/PSRule.Rules.Azure/issues/1906)
  - Fixed managed identity flagged as secret by `Azure.Deployment.OutputSecretValue` by @BernieWhite.
    [#1826](https://github.com/Azure/PSRule.Rules.Azure/issues/1826)
    [#1886](https://github.com/Azure/PSRule.Rules.Azure/issues/1886)
  - Fixed missing support for diagnostic settings category groups by @BenjaminEngeset.
    [#1873](https://github.com/Azure/PSRule.Rules.Azure/issues/1873)

What's changed since pre-release v1.22.0-B0203:

- No additional changes.

## v1.22.0-B0203 (pre-release)

What's changed since pre-release v1.22.0-B0153:

- General improvements:
  - Added debug logging improvements for Bicep expansion by @BernieWhite.
    [#1901](https://github.com/Azure/PSRule.Rules.Azure/issues/1901)
- Bug fixes:
  - Fixed `Azure.AppService.WebProbe` with non-boolean value set by @BernieWhite.
    [#1906](https://github.com/Azure/PSRule.Rules.Azure/issues/1906)

## v1.22.0-B0153 (pre-release)

What's changed since pre-release v1.22.0-B0106:

- Bug fixes:
  - Fixed managed identity flagged as secret by `Azure.Deployment.OutputSecretValue` by @BernieWhite.
    [#1826](https://github.com/Azure/PSRule.Rules.Azure/issues/1826)
    [#1886](https://github.com/Azure/PSRule.Rules.Azure/issues/1886)

## v1.22.0-B0106 (pre-release)

What's changed since pre-release v1.22.0-B0062:

- New rules:
  - API Management:
    - Check API management instances uses multi-region deployment by @BenjaminEngeset.
      [#1030](https://github.com/Azure/PSRule.Rules.Azure/issues/1030)
  - Azure Database for MariaDB:
    - Check Azure Database for MariaDB servers, databases, firewall rules and VNET rules names meet naming requirements by @BenjaminEngeset.
      [#1854](https://github.com/Azure/PSRule.Rules.Azure/issues/1854)
- Engineering:
  - Bump PSRule to v2.6.0.
    [#1883](https://github.com/Azure/PSRule.Rules.Azure/pull/1883)
  - Bump Az.Resources to v6.4.1.
    [#1883](https://github.com/Azure/PSRule.Rules.Azure/pull/1883)
- Bug fixes:
  - Fixed ref and name duplicated by @BernieWhite.
    [#1876](https://github.com/Azure/PSRule.Rules.Azure/issues/1876)
  - Fixed an item with the same key for parameters by @BernieWhite
    [#1871](https://github.com/Azure/PSRule.Rules.Azure/issues/1871)
  - Fixed policy parse of `requestContext` function by @BernieWhite.
    [#1654](https://github.com/Azure/PSRule.Rules.Azure/issues/1654)
  - Fixed handling of policy type field by @BernieWhite.
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)

## v1.22.0-B0062 (pre-release)

What's changed since pre-release v1.22.0-B0026:

- New rules:
  - Azure Database for MariaDB:
    - Check Azure Database for MariaDB servers only uses TLS 1.2 version by @BenjaminEngeset.
      [#1853](https://github.com/Azure/PSRule.Rules.Azure/issues/1853)
    - Check Azure Database for MariaDB servers only accept encrypted connections by @BenjaminEngeset.
      [#1852](https://github.com/Azure/PSRule.Rules.Azure/issues/1852)
    - Check Azure Database for MariaDB servers have Microsoft Defender configured by @BenjaminEngeset.
      [#1850](https://github.com/Azure/PSRule.Rules.Azure/issues/1850)
    - Check Azure Database for MariaDB servers have geo-redundant backup configured by @BenjaminEngeset.
      [#1848](https://github.com/Azure/PSRule.Rules.Azure/issues/1848)
  - Azure Database for PostgreSQL:
    - Check Azure Database for PostgreSQL servers have Microsoft Defender configured by @BenjaminEngeset.
      [#286](https://github.com/Azure/PSRule.Rules.Azure/issues/286)
    - Check Azure Database for PostgreSQL servers have geo-redundant backup configured by @BenjaminEngeset.
      [#285](https://github.com/Azure/PSRule.Rules.Azure/issues/285)
  - Azure Database for MySQL:
    - Check Azure Database for MySQL servers have Microsoft Defender configured by @BenjaminEngeset.
      [#287](https://github.com/Azure/PSRule.Rules.Azure/issues/287)
    - Check Azure Database for MySQL servers uses the flexible deployment model by @BenjaminEngeset.
      [#1841](https://github.com/Azure/PSRule.Rules.Azure/issues/1841)
    - Check Azure Database for MySQL Flexible Servers have geo-redundant backup configured by @BenjaminEngeset.
      [#1840](https://github.com/Azure/PSRule.Rules.Azure/issues/1840)
    - Check Azure Database for MySQL servers have geo-redundant backup configured by @BenjaminEngeset.
      [#284](https://github.com/Azure/PSRule.Rules.Azure/issues/284)
  - Azure Resource Deployments:
    - Check for nested deployment that are scoped to `outer` and passing secure values by @ms-sambell.
      [#1475](https://github.com/Azure/PSRule.Rules.Azure/issues/1475)
    - Check custom script extension uses protected settings for secure values by @ms-sambell.
      [#1478](https://github.com/Azure/PSRule.Rules.Azure/issues/1478)
  - Virtual Machine:
    - Check virtual machines running SQL Server uses Premium disks or above by @BenjaminEngeset.
      [#9](https://github.com/Azure/PSRule.Rules.Azure/issues/9)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.4.0
    [#1838](https://github.com/Azure/PSRule.Rules.Azure/pull/1838)
  - Bump coverlet.collector to v3.2.0.
    [#1814](https://github.com/Azure/PSRule.Rules.Azure/pull/1814)
- Bug fixes:
  - Fixed missing support for diagnostic settings category groups by @BenjaminEngeset.
    [#1873](https://github.com/Azure/PSRule.Rules.Azure/issues/1873)

## v1.22.0-B0026 (pre-release)

What's changed since pre-release v1.22.0-B0011:

- New rules:
  - API Management:
    - Check api management instances limits control plane API calls to apim with version `'2021-08-01'` or newer by @BenjaminEngeset.
      [#1819](https://github.com/Azure/PSRule.Rules.Azure/issues/1819)
- Engineering:
  - Bump Az.Resources to v6.4.0.
    [#1829](https://github.com/Azure/PSRule.Rules.Azure/pull/1829)
- Bug fixes:
  - Fixed non-Linux VM images flagged as Linux by @BernieWhite.
    [#1825](https://github.com/Azure/PSRule.Rules.Azure/issues/1825)
  - Fixed failed to expand with last function on runtime property by @BernieWhite.
    [#1830](https://github.com/Azure/PSRule.Rules.Azure/issues/1830)

## v1.22.0-B0011 (pre-release)

What's changed since v1.21.0:

- New rules:
  - App Service Environment:
    - Check app service environments uses version 3 (ASEv3) instead of classic version 1 (ASEv1) and version 2 (ASEv2) by @BenjaminEngeset.
      [#1805](https://github.com/Azure/PSRule.Rules.Azure/issues/1805)
  - Front Door:
    - Check front door uses caching by @BenjaminEngeset.
      [#548](https://github.com/Azure/PSRule.Rules.Azure/issues/548)
  - Virtual Network:
    - Check VNETs with a GatewaySubnet also has an AzureFirewallSubnet by @BernieWhite.
      [#875](https://github.com/Azure/PSRule.Rules.Azure/issues/875)

## v1.21.2

What's changed since v1.21.1:

- Bug fixes:
  - Fixed non-Linux VM images flagged as Linux by @BernieWhite.
    [#1825](https://github.com/Azure/PSRule.Rules.Azure/issues/1825)
  - Fixed failed to expand with last function on runtime property by @BernieWhite.
    [#1830](https://github.com/Azure/PSRule.Rules.Azure/issues/1830)

## v1.21.1

What's changed since v1.21.0:

- Bug fixes:
  - Fixed multiple nested parameter loops returns stack empty exception by @BernieWhite.
    [#1811](https://github.com/Azure/PSRule.Rules.Azure/issues/1811)
  - Fixed `Azure.ACR.ContentTrust` when customer managed keys are enabled by @BernieWhite.
    [#1810](https://github.com/Azure/PSRule.Rules.Azure/issues/1810)

## v1.21.0

What's changed since v1.20.2:

- New features:
  - Mapping of Azure Security Benchmark v3 to security rules by @jagoodwin.
    [#1610](https://github.com/Azure/PSRule.Rules.Azure/issues/1610)
- New rules:
  - Deployment:
    - Check sensitive resource values use secure parameters by @VeraBE @BernieWhite.
      [#1773](https://github.com/Azure/PSRule.Rules.Azure/issues/1773)
  - Service Bus:
    - Check service bus namespaces uses TLS 1.2 version by @BenjaminEngeset.
      [#1777](https://github.com/Azure/PSRule.Rules.Azure/issues/1777)
  - Virtual Machine:
    - Check virtual machines uses Azure Monitor Agent instead of old legacy Log Analytics Agent by @BenjaminEngeset.
      [#1792](https://github.com/Azure/PSRule.Rules.Azure/issues/1792)
  - Virtual Machine Scale Sets:
    - Check virtual machine scale sets uses Azure Monitor Agent instead of old legacy Log Analytics Agent by @BenjaminEngeset.
      [#1792](https://github.com/Azure/PSRule.Rules.Azure/issues/1792)
  - Virtual Network:
    - Check VNETs with a GatewaySubnet also has a AzureBastionSubnet by @BenjaminEngeset.
      [#1761](https://github.com/Azure/PSRule.Rules.Azure/issues/1761)
- General improvements:
  - Added built-in list of ignored policy definitions by @BernieWhite.
    [#1730](https://github.com/Azure/PSRule.Rules.Azure/issues/1730)
    - To ignore additional policy definitions, use the `AZURE_POLICY_IGNORE_LIST` configuration option.
- Engineering:
  - Bump PSRule to v2.5.3.
    [#1800](https://github.com/Azure/PSRule.Rules.Azure/pull/1800)
  - Bump Az.Resources to v6.3.1.
    [#1800](https://github.com/Azure/PSRule.Rules.Azure/pull/1800)

What's changed since pre-release v1.21.0-B0050:

- No additional changes.

## v1.21.0-B0050 (pre-release)

What's changed since pre-release v1.21.0-B0027:

- New rules:
  - Virtual Machine:
    - Check virtual machines uses Azure Monitor Agent instead of old legacy Log Analytics Agent by @BenjaminEngeset.
      [#1792](https://github.com/Azure/PSRule.Rules.Azure/issues/1792)
  - Virtual Machine Scale Sets:
    - Check virtual machine scale sets uses Azure Monitor Agent instead of old legacy Log Analytics Agent by @BenjaminEngeset.
      [#1792](https://github.com/Azure/PSRule.Rules.Azure/issues/1792)
- Engineering:
  - Bump PSRule to v2.5.3.
    [#1800](https://github.com/Azure/PSRule.Rules.Azure/pull/1800)
  - Bump Az.Resources to v6.3.1.
    [#1800](https://github.com/Azure/PSRule.Rules.Azure/pull/1800)
- Bug fixes:
  - Fixed contains function unable to match array by @BernieWhite.
    [#1793](https://github.com/Azure/PSRule.Rules.Azure/issues/1793)

## v1.21.0-B0027 (pre-release)

What's changed since pre-release v1.21.0-B0011:

- New rules:
  - Deployment:
    - Check sensitive resource values use secure parameters by @VeraBE @BernieWhite.
      [#1773](https://github.com/Azure/PSRule.Rules.Azure/issues/1773)
  - Service Bus:
    - Check service bus namespaces uses TLS 1.2 version by @BenjaminEngeset.
      [#1777](https://github.com/Azure/PSRule.Rules.Azure/issues/1777)

## v1.21.0-B0011 (pre-release)

What's changed since v1.20.1:

- New features:
  - Mapping of Azure Security Benchmark v3 to security rules by @jagoodwin.
    [#1610](https://github.com/Azure/PSRule.Rules.Azure/issues/1610)
- New rules:
  - Virtual Network:
    - Check VNETs with a GatewaySubnet also has a AzureBastionSubnet by @BenjaminEngeset.
      [#1761](https://github.com/Azure/PSRule.Rules.Azure/issues/1761)
- General improvements:
  - Added built-in list of ignored policy definitions by @BernieWhite.
    [#1730](https://github.com/Azure/PSRule.Rules.Azure/issues/1730)
    - To ignore additional policy definitions, use the `AZURE_POLICY_IGNORE_LIST` configuration option.
- Engineering:
  - Bump PSRule to v2.5.1.
    [#1782](https://github.com/Azure/PSRule.Rules.Azure/pull/1782)
  - Bump Az.Resources to v6.3.0.
    [#1782](https://github.com/Azure/PSRule.Rules.Azure/pull/1782)

## v1.20.2

What's changed since v1.20.1:

- Bug fixes:
  - Fixed contains function unable to match array by @BernieWhite.
    [#1793](https://github.com/Azure/PSRule.Rules.Azure/issues/1793)

## v1.20.1

What's changed since v1.20.0:

- Bug fixes:
  - Fixed expand bicep source when reading JsonContent into a parameter by @BernieWhite.
    [#1780](https://github.com/Azure/PSRule.Rules.Azure/issues/1780)

## v1.20.0

What's changed since v1.19.2:

- New features:
  - Added September 2022 baselines `Azure.GA_2022_09` and `Azure.Preview_2022_09` by @BernieWhite.
    [#1738](https://github.com/Azure/PSRule.Rules.Azure/issues/1738)
    - Includes rules released before or during September 2022.
    - Marked `Azure.GA_2022_06` and `Azure.Preview_2022_06` baselines as obsolete.
- New rules:
  - AKS:
    - Check clusters use Ephemeral OS disk by @BenjaminEngeset.
      [#1618](https://github.com/Azure/PSRule.Rules.Azure/issues/1618)
  - App Configuration:
    - Check app configuration store has purge protection enabled by @BenjaminEngeset.
      [#1689](https://github.com/Azure/PSRule.Rules.Azure/issues/1689)
    - Check app configuration store has one or more replicas by @BenjaminEngeset.
      [#1688](https://github.com/Azure/PSRule.Rules.Azure/issues/1688)
    - Check app configuration store audit diagnostic logs are enabled by @BenjaminEngeset.
      [#1690](https://github.com/Azure/PSRule.Rules.Azure/issues/1690)
    - Check identity-based authentication is used for configuration stores by @pazdedav.
      [#1691](https://github.com/Azure/PSRule.Rules.Azure/issues/1691)
  - Application Gateway WAF:
    - Check policy is enabled by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy uses prevention mode by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy uses managed rule sets by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy does not have any exclusions defined by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
  - Azure Cache for Redis:
    - Check the number of firewall rules for caches by @jonathanruiz.
      [#544](https://github.com/Azure/PSRule.Rules.Azure/issues/544)
    - Check the number of IP addresses in firewall rules for caches by @jonathanruiz.
      [#544](https://github.com/Azure/PSRule.Rules.Azure/issues/544)
  - CDN:
    - Check CDN profile uses Front Door Standard or Premium tier by @BenjaminEngeset.
      [#1612](https://github.com/Azure/PSRule.Rules.Azure/issues/1612)
  - Container Registry:
    - Check soft delete policy is enabled by @BenjaminEngeset.
      [#1674](https://github.com/Azure/PSRule.Rules.Azure/issues/1674)
  - Defender for Cloud:
    - Check Microsoft Defender for Cloud is enabled for Containers by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Virtual Machines by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for App Services by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Storage Accounts by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers on machines by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
  - Deployment:
    - Check that nested deployments securely pass through administrator usernames by @ms-sambell.
      [#1479](https://github.com/Azure/PSRule.Rules.Azure/issues/1479)
  - Front Door WAF:
    - Check policy is enabled by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy uses prevention mode by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy uses managed rule sets by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
    - Check policy does not have any exclusions defined by @fbinotto.
      [#1470](https://github.com/Azure/PSRule.Rules.Azure/issues/1470)
  - Network Security Group:
    - Check AKS managed NSGs don't contain custom rules by @ms-sambell.
      [#8](https://github.com/Azure/PSRule.Rules.Azure/issues/8)
  - Storage Account:
    - Check blob container soft delete is enabled by @pazdedav.
      [#1671](https://github.com/Azure/PSRule.Rules.Azure/issues/1671)
    - Check file share soft delete is enabled by @jonathanruiz.
      [#966](https://github.com/Azure/PSRule.Rules.Azure/issues/966)
  - VMSS:
    - Check Linux VMSS has disabled password authentication by @BenjaminEngeset.
      [#1635](https://github.com/Azure/PSRule.Rules.Azure/issues/1635)
- Updated rules:
  - **Important change**: Updated rules, tests and docs with Microsoft Defender for Cloud by @jonathanruiz.
    [#545](https://github.com/Azure/PSRule.Rules.Azure/issues/545)
    - The following rules have been renamed with aliases:
      - Renamed `Azure.SQL.ThreatDetection` to `Azure.SQL.DefenderCloud`.
      - Renamed `Azure.SecurityCenter.Contact` to `Azure.DefenderCloud.Contact`.
      - Renamed `Azure.SecurityCenter.Provisioning` to `Azure.DefenderCloud.Provisioning`.
    - If you are referencing the old names please consider updating to the new names.
  - Updated documentation examples for Front Door and Key Vault rules by @lluppesms.
    [#1667](https://github.com/Azure/PSRule.Rules.Azure/issues/1667)
  - Improved the way we check that VM or VMSS has Linux by @verabe.
    [#1704](https://github.com/Azure/PSRule.Rules.Azure/issues/1704)
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.23.8` by @BernieWhite.
      [#1627](https://github.com/Azure/PSRule.Rules.Azure/issues/1627)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
  - Event Grid:
    - Promoted `Azure.EventGrid.DisableLocalAuth` to GA rule set by @BernieWhite.
      [#1628](https://github.com/Azure/PSRule.Rules.Azure/issues/1628)
  - Key Vault:
    - Promoted `Azure.KeyVault.AutoRotationPolicy` to GA rule set by @BernieWhite.
      [#1629](https://github.com/Azure/PSRule.Rules.Azure/issues/1629)
- General improvements:
  - Updated NSG documentation with code snippets and links by @simone-bennett.
    [#1607](https://github.com/Azure/PSRule.Rules.Azure/issues/1607)
  - Updated Application Gateway documentation with code snippets by @ms-sambell.
    [#1608](https://github.com/Azure/PSRule.Rules.Azure/issues/1608)
  - Updated SQL firewall rules documentation by @ms-sambell.
    [#1569](https://github.com/Azure/PSRule.Rules.Azure/issues/1569)
  - Updated Container Apps documentation and rule to new resource type by @marie-schmidt.
    [#1672](https://github.com/Azure/PSRule.Rules.Azure/issues/1672)
  - Updated KeyVault and FrontDoor documentation with code snippets by @lluppesms.
    [#1667](https://github.com/Azure/PSRule.Rules.Azure/issues/1667)
  - Added tag and annotation metadata from policy for rules generation by @BernieWhite.
    [#1652](https://github.com/Azure/PSRule.Rules.Azure/issues/1652)
  - Added hash to `name` and `ref` properties for policy rules by @ArmaanMcleod.
    [#1653](https://github.com/Azure/PSRule.Rules.Azure/issues/1653)
    - Use `AZURE_POLICY_RULE_PREFIX` or `Export-AzPolicyAssignmentRuleData -RulePrefix` to override rule prefix.
- Engineering:
  - Bump PSRule to v2.4.2.
    [#1753](https://github.com/Azure/PSRule.Rules.Azure/pull/1753)
    [#1748](https://github.com/Azure/PSRule.Rules.Azure/issues/1748)
  - Bump Microsoft.NET.Test.Sdk to v17.3.2.
    [#1719](https://github.com/Azure/PSRule.Rules.Azure/pull/1719)
  - Updated provider data for analysis.
    [#1605](https://github.com/Azure/PSRule.Rules.Azure/pull/1605)
  - Bump Az.Resources to v6.2.0.
    [#1636](https://github.com/Azure/PSRule.Rules.Azure/pull/1636)
  - Bump PSScriptAnalyzer to v1.21.0.
    [#1636](https://github.com/Azure/PSRule.Rules.Azure/pull/1636)
- Bug fixes:
  - Fixed continue processing policy assignments on error by @BernieWhite.
    [#1651](https://github.com/Azure/PSRule.Rules.Azure/issues/1651)
  - Fixed handling of runtime assessment data by @BernieWhite.
    [#1707](https://github.com/Azure/PSRule.Rules.Azure/issues/1707)
  - Fixed conversion of type conditions to pre-conditions by @BernieWhite.
    [#1708](https://github.com/Azure/PSRule.Rules.Azure/issues/1708)
  - Fixed inconclusive failure of `Azure.Deployment.AdminUsername` by @BernieWhite.
    [#1631](https://github.com/Azure/PSRule.Rules.Azure/issues/1631)
  - Fixed error expanding with `json()` and single quotes by @BernieWhite.
    [#1656](https://github.com/Azure/PSRule.Rules.Azure/issues/1656)
  - Fixed handling key collision with duplicate definitions using same parameters by @ArmaanMcleod.
    [#1653](https://github.com/Azure/PSRule.Rules.Azure/issues/1653)
  - Fixed bug requiring all diagnostic logs settings to have auditing enabled by @BenjaminEngeset.
    [#1726](https://github.com/Azure/PSRule.Rules.Azure/issues/1726)
  - Fixed `Azure.Deployment.AdminUsername` incorrectly fails with nested deployments by @BernieWhite.
    [#1762](https://github.com/Azure/PSRule.Rules.Azure/issues/1762)
  - Fixed `Azure.FrontDoorWAF.Exclusions` reports exclusions when none are specified by @BernieWhite.
    [#1751](https://github.com/Azure/PSRule.Rules.Azure/issues/1751)
  - Fixed `Azure.Deployment.AdminUsername` does not match the pattern by @BernieWhite.
    [#1758](https://github.com/Azure/PSRule.Rules.Azure/issues/1758)
  - Consider private offerings when checking that a VM or VMSS has Linux by @verabe.
    [#1725](https://github.com/Azure/PSRule.Rules.Azure/issues/1725)

What's changed since pre-release v1.20.0-B0477:

- No additional changes.

## v1.20.0-B0477 (pre-release)

What's changed since pre-release v1.20.0-B0389:

- General improvements:
  - Added hash to `name` and `ref` properties for policy rules by @ArmaanMcleod.
    [#1653](https://github.com/Azure/PSRule.Rules.Azure/issues/1653)
    - Use `AZURE_POLICY_RULE_PREFIX` or `Export-AzPolicyAssignmentRuleData -RulePrefix` to override rule prefix.

## v1.20.0-B0389 (pre-release)

What's changed since pre-release v1.20.0-B0304:

- New rules:
  - App Configuration:
    - Check app configuration store has purge protection enabled by @BenjaminEngeset.
      [#1689](https://github.com/Azure/PSRule.Rules.Azure/issues/1689)
- Bug fixes:
  - Fixed `Azure.Deployment.AdminUsername` incorrectly fails with nested deployments by @BernieWhite.
    [#1762](https://github.com/Azure/PSRule.Rules.Azure/issues/1762)

## v1.20.0-B0304 (pre-release)

What's changed since pre-release v1.20.0-B0223:

- Engineering:
  - Bump PSRule to v2.4.2.
    [#1753](https://github.com/Azure/PSRule.Rules.Azure/pull/1753)
    [#1748](https://github.com/Azure/PSRule.Rules.Azure/issues/1748)
- Bug fixes:
  - Fixed `Azure.FrontDoorWAF.Exclusions` reports exclusions when none are specified by @BernieWhite.
    [#1751](https://github.com/Azure/PSRule.Rules.Azure/issues/1751)
  - Fixed `Azure.Deployment.AdminUsername` does not match the pattern by @BernieWhite.
    [#1758](https://github.com/Azure/PSRule.Rules.Azure/issues/1758)
  - Consider private offerings when checking that a VM or VMSS has Linux by @verabe.
    [#1725](https://github.com/Azure/PSRule.Rules.Azure/issues/1725)

## v1.20.0-B0223 (pre-release)

What's changed since pre-release v1.20.0-B0148:

- New features:
  - Added September 2022 baselines `Azure.GA_2022_09` and `Azure.Preview_2022_09` by @BernieWhite.
    [#1738](https://github.com/Azure/PSRule.Rules.Azure/issues/1738)
    - Includes rules released before or during September 2022.
    - Marked `Azure.GA_2022_06` and `Azure.Preview_2022_06` baselines as obsolete.
- New rules:
  - App Configuration:
    - Check app configuration store has one or more replicas by @BenjaminEngeset.
      [#1688](https://github.com/Azure/PSRule.Rules.Azure/issues/1688)
- Engineering:
  - Bump PSRule to v2.4.1.
    [#1636](https://github.com/Azure/PSRule.Rules.Azure/pull/1636)
  - Bump Az.Resources to v6.2.0.
    [#1636](https://github.com/Azure/PSRule.Rules.Azure/pull/1636)
  - Bump PSScriptAnalyzer to v1.21.0.
    [#1636](https://github.com/Azure/PSRule.Rules.Azure/pull/1636)
- Bug fixes:
  - Fixed handling key collision with duplicate definitions using same parameters by @ArmaanMcleod.
    [#1653](https://github.com/Azure/PSRule.Rules.Azure/issues/1653)
  - Fixed bug requiring all diagnostic logs settings to have auditing enabled by @BenjaminEngeset.
    [#1726](https://github.com/Azure/PSRule.Rules.Azure/issues/1726)

## v1.20.0-B0148 (pre-release)

What's changed since pre-release v1.20.0-B0085:

- New rules:
  - App Configuration:
    - Check app configuration store audit diagnostic logs are enabled by @BenjaminEngeset.
      [#1690](https://github.com/Azure/PSRule.Rules.Azure/issues/1690)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.3.2.
    [#1719](https://github.com/Azure/PSRule.Rules.Azure/pull/1719)
- Bug fixes:
  - Fixed error expanding with `json()` and single quotes by @BernieWhite.
    [#1656](https://github.com/Azure/PSRule.Rules.Azure/issues/1656)

## v1.20.0-B0085 (pre-release)

What's changed since pre-release v1.20.0-B0028:

- New rules:
  - Azure Cache for Redis:
    - Check the number of firewall rules for caches by @jonathanruiz.
      [#544](https://github.com/Azure/PSRule.Rules.Azure/issues/544)
    - Check the number of IP addresses in firewall rules for caches by @jonathanruiz.
      [#544](https://github.com/Azure/PSRule.Rules.Azure/issues/544)
  - App Configuration:
    - Check identity-based authentication is used for configuration stores by @pazdedav.
      [#1691](https://github.com/Azure/PSRule.Rules.Azure/issues/1691)
  - Container Registry:
    - Check soft delete policy is enabled by @BenjaminEngeset.
      [#1674](https://github.com/Azure/PSRule.Rules.Azure/issues/1674)
  - Defender for Cloud:
    - Check Microsoft Defender for Cloud is enabled for Containers by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Virtual Machines by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for App Services by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Storage Accounts by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers on machines by @jdewisscher.
      [#1632](hhttps://github.com/Azure/PSRule.Rules.Azure/issues/1632)
  - Network Security Group:
    - Check AKS managed NSGs don't contain custom rules by @ms-sambell.
      [#8](https://github.com/Azure/PSRule.Rules.Azure/issues/8)
  - Storage Account:
    - Check blob container soft delete is enabled by @pazdedav.
      [#1671](https://github.com/Azure/PSRule.Rules.Azure/issues/1671)
    - Check file share soft delete is enabled by @jonathanruiz.
      [#966](https://github.com/Azure/PSRule.Rules.Azure/issues/966)
- Updated rules:
  - **Important change**: Updated rules, tests and docs with Microsoft Defender for Cloud by @jonathanruiz.
    [#545](https://github.com/Azure/PSRule.Rules.Azure/issues/545)
    - The following rules have been renamed with aliases:
      - Renamed `Azure.SQL.ThreatDetection` to `Azure.SQL.DefenderCloud`.
      - Renamed `Azure.SecurityCenter.Contact` to `Azure.DefenderCloud.Contact`.
      - Renamed `Azure.SecurityCenter.Provisioning` to `Azure.DefenderCloud.Provisioning`.
    - If you are referencing the old names please consider updating to the new names.
  - Updated documentation examples for Front Door and Key Vault rules by @lluppesms.
    [#1667](https://github.com/Azure/PSRule.Rules.Azure/issues/1667)
  - Improved the way we check that VM or VMSS has Linux by @verabe.
    [#1704](https://github.com/Azure/PSRule.Rules.Azure/issues/1704)
- General improvements:
  - Updated NSG documentation with code snippets and links by @simone-bennett.
    [#1607](https://github.com/Azure/PSRule.Rules.Azure/issues/1607)
  - Updated Application Gateway documentation with code snippets by @ms-sambell.
    [#1608](https://github.com/Azure/PSRule.Rules.Azure/issues/1608)
  - Updated SQL firewall rules documentation by @ms-sambell.
    [#1569](https://github.com/Azure/PSRule.Rules.Azure/issues/1569)
  - Updated Container Apps documentation and rule to new resource type by @marie-schmidt.
    [#1672](https://github.com/Azure/PSRule.Rules.Azure/issues/1672)
  - Updated KeyVault and FrontDoor documentation with code snippets by @lluppesms.
    [#1667](https://github.com/Azure/PSRule.Rules.Azure/issues/1667)
  - Added tag and annotation metadata from policy for rules generation by @BernieWhite.
    [#1652](https://github.com/Azure/PSRule.Rules.Azure/issues/1652)
- Bug fixes:
  - Fixed continue processing policy assignments on error by @BernieWhite.
    [#1651](https://github.com/Azure/PSRule.Rules.Azure/issues/1651)
  - Fixed handling of runtime assessment data by @BernieWhite.
    [#1707](https://github.com/Azure/PSRule.Rules.Azure/issues/1707)
  - Fixed conversion of type conditions to pre-conditions by @BernieWhite.
    [#1708](https://github.com/Azure/PSRule.Rules.Azure/issues/1708)

## v1.20.0-B0028 (pre-release)

What's changed since pre-release v1.20.0-B0004:

- New rules:
  - AKS:
    - Check clusters use Ephemeral OS disk by @BenjaminEngeset.
      [#1618](https://github.com/Azure/PSRule.Rules.Azure/issues/1618)
  - CDN:
    - Check CDN profile uses Front Door Standard or Premium tier by @BenjaminEngeset.
      [#1612](https://github.com/Azure/PSRule.Rules.Azure/issues/1612)
  - VMSS:
    - Check Linux VMSS has disabled password authentication by @BenjaminEngeset.
      [#1635](https://github.com/Azure/PSRule.Rules.Azure/issues/1635)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.23.8` by @BernieWhite.
      [#1627](https://github.com/Azure/PSRule.Rules.Azure/issues/1627)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
  - Event Grid:
    - Promoted `Azure.EventGrid.DisableLocalAuth` to GA rule set by @BernieWhite.
      [#1628](https://github.com/Azure/PSRule.Rules.Azure/issues/1628)
  - Key Vault:
    - Promoted `Azure.KeyVault.AutoRotationPolicy` to GA rule set by @BernieWhite.
      [#1629](https://github.com/Azure/PSRule.Rules.Azure/issues/1629)
- Engineering:
  - Bump PSRule to v2.4.0.
    [#1620](https://github.com/Azure/PSRule.Rules.Azure/pull/1620)
  - Updated provider data for analysis.
    [#1605](https://github.com/Azure/PSRule.Rules.Azure/pull/1605)
- Bug fixes:
  - Fixed function `dateTimeAdd` errors handling `utcNow` output by @BernieWhite.
    [#1637](https://github.com/Azure/PSRule.Rules.Azure/issues/1637)
  - Fixed inconclusive failure of `Azure.Deployment.AdminUsername` by @BernieWhite.
    [#1631](https://github.com/Azure/PSRule.Rules.Azure/issues/1631)

## v1.20.0-B0004 (pre-release)

What's changed since v1.19.1:

- New rules:
  - Azure Resources:
    - Check that nested deployments securely pass through administrator usernames by @ms-sambell.
      [#1479](https://github.com/Azure/PSRule.Rules.Azure/issues/1479)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.3.1.
    [#1603](https://github.com/Azure/PSRule.Rules.Azure/pull/1603)

## v1.19.2

What's changed since v1.19.1:

- Bug fixes:
  - Fixed function `dateTimeAdd` errors handling `utcNow` output by @BernieWhite.
    [#1637](https://github.com/Azure/PSRule.Rules.Azure/issues/1637)

## v1.19.1

What's changed since v1.19.0:

- Bug fixes:
  - Fixed `Azure.VNET.UseNSGs` is missing exceptions by @BernieWhite.
    [#1609](https://github.com/Azure/PSRule.Rules.Azure/issues/1609)
    - Added exclusions for `RouteServerSubnet` and any subnet with a dedicated HSM delegation.

## v1.19.0

What's changed since v1.18.1:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use uptime SLA by @BenjaminEngeset.
      [#1601](https://github.com/Azure/PSRule.Rules.Azure/issues/1601)
- General improvements:
  - Updated rule level for the following rules by @BernieWhite.
    [#1551](https://github.com/Azure/PSRule.Rules.Azure/issues/1551)
    - Set `Azure.APIM.APIDescriptors` to warning from error.
    - Set `Azure.APIM.ProductDescriptors` to warning from error.
    - Set `Azure.Template.UseLocationParameter` to warning from error.
    - Set `Azure.Template.UseComments` to information from error.
    - Set `Azure.Template.UseDescriptions` to information from error.
  - Improve reporting of failing resource property for rules by @BernieWhite.
    [#1429](https://github.com/Azure/PSRule.Rules.Azure/issues/1429)
- Engineering:
  - Added publishing of symbols for NuGet packages by @BernieWhite.
    [#1549](https://github.com/Azure/PSRule.Rules.Azure/issues/1549)
  - Bump Az.Resources to v6.1.0.
    [#1557](https://github.com/Azure/PSRule.Rules.Azure/pull/1557)
  - Bump Microsoft.NET.Test.Sdk to v17.3.0.
    [#1563](https://github.com/Azure/PSRule.Rules.Azure/pull/1563)
  - Bump PSRule to v2.3.2.
    [#1574](https://github.com/Azure/PSRule.Rules.Azure/pull/1574)
  - Bump support projects to .NET 6 by @BernieWhite.
    [#1560](https://github.com/Azure/PSRule.Rules.Azure/issues/1560)
  - Bump BenchmarkDotNet to v0.13.2.
    [#1593](https://github.com/Azure/PSRule.Rules.Azure/pull/1593)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.2.
    [#1594](https://github.com/Azure/PSRule.Rules.Azure/pull/1594)
  - Updated provider data for analysis.
    [#1598](https://github.com/Azure/PSRule.Rules.Azure/pull/1598)
- Bug fixes:
  - Fixed parameter files linked to bicep code via naming convention is not working by @BernieWhite.
    [#1582](https://github.com/Azure/PSRule.Rules.Azure/issues/1582)
  - Fixed handling of storage accounts sub-resources with CMK by @BernieWhite.
    [#1575](https://github.com/Azure/PSRule.Rules.Azure/issues/1575)

What's changed since pre-release v1.19.0-B0077:

- No additional changes.

## v1.19.0-B0077 (pre-release)

What's changed since pre-release v1.19.0-B0042:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use uptime SLA by @BenjaminEngeset.
      [#1601](https://github.com/Azure/PSRule.Rules.Azure/issues/1601)

## v1.19.0-B0042 (pre-release)

What's changed since pre-release v1.19.0-B0010:

- General improvements:
  - Improve reporting of failing resource property for rules by @BernieWhite.
    [#1429](https://github.com/Azure/PSRule.Rules.Azure/issues/1429)
- Engineering:
  - Bump PSRule to v2.3.2.
    [#1574](https://github.com/Azure/PSRule.Rules.Azure/pull/1574)
  - Bump support projects to .NET 6 by @BernieWhite.
    [#1560](https://github.com/Azure/PSRule.Rules.Azure/issues/1560)
  - Bump BenchmarkDotNet to v0.13.2.
    [#1593](https://github.com/Azure/PSRule.Rules.Azure/pull/1593)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.2.
    [#1594](https://github.com/Azure/PSRule.Rules.Azure/pull/1594)
  - Updated provider data for analysis.
    [#1598](https://github.com/Azure/PSRule.Rules.Azure/pull/1598)
- Bug fixes:
  - Fixed parameter files linked to bicep code via naming convention is not working by @BernieWhite.
    [#1582](https://github.com/Azure/PSRule.Rules.Azure/issues/1582)
  - Fixed handling of storage accounts sub-resources with CMK by @BernieWhite.
    [#1575](https://github.com/Azure/PSRule.Rules.Azure/issues/1575)

## v1.19.0-B0010 (pre-release)

What's changed since v1.18.1:

- General improvements:
  - Updated rule level for the following rules by @BernieWhite.
    [#1551](https://github.com/Azure/PSRule.Rules.Azure/issues/1551)
    - Set `Azure.APIM.APIDescriptors` to warning from error.
    - Set `Azure.APIM.ProductDescriptors` to warning from error.
    - Set `Azure.Template.UseLocationParameter` to warning from error.
    - Set `Azure.Template.UseComments` to information from error.
    - Set `Azure.Template.UseDescriptions` to information from error.
- Engineering:
  - Added publishing of symbols for NuGet packages by @BernieWhite.
    [#1549](https://github.com/Azure/PSRule.Rules.Azure/issues/1549)
  - Bump PSRule to v2.3.1.
    [#1561](https://github.com/Azure/PSRule.Rules.Azure/pull/1561)
  - Bump Az.Resources to v6.1.0.
    [#1557](https://github.com/Azure/PSRule.Rules.Azure/pull/1557)
  - Bump Microsoft.NET.Test.Sdk to v17.3.0.
    [#1563](https://github.com/Azure/PSRule.Rules.Azure/pull/1563)

## v1.18.1

What's changed since v1.18.0:

- Bug fixes:
  - Fixed `Azure.APIM.HTTPBackend` reports failure when service URL is not defined by @BernieWhite.
    [#1555](https://github.com/Azure/PSRule.Rules.Azure/issues/1555)
  - Fixed `Azure.SQL.AAD` failure with newer API by @BernieWhite.
    [#1302](https://github.com/Azure/PSRule.Rules.Azure/issues/1302)

## v1.18.0

What's changed since v1.17.1:

- New rules:
  - Cognitive Services:
    - Check accounts use network access restrictions by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts use managed identities to access Azure resources by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts only accept requests using Azure AD identities by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts disable access using public endpoints by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
- General improvements:
  - Added support for array `indexOf`, `lastIndexOf`, and `items` ARM functions by @BernieWhite.
    [#1440](https://github.com/Azure/PSRule.Rules.Azure/issues/1440)
  - Added support for `join` ARM function by @BernieWhite.
    [#1535](https://github.com/Azure/PSRule.Rules.Azure/issues/1535)
  - Improved output of full path to emitted resources by @BernieWhite.
    [#1523](https://github.com/Azure/PSRule.Rules.Azure/issues/1523)
- Engineering:
  - Bump Az.Resources to v6.0.1.
    [#1521](https://github.com/Azure/PSRule.Rules.Azure/pull/1521)
  - Updated provider data for analysis.
    [#1540](https://github.com/Azure/PSRule.Rules.Azure/pull/1540)
  - Bump xunit to v2.4.2.
    [#1542](https://github.com/Azure/PSRule.Rules.Azure/pull/1542)
  - Added readme and tags to NuGet by @BernieWhite.
    [#1513](https://github.com/Azure/PSRule.Rules.Azure/issues/1513)
- Bug fixes:
  - Fixed `Azure.SQL.TDE` is not required to enable Transparent Data Encryption for IaC by @BernieWhite.
    [#1530](https://github.com/Azure/PSRule.Rules.Azure/issues/1530)

What's changed since pre-release v1.18.0-B0027:

- No additional changes.

## v1.18.0-B0027 (pre-release)

What's changed since pre-release v1.18.0-B0010:

- New rules:
  - Cognitive Services:
    - Check accounts use network access restrictions by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts use managed identities to access Azure resources by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts only accept requests using Azure AD identities by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
    - Check accounts disable access using public endpoints by @BernieWhite.
      [#1532](https://github.com/Azure/PSRule.Rules.Azure/issues/1532)
- General improvements:
  - Added support for array `indexOf`, `lastIndexOf`, and `items` ARM functions by @BernieWhite.
    [#1440](https://github.com/Azure/PSRule.Rules.Azure/issues/1440)
  - Added support for `join` ARM function by @BernieWhite.
    [#1535](https://github.com/Azure/PSRule.Rules.Azure/issues/1535)
- Engineering:
  - Updated provider data for analysis.
    [#1540](https://github.com/Azure/PSRule.Rules.Azure/pull/1540)
  - Bump xunit to v2.4.2.
    [#1542](https://github.com/Azure/PSRule.Rules.Azure/pull/1542)
- Bug fixes:
  - Fixed `Azure.SQL.TDE` is not required to enable Transparent Data Encryption for IaC by @BernieWhite.
    [#1530](https://github.com/Azure/PSRule.Rules.Azure/issues/1530)

## v1.18.0-B0010 (pre-release)

What's changed since pre-release v1.18.0-B0002:

- General improvements:
  - Improved output of full path to emitted resources by @BernieWhite.
    [#1523](https://github.com/Azure/PSRule.Rules.Azure/issues/1523)
- Engineering:
  - Bump Az.Resources to v6.0.1.
    [#1521](https://github.com/Azure/PSRule.Rules.Azure/pull/1521)

## v1.18.0-B0002 (pre-release)

What's changed since v1.17.1:

- Engineering:
  - Added readme and tags to NuGet by @BernieWhite.
    [#1513](https://github.com/Azure/PSRule.Rules.Azure/issues/1513)

## v1.17.1

What's changed since v1.17.0:

- Bug fixes:
  - Fixed union returns null when merged with built-in expansion objects by @BernieWhite.
    [#1515](https://github.com/Azure/PSRule.Rules.Azure/issues/1515)
  - Fixed missing zones in test for standalone VM by @BernieWhite.
    [#1506](https://github.com/Azure/PSRule.Rules.Azure/issues/1506)

## v1.17.0

What's changed since v1.16.1:

- New features:
  - Added more field count expression support for Azure Policy JSON rules by @ArmaanMcleod.
    [#181](https://github.com/Azure/PSRule.Rules.Azure/issues/181)
  - Added June 2022 baselines `Azure.GA_2022_06` and `Azure.Preview_2022_06` by @BernieWhite.
    [#1499](https://github.com/Azure/PSRule.Rules.Azure/issues/1499)
    - Includes rules released before or during June 2022.
    - Marked `Azure.GA_2022_03` and `Azure.Preview_2022_03` baselines as obsolete.
- New rules:
  - Deployment:
    - Check for secure values in outputs by @BernieWhite.
      [#297](https://github.com/Azure/PSRule.Rules.Azure/issues/297)
- Engineering:
  - Bump Newtonsoft.Json to v13.0.1.
    [#1494](https://github.com/Azure/PSRule.Rules.Azure/pull/1494)
  - Updated NuGet packaging metadata by @BernieWhite.
    [#1428](https://github.com/Azure/PSRule.Rules.Azure/pull/1428)
  - Updated provider data for analysis.
    [#1502](https://github.com/Azure/PSRule.Rules.Azure/pull/1502)
  - Bump PSRule to v2.2.0.
    [#1444](https://github.com/Azure/PSRule.Rules.Azure/pull/1444)
  - Updated NuGet packaging metadata by @BernieWhite.
    [#1428](https://github.com/Azure/PSRule.Rules.Azure/issues/1428)
- Bug fixes:
  - Fixed TDE property status to state by @Dylan-Prins.
    [#1505](https://github.com/Azure/PSRule.Rules.Azure/pull/1505)
  - Fixed the language expression value fails in outputs by @BernieWhite.
    [#1485](https://github.com/Azure/PSRule.Rules.Azure/issues/1485)

What's changed since pre-release v1.17.0-B0064:

- No additional changes.

## v1.17.0-B0064 (pre-release)

What's changed since pre-release v1.17.0-B0035:

- Engineering:
  - Updated provider data for analysis.
    [#1502](https://github.com/Azure/PSRule.Rules.Azure/pull/1502)
  - Bump PSRule to v2.2.0.
    [#1444](https://github.com/Azure/PSRule.Rules.Azure/pull/1444)
- Bug fixes:
  - Fixed TDE property status to state by @Dylan-Prins.
    [#1505](https://github.com/Azure/PSRule.Rules.Azure/pull/1505)

## v1.17.0-B0035 (pre-release)

What's changed since pre-release v1.17.0-B0014:

- New features:
  - Added June 2022 baselines `Azure.GA_2022_06` and `Azure.Preview_2022_06` by @BernieWhite.
    [#1499](https://github.com/Azure/PSRule.Rules.Azure/issues/1499)
    - Includes rules released before or during June 2022.
    - Marked `Azure.GA_2022_03` and `Azure.Preview_2022_03` baselines as obsolete.
- Engineering:
  - Bump Newtonsoft.Json to v13.0.1.
    [#1494](https://github.com/Azure/PSRule.Rules.Azure/pull/1494)
  - Updated NuGet packaging metadata by @BernieWhite.
    [#1428](https://github.com/Azure/PSRule.Rules.Azure/pull/1428)

## v1.17.0-B0014 (pre-release)

What's changed since v1.16.1:

- New features:
  - Added more field count expression support for Azure Policy JSON rules by @ArmaanMcleod.
    [#181](https://github.com/Azure/PSRule.Rules.Azure/issues/181)
- New rules:
  - Deployment:
    - Check for secure values in outputs by @BernieWhite.
      [#297](https://github.com/Azure/PSRule.Rules.Azure/issues/297)
- Engineering:
  - Updated NuGet packaging metadata by @BernieWhite.
    [#1428](https://github.com/Azure/PSRule.Rules.Azure/issues/1428)
- Bug fixes:
  - Fixed the language expression value fails in outputs by @BernieWhite.
    [#1485](https://github.com/Azure/PSRule.Rules.Azure/issues/1485)

## v1.16.1

What's changed since v1.16.0:

- Bug fixes:
  - Fixed TLS 1.3 support in `Azure.AppGw.SSLPolicy` by @BernieWhite.
    [#1469](https://github.com/Azure/PSRule.Rules.Azure/issues/1469)
  - Fixed Application Gateway referencing a WAF policy by @BernieWhite.
    [#1466](https://github.com/Azure/PSRule.Rules.Azure/issues/1466)

## v1.16.0

What's changed since v1.15.2:

- New rules:
  - App Service:
    - Check web apps have insecure FTP disabled by @BernieWhite.
      [#1436](https://github.com/Azure/PSRule.Rules.Azure/issues/1436)
    - Check web apps use a dedicated health probe by @BernieWhite.
      [#1437](https://github.com/Azure/PSRule.Rules.Azure/issues/1437)
- Updated rules:
  - Public IP:
    - Updated `Azure.PublicIP.AvailabilityZone` to exclude IP addresses for Azure Bastion by @BernieWhite.
      [#1442](https://github.com/Azure/PSRule.Rules.Azure/issues/1442)
      - Public IP addresses with the `resource-usage` tag set to `azure-bastion` are excluded.
- General improvements:
  - Added support for `dateTimeFromEpoch` and `dateTimeToEpoch` ARM functions by @BernieWhite.
    [#1451](https://github.com/Azure/PSRule.Rules.Azure/issues/1451)
- Engineering:
  - Updated built documentation to include rule ref and metadata by @BernieWhite.
    [#1432](https://github.com/Azure/PSRule.Rules.Azure/issues/1432)
  - Added ref properties for several rules by @BernieWhite.
    [#1430](https://github.com/Azure/PSRule.Rules.Azure/issues/1430)
  - Updated provider data for analysis.
    [#1453](https://github.com/Azure/PSRule.Rules.Azure/pull/1453)
  - Bump Microsoft.NET.Test.Sdk to v17.2.0.
    [#1410](https://github.com/Azure/PSRule.Rules.Azure/pull/1410)
  - Update CI checks to include required ref property by @BernieWhite.
    [#1431](https://github.com/Azure/PSRule.Rules.Azure/issues/1431)
  - Added ref properties for rules by @BernieWhite.
    [#1430](https://github.com/Azure/PSRule.Rules.Azure/issues/1430)
- Bug fixes:
  - Fixed `Azure.Template.UseVariables` does not accept function variables names by @BernieWhite.
    [#1427](https://github.com/Azure/PSRule.Rules.Azure/issues/1427)
  - Fixed dependency issue within Azure Pipelines `AzurePowerShell` task by @BernieWhite.
    [#1447](https://github.com/Azure/PSRule.Rules.Azure/issues/1447)
    - Removed dependency on `Az.Accounts` and `Az.Resources` from manifest.
      Pre-install these modules to use export cmdlets.

What's changed since pre-release v1.16.0-B0072:

- No additional changes.

## v1.16.0-B0072 (pre-release)

What's changed since pre-release v1.16.0-B0041:

- Engineering:
  - Update CI checks to include required ref property by @BernieWhite.
    [#1431](https://github.com/Azure/PSRule.Rules.Azure/issues/1431)
  - Added ref properties for rules by @BernieWhite.
    [#1430](https://github.com/Azure/PSRule.Rules.Azure/issues/1430)
- Bug fixes:
  - Fixed dependency issue within Azure Pipelines `AzurePowerShell` task by @BernieWhite.
    [#1447](https://github.com/Azure/PSRule.Rules.Azure/issues/1447)
    - Removed dependency on `Az.Accounts` and `Az.Resources` from manifest.
      Pre-install these modules to use export cmdlets.

## v1.16.0-B0041 (pre-release)

What's changed since pre-release v1.16.0-B0017:

- Updated rules:
  - Public IP:
    - Updated `Azure.PublicIP.AvailabilityZone` to exclude IP addresses for Azure Bastion by @BernieWhite.
      [#1442](https://github.com/Azure/PSRule.Rules.Azure/issues/1442)
      - Public IP addresses with the `resource-usage` tag set to `azure-bastion` are excluded.
- General improvements:
  - Added support for `dateTimeFromEpoch` and `dateTimeToEpoch` ARM functions by @BernieWhite.
    [#1451](https://github.com/Azure/PSRule.Rules.Azure/issues/1451)
- Engineering:
  - Updated built documentation to include rule ref and metadata by @BernieWhite.
    [#1432](https://github.com/Azure/PSRule.Rules.Azure/issues/1432)
  - Added ref properties for several rules by @BernieWhite.
    [#1430](https://github.com/Azure/PSRule.Rules.Azure/issues/1430)
  - Updated provider data for analysis.
    [#1453](https://github.com/Azure/PSRule.Rules.Azure/pull/1453)

## v1.16.0-B0017 (pre-release)

What's changed since v1.15.2:

- New rules:
  - App Service:
    - Check web apps have insecure FTP disabled by @BernieWhite.
      [#1436](https://github.com/Azure/PSRule.Rules.Azure/issues/1436)
    - Check web apps use a dedicated health probe by @BernieWhite.
      [#1437](https://github.com/Azure/PSRule.Rules.Azure/issues/1437)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.2.0.
    [#1410](https://github.com/Azure/PSRule.Rules.Azure/pull/1410)
- Bug fixes:
  - Fixed `Azure.Template.UseVariables` does not accept function variables names by @BernieWhite.
    [#1427](https://github.com/Azure/PSRule.Rules.Azure/issues/1427)

## v1.15.2

What's changed since v1.15.1:

- Bug fixes:
  - Fixed `Azure.AppService.ManagedIdentity` does not accept both system and user assigned by @BernieWhite.
    [#1415](https://github.com/Azure/PSRule.Rules.Azure/issues/1415)
    - This also applies to:
      - `Azure.ADX.ManagedIdentity`
      - `Azure.APIM.ManagedIdentity`
      - `Azure.EventGrid.ManagedIdentity`
      - `Azure.Automation.ManagedIdentity`
  - Fixed Web apps with .NET 6 do not meet version constraint of `Azure.AppService.NETVersion` by @BernieWhite.
    [#1414](https://github.com/Azure/PSRule.Rules.Azure/issues/1414)
    - This also applies to `Azure.AppService.PHPVersion`.

## v1.15.1

What's changed since v1.15.0:

- Bug fixes:
  - Fixed exclusion of `dataCollectionRuleAssociations` from `Azure.Resource.UseTags` by @BernieWhite.
    [#1400](https://github.com/Azure/PSRule.Rules.Azure/issues/1400)
  - Fixed could not determine JSON object type for MockObject using CreateObject by @BernieWhite.
    [#1411](https://github.com/Azure/PSRule.Rules.Azure/issues/1411)
  - Fixed cannot bind argument to parameter 'Sku' because it is an empty string by @BernieWhite.
    [#1407](https://github.com/Azure/PSRule.Rules.Azure/issues/1407)

## v1.15.0

What's changed since v1.14.3:

- New features:
  - **Important change**: Added `Azure.Resource.SupportsTags` selector by @BernieWhite.
    [#1339](https://github.com/Azure/PSRule.Rules.Azure/issues/1339)
    - Use this selector in custom rules to filter rules to only run against resources that support tags.
    - This selector replaces the `SupportsTags` PowerShell function.
    - Using the `SupportsTag` function will now result in a warning.
    - The `SupportsTags` function will be removed in v2.
    - See [upgrade notes][1] for more information.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.22.6` by @BernieWhite.
      [#1386](https://github.com/Azure/PSRule.Rules.Azure/issues/1386)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Engineering:
  - Added code signing of module by @BernieWhite.
    [#1379](https://github.com/Azure/PSRule.Rules.Azure/issues/1379)
  - Added SBOM manifests to module by @BernieWhite.
    [#1380](https://github.com/Azure/PSRule.Rules.Azure/issues/1380)
  - Embedded provider and alias information as manifest resources by @BernieWhite.
    [#1383](https://github.com/Azure/PSRule.Rules.Azure/issues/1383)
    - Resources are minified and compressed to improve size and speed.
  - Added additional `nodeps` manifest that does not include dependencies for Az modules by @BernieWhite.
    [#1392](https://github.com/Azure/PSRule.Rules.Azure/issues/1392)
  - Bump Az.Accounts to 2.7.6. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump Az.Resources to 5.6.0. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump PSRule to 2.1.0. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump Pester to 5.3.3. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
- Bug fixes:
  - Fixed dependency chain order when dependsOn copy by @BernieWhite.
    [#1381](https://github.com/Azure/PSRule.Rules.Azure/issues/1381)
  - Fixed error calling SupportsTags function by @BernieWhite.
    [#1401](https://github.com/Azure/PSRule.Rules.Azure/issues/1401)

What's changed since pre-release v1.15.0-B0053:

- Bug fixes:
  - Fixed error calling SupportsTags function by @BernieWhite.
    [#1401](https://github.com/Azure/PSRule.Rules.Azure/issues/1401)

## v1.15.0-B0053 (pre-release)

What's changed since pre-release v1.15.0-B0022:

- New features:
  - **Important change**: Added `Azure.Resource.SupportsTags` selector. [#1339](https://github.com/Azure/PSRule.Rules.Azure/issues/1339)
    - Use this selector in custom rules to filter rules to only run against resources that support tags.
    - This selector replaces the `SupportsTags` PowerShell function.
    - Using the `SupportsTag` function will now result in a warning.
    - The `SupportsTags` function will be removed in v2.
    - See [upgrade notes][1] for more information.
- Engineering:
  - Embedded provider and alias information as manifest resources. [#1383](https://github.com/Azure/PSRule.Rules.Azure/issues/1383)
    - Resources are minified and compressed to improve size and speed.
  - Added additional `nodeps` manifest that does not include dependencies for Az modules. [#1392](https://github.com/Azure/PSRule.Rules.Azure/issues/1392)
  - Bump Az.Accounts to 2.7.6. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump Az.Resources to 5.6.0. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump PSRule to 2.1.0. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)
  - Bump Pester to 5.3.3. [#1338](https://github.com/Azure/PSRule.Rules.Azure/pull/1338)

## v1.15.0-B0022 (pre-release)

What's changed since v1.14.3:

- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.22.6`. [#1386](https://github.com/Azure/PSRule.Rules.Azure/issues/1386)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Engineering:
  - Added code signing of module. [#1379](https://github.com/Azure/PSRule.Rules.Azure/issues/1379)
  - Added SBOM manifests to module. [#1380](https://github.com/Azure/PSRule.Rules.Azure/issues/1380)
- Bug fixes:
  - Fixed dependency chain order when dependsOn copy. [#1381](https://github.com/Azure/PSRule.Rules.Azure/issues/1381)

## v1.14.3

What's changed since v1.14.2:

- Bug fixes:
  - Fixed Azure Firewall threat intel mode reported for Secure VNET hubs. [#1365](https://github.com/Azure/PSRule.Rules.Azure/issues/1365)
  - Fixed array function handling with mock objects. [#1367](https://github.com/Azure/PSRule.Rules.Azure/issues/1367)

## v1.14.2

What's changed since v1.14.1:

- Bug fixes:
  - Fixed handling of parent resources when sub resource is in a separate deployment. [#1360](https://github.com/Azure/PSRule.Rules.Azure/issues/1360)

## v1.14.1

What's changed since v1.14.0:

- Bug fixes:
  - Fixed unable to set parameter defaults option with type object. [#1355](https://github.com/Azure/PSRule.Rules.Azure/issues/1355)

## v1.14.0

What's changed since v1.13.4:

- New features:
  - Added support for referencing resources in template. [#1315](https://github.com/Azure/PSRule.Rules.Azure/issues/1315)
    - The `reference()` function can be used to reference resources in template.
    - A placeholder value is still used for resources outside of the template.
  - Added March 2022 baselines `Azure.GA_2022_03` and `Azure.Preview_2022_03`. [#1334](https://github.com/Azure/PSRule.Rules.Azure/issues/1334)
    - Includes rules released before or during March 2022.
    - Marked `Azure.GA_2021_12` and `Azure.Preview_2021_12` baselines as obsolete.
  - **Experimental**: Cmdlets to validate objects with Azure policy conditions:
    - `Export-AzPolicyAssignmentData` - Exports policy assignment data. [#1266](https://github.com/Azure/PSRule.Rules.Azure/issues/1266)
    - `Export-AzPolicyAssignmentRuleData` - Exports JSON rules from policy assignment data. [#1278](https://github.com/Azure/PSRule.Rules.Azure/issues/1278)
    - `Get-AzPolicyAssignmentDataSource` - Discovers policy assignment data. [#1340](https://github.com/Azure/PSRule.Rules.Azure/issues/1340)
    - See cmdlet help for limitations and usage.
    - Additional information will be posted as this feature evolves [here](https://github.com/Azure/PSRule.Rules.Azure/discussions/1345).
- New rules:
  - SignalR Service:
    - Check services use Managed Identities. [#1306](https://github.com/Azure/PSRule.Rules.Azure/issues/1306)
    - Check services use a SKU with an SLA. [#1307](https://github.com/Azure/PSRule.Rules.Azure/issues/1307)
  - Web PubSub Service:
    - Check services use Managed Identities. [#1308](https://github.com/Azure/PSRule.Rules.Azure/issues/1308)
    - Check services use a SKU with an SLA. [#1309](https://github.com/Azure/PSRule.Rules.Azure/issues/1309)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.21.9`. [#1318](https://github.com/Azure/PSRule.Rules.Azure/issues/1318)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Engineering:
  - Cache Azure Policy Aliases. [#1277](https://github.com/Azure/PSRule.Rules.Azure/issues/1277)
  - Cleanup of additional alias metadata. [#1351](https://github.com/Azure/PSRule.Rules.Azure/pull/1351)
- Bug fixes:
  - Fixed index was out of range with split on mock properties. [#1327](https://github.com/Azure/PSRule.Rules.Azure/issues/1327)
  - Fixed mock objects with no properties. [#1347](https://github.com/Azure/PSRule.Rules.Azure/issues/1347)
  - Fixed sub-resources nesting by scope regression. [#1348](https://github.com/Azure/PSRule.Rules.Azure/issues/1348)
  - Fixed expand of runtime properties on reference objects. [#1324](https://github.com/Azure/PSRule.Rules.Azure/issues/1324)
  - Fixed processing of deployment outputs. [#1316](https://github.com/Azure/PSRule.Rules.Azure/issues/1316)

What's changed since pre-release v1.14.0-B2204013:

- No additional changes.

## v1.14.0-B2204013 (pre-release)

What's changed since pre-release v1.14.0-B2204007:

- Engineering:
  - Cleanup of additional alias metadata. [#1351](https://github.com/Azure/PSRule.Rules.Azure/pull/1351)

## v1.14.0-B2204007 (pre-release)

What's changed since pre-release v1.14.0-B2203117:

- Bug fixes:
  - Fixed mock objects with no properties. [#1347](https://github.com/Azure/PSRule.Rules.Azure/issues/1347)
  - Fixed sub-resources nesting by scope regression. [#1348](https://github.com/Azure/PSRule.Rules.Azure/issues/1348)

## v1.14.0-B2203117 (pre-release)

What's changed since pre-release v1.14.0-B2203088:

- New features:
  - **Experimental**: Cmdlets to validate objects with Azure policy conditions:
    - `Export-AzPolicyAssignmentData` - Exports policy assignment data. [#1266](https://github.com/Azure/PSRule.Rules.Azure/issues/1266)
    - `Export-AzPolicyAssignmentRuleData` - Exports JSON rules from policy assignment data. [#1278](https://github.com/Azure/PSRule.Rules.Azure/issues/1278)
    - `Get-AzPolicyAssignmentDataSource` - Discovers policy assignment data. [#1340](https://github.com/Azure/PSRule.Rules.Azure/issues/1340)
    - See cmdlet help for limitations and usage.
    - Additional information will be posted as this feature evolves [here](https://github.com/Azure/PSRule.Rules.Azure/discussions/1345).
- Engineering:
  - Cache Azure Policy Aliases. [#1277](https://github.com/Azure/PSRule.Rules.Azure/issues/1277)
- Bug fixes:
  - Fixed index was out of range with split on mock properties. [#1327](https://github.com/Azure/PSRule.Rules.Azure/issues/1327)

## v1.14.0-B2203088 (pre-release)

What's changed since pre-release v1.14.0-B2203066:

- New features:
  - Added March 2022 baselines `Azure.GA_2022_03` and `Azure.Preview_2022_03`. [#1334](https://github.com/Azure/PSRule.Rules.Azure/issues/1334)
    - Includes rules released before or during March 2022.
    - Marked `Azure.GA_2021_12` and `Azure.Preview_2021_12` baselines as obsolete.
- Bug fixes:
  - Fixed expand of runtime properties on reference objects. [#1324](https://github.com/Azure/PSRule.Rules.Azure/issues/1324)

## v1.14.0-B2203066 (pre-release)

What's changed since v1.13.4:

- New features:
  - Added support for referencing resources in template. [#1315](https://github.com/Azure/PSRule.Rules.Azure/issues/1315)
    - The `reference()` function can be used to reference resources in template.
    - A placeholder value is still used for resources outside of the template.
- New rules:
  - SignalR Service:
    - Check services use Managed Identities. [#1306](https://github.com/Azure/PSRule.Rules.Azure/issues/1306)
    - Check services use a SKU with an SLA. [#1307](https://github.com/Azure/PSRule.Rules.Azure/issues/1307)
  - Web PubSub Service:
    - Check services use Managed Identities. [#1308](https://github.com/Azure/PSRule.Rules.Azure/issues/1308)
    - Check services use a SKU with an SLA. [#1309](https://github.com/Azure/PSRule.Rules.Azure/issues/1309)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.21.9`. [#1318](https://github.com/Azure/PSRule.Rules.Azure/issues/1318)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Bug fixes:
  - Fixed processing of deployment outputs. [#1316](https://github.com/Azure/PSRule.Rules.Azure/issues/1316)

## v1.13.4

What's changed since v1.13.3:

- Bug fixes:
  - Fixed virtual network without any subnets is invalid. [#1303](https://github.com/Azure/PSRule.Rules.Azure/issues/1303)
  - Fixed container registry rules that require a premium tier. [#1304](https://github.com/Azure/PSRule.Rules.Azure/issues/1304)
    - Rules `Azure.ACR.Retention` and `Azure.ACR.ContentTrust` are now only run against premium instances.

## v1.13.3

What's changed since v1.13.2:

- Bug fixes:
  - Fixed bicep build timeout for complex deployments. [#1299](https://github.com/Azure/PSRule.Rules.Azure/issues/1299)

## v1.13.2

What's changed since v1.13.1:

- Engineering:
  - Bump PowerShellStandard.Library to 5.1.1. [#1295](https://github.com/Azure/PSRule.Rules.Azure/pull/1295)
- Bug fixes:
  - Fixed nested resource loops. [#1293](https://github.com/Azure/PSRule.Rules.Azure/issues/1293)

## v1.13.1

What's changed since v1.13.0:

- Bug fixes:
  - Fixed parsing of nested quote pairs within JSON function. [#1288](https://github.com/Azure/PSRule.Rules.Azure/issues/1288)

## v1.13.0

What's changed since v1.12.2:

- New features:
  - Added support for setting defaults for required parameters. [#1065](https://github.com/Azure/PSRule.Rules.Azure/issues/1065)
    - When specified, the value will be used when a parameter value is not provided.
  - Added support expanding Bicep from parameter files. [#1160](https://github.com/Azure/PSRule.Rules.Azure/issues/1160)
- New rules:
  - Azure Cache for Redis:
    - Limit public access for Azure Cache for Redis instances. [#935](https://github.com/Azure/PSRule.Rules.Azure/issues/935)
  - Container App:
    - Check insecure ingress is not enabled (preview). [#1252](https://github.com/Azure/PSRule.Rules.Azure/issues/1252)
  - Key Vault:
    - Check key auto-rotation is enabled (preview). [#1159](https://github.com/Azure/PSRule.Rules.Azure/issues/1159)
  - Recovery Services Vault:
    - Check vaults have replication alerts configured. [#7](https://github.com/Azure/PSRule.Rules.Azure/issues/7)
- Engineering:
  - Automatically build baseline docs. [#1242](https://github.com/Azure/PSRule.Rules.Azure/issues/1242)
  - Bump PSRule dependency to v1.11.1. [#1269](https://github.com/Azure/PSRule.Rules.Azure/pull/1269)
- Bug fixes:
  - Fixed empty value with strong type. [#1258](https://github.com/Azure/PSRule.Rules.Azure/issues/1258)
  - Fixed error with empty logic app trigger. [#1249](https://github.com/Azure/PSRule.Rules.Azure/issues/1249)
  - Fixed out of order parameters. [#1257](https://github.com/Azure/PSRule.Rules.Azure/issues/1257)
  - Fixed mapping default configuration causes cast exception. [#1274](https://github.com/Azure/PSRule.Rules.Azure/issues/1274)
  - Fixed resource id is incorrectly built for sub resource types. [#1279](https://github.com/Azure/PSRule.Rules.Azure/issues/1279)

What's changed since pre-release v1.13.0-B2202113:

- No additional changes.

## v1.13.0-B2202113 (pre-release)

What's changed since pre-release v1.13.0-B2202108:

- Bug fixes:
  - Fixed resource id is incorrectly built for sub resource types. [#1279](https://github.com/Azure/PSRule.Rules.Azure/issues/1279)

## v1.13.0-B2202108 (pre-release)

What's changed since pre-release v1.13.0-B2202103:

- Bug fixes:
  - Fixed mapping default configuration causes cast exception. [#1274](https://github.com/Azure/PSRule.Rules.Azure/issues/1274)

## v1.13.0-B2202103 (pre-release)

What's changed since pre-release v1.13.0-B2202090:

- Engineering:
  - Bump PSRule dependency to v1.11.1. [#1269](https://github.com/Azure/PSRule.Rules.Azure/pull/1269)
- Bug fixes:
  - Fixed out of order parameters. [#1257](https://github.com/Azure/PSRule.Rules.Azure/issues/1257)

## v1.13.0-B2202090 (pre-release)

What's changed since pre-release v1.13.0-B2202063:

- New rules:
  - Azure Cache for Redis:
    - Limit public access for Azure Cache for Redis instances. [#935](https://github.com/Azure/PSRule.Rules.Azure/issues/935)
- Engineering:
  - Automatically build baseline docs. [#1242](https://github.com/Azure/PSRule.Rules.Azure/issues/1242)
- Bug fixes:
  - Fixed empty value with strong type. [#1258](https://github.com/Azure/PSRule.Rules.Azure/issues/1258)

## v1.13.0-B2202063 (pre-release)

What's changed since v1.12.2:

- New features:
  - Added support for setting defaults for required parameters. [#1065](https://github.com/Azure/PSRule.Rules.Azure/issues/1065)
    - When specified, the value will be used when a parameter value is not provided.
  - Added support expanding Bicep from parameter files. [#1160](https://github.com/Azure/PSRule.Rules.Azure/issues/1160)
- New rules:
  - Container App:
    - Check insecure ingress is not enabled (preview). [#1252](https://github.com/Azure/PSRule.Rules.Azure/issues/1252)
  - Key Vault:
    - Check key auto-rotation is enabled (preview). [#1159](https://github.com/Azure/PSRule.Rules.Azure/issues/1159)
  - Recovery Services Vault:
    - Check vaults have replication alerts configured. [#7](https://github.com/Azure/PSRule.Rules.Azure/issues/7)
- Bug fixes:
  - Fixed error with empty logic app trigger. [#1249](https://github.com/Azure/PSRule.Rules.Azure/issues/1249)

## v1.12.2

What's changed since v1.12.1:

- Bug fixes:
  - Fixed detect strong type requirements for nested deployments. [#1235](https://github.com/Azure/PSRule.Rules.Azure/issues/1235)

## v1.12.1

What's changed since v1.12.0:

- Bug fixes:
  - Fixed Bicep already exists with PSRule v2. [#1232](https://github.com/Azure/PSRule.Rules.Azure/issues/1232)

## v1.12.0

What's changed since v1.11.1:

- New rules:
  - Data Explorer:
    - Check clusters use Managed Identities. [#1207](https://github.com/Azure/PSRule.Rules.Azure/issues/1207)
    - Check clusters use a SKU with a SLA. [#1208](https://github.com/Azure/PSRule.Rules.Azure/issues/1208)
    - Check clusters use disk encryption. [#1209](https://github.com/Azure/PSRule.Rules.Azure/issues/1209)
    - Check clusters are in use with databases. [#1215](https://github.com/Azure/PSRule.Rules.Azure/issues/1215)
  - Event Hub:
    - Check namespaces are in use with event hubs. [#1216](https://github.com/Azure/PSRule.Rules.Azure/issues/1216)
    - Check namespaces only accept identity-based authentication. [#1217](https://github.com/Azure/PSRule.Rules.Azure/issues/1217)
  - Azure Recovery Services Vault:
    - Check vaults use geo-redundant storage. [#5](https://github.com/Azure/PSRule.Rules.Azure/issues/5)
  - Service Bus:
    - Check namespaces are in use with queues and topics. [#1218](https://github.com/Azure/PSRule.Rules.Azure/issues/1218)
    - Check namespaces only accept identity-based authentication. [#1219](https://github.com/Azure/PSRule.Rules.Azure/issues/1219)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.21.7`. [#1188](https://github.com/Azure/PSRule.Rules.Azure/issues/1188)
      - Pinned latest GA baseline `Azure.GA_2021_12` to previous version `1.20.5`.
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
  - Azure API Management:
    - Check service disabled insecure ciphers.
      [#1128](https://github.com/Azure/PSRule.Rules.Azure/issues/1128)
    - Refactored the cipher and protocol rule into individual rules.
      - `Azure.APIM.Protocols`
      - `Azure.APIM.Ciphers`
- General improvements:
  - **Important change:** Replaced `Azure_AKSMinimumVersion` option with `AZURE_AKS_CLUSTER_MINIMUM_VERSION`. [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AKSMinimumVersion` is set it will be used instead of `AZURE_AKS_CLUSTER_MINIMUM_VERSION`.
    - If only `AZURE_AKS_CLUSTER_MINIMUM_VERSION` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AKSMinimumVersion` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AKSMinimumVersion` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
- Bug fixes:
  - Fixed false positive of blob container with access unspecified. [#1212](https://github.com/Azure/PSRule.Rules.Azure/issues/1212)

What's changed since pre-release v1.12.0-B2201086:

- No additional changes.

## v1.12.0-B2201086 (pre-release)

What's changed since pre-release v1.12.0-B2201067:

- New rules:
  - Data Explorer:
    - Check clusters are in use with databases. [#1215](https://github.com/Azure/PSRule.Rules.Azure/issues/1215)
  - Event Hub:
    - Check namespaces are in use with event hubs. [#1216](https://github.com/Azure/PSRule.Rules.Azure/issues/1216)
    - Check namespaces only accept identity-based authentication. [#1217](https://github.com/Azure/PSRule.Rules.Azure/issues/1217)
  - Azure Recovery Services Vault:
    - Check vaults use geo-redundant storage. [#5](https://github.com/Azure/PSRule.Rules.Azure/issues/5)
  - Service Bus:
    - Check namespaces are in use with queues and topics. [#1218](https://github.com/Azure/PSRule.Rules.Azure/issues/1218)
    - Check namespaces only accept identity-based authentication. [#1219](https://github.com/Azure/PSRule.Rules.Azure/issues/1219)

## v1.12.0-B2201067 (pre-release)

What's changed since pre-release v1.12.0-B2201054:

- New rules:
  - Data Explorer:
    - Check clusters use Managed Identities. [#1207](https://github.com/Azure/PSRule.Rules.Azure/issues/1207)
    - Check clusters use a SKU with a SLA. [#1208](https://github.com/Azure/PSRule.Rules.Azure/issues/1208)
    - Check clusters use disk encryption. [#1209](https://github.com/Azure/PSRule.Rules.Azure/issues/1209)
- Bug fixes:
  - Fixed false positive of blob container with access unspecified. [#1212](https://github.com/Azure/PSRule.Rules.Azure/issues/1212)

## v1.12.0-B2201054 (pre-release)

What's changed since v1.11.1:

- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.21.7`. [#1188](https://github.com/Azure/PSRule.Rules.Azure/issues/1188)
      - Pinned latest GA baseline `Azure.GA_2021_12` to previous version `1.20.5`.
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
  - Azure API Management:
    - Check service disabled insecure ciphers.
      [#1128](https://github.com/Azure/PSRule.Rules.Azure/issues/1128)
    - Refactored the cipher and protocol rule into individual rules.
      - `Azure.APIM.Protocols`
      - `Azure.APIM.Ciphers`
- General improvements:
  - **Important change:** Replaced `Azure_AKSMinimumVersion` option with `AZURE_AKS_CLUSTER_MINIMUM_VERSION`. [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AKSMinimumVersion` is set it will be used instead of `AZURE_AKS_CLUSTER_MINIMUM_VERSION`.
    - If only `AZURE_AKS_CLUSTER_MINIMUM_VERSION` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AKSMinimumVersion` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AKSMinimumVersion` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.

## v1.11.1

What's changed since v1.11.0:

- Bug fixes:
  - Fixed `Azure.AKS.CNISubnetSize` rule to use CNI selector. [#1178](https://github.com/Azure/PSRule.Rules.Azure/issues/1178)

## v1.11.0

What's changed since v1.10.4:

- New features:
  - Added baselines containing only Azure preview features. [#1129](https://github.com/Azure/PSRule.Rules.Azure/issues/1129)
    - Added baseline `Azure.Preview_2021_09`.
    - Added baseline `Azure.Preview_2021_12`.
  - Added `Azure.GA_2021_12` baseline. [#1146](https://github.com/Azure/PSRule.Rules.Azure/issues/1146)
    - Includes rules released before or during December 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_09` as obsolete.
  - Bicep support promoted from experimental to generally available (GA). [#1176](https://github.com/Azure/PSRule.Rules.Azure/issues/1176)
- New rules:
  - All resources:
    - Check comments for each template resource. [#969](https://github.com/Azure/PSRule.Rules.Azure/issues/969)
  - Automation Account:
    - Automation accounts should enable diagnostic logs. [#1075](https://github.com/Azure/PSRule.Rules.Azure/issues/1075)
  - Azure Kubernetes Service:
    - Check clusters have the HTTP application routing add-on disabled. [#1131](https://github.com/Azure/PSRule.Rules.Azure/issues/1131)
    - Check clusters use the Secrets Store CSI Driver add-on. [#992](https://github.com/Azure/PSRule.Rules.Azure/issues/992)
    - Check clusters autorotation with the Secrets Store CSI Driver add-on. [#993](https://github.com/Azure/PSRule.Rules.Azure/issues/993)
    - Check clusters use Azure AD Pod Managed Identities (preview). [#991](https://github.com/Azure/PSRule.Rules.Azure/issues/991)
  - Azure Redis Cache:
    - Use availability zones for Azure Cache for Redis for regions that support it. [#1078](https://github.com/Azure/PSRule.Rules.Azure/issues/1078)
      - `Azure.Redis.AvailabilityZone`
      - `Azure.RedisEnterprise.Zones`
  - Application Security Group:
    - Check Application Security Groups meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Firewall:
    - Check Firewalls meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
    - Check Firewall policies meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Private Endpoint:
    - Check Private Endpoints meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Virtual WAN:
    - Check Virtual WANs meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
- Updated rules:
  - Azure Kubernetes Service:
    - Promoted `Azure.AKS.AutoUpgrade` to GA rule set. [#1130](https://github.com/Azure/PSRule.Rules.Azure/issues/1130)
- General improvements:
  - Added support for template function `tenant()`. [#1124](https://github.com/Azure/PSRule.Rules.Azure/issues/1124)
  - Added support for template function `managementGroup()`. [#1125](https://github.com/Azure/PSRule.Rules.Azure/issues/1125)
  - Added support for template function `pickZones()`. [#518](https://github.com/Azure/PSRule.Rules.Azure/issues/518)
- Engineering:
  - Rule refactoring of rules from PowerShell to YAML. [#1109](https://github.com/Azure/PSRule.Rules.Azure/issues/1109)
    - The following rules were refactored:
      - `Azure.LB.Name`
      - `Azure.NSG.Name`
      - `Azure.Firewall.Mode`
      - `Azure.Route.Name`
      - `Azure.VNET.Name`
      - `Azure.VNG.Name`
      - `Azure.VNG.ConnectionName`
      - `Azure.AppConfig.SKU`
      - `Azure.AppConfig.Name`
      - `Azure.AppInsights.Workspace`
      - `Azure.AppInsights.Name`
      - `Azure.Cosmos.AccountName`
      - `Azure.FrontDoor.State`
      - `Azure.FrontDoor.Name`
      - `Azure.FrontDoor.WAF.Mode`
      - `Azure.FrontDoor.WAF.Enabled`
      - `Azure.FrontDoor.WAF.Name`
      - `Azure.AKS.MinNodeCount`
      - `Azure.AKS.ManagedIdentity`
      - `Azure.AKS.StandardLB`
      - `Azure.AKS.AzurePolicyAddOn`
      - `Azure.AKS.ManagedAAD`
      - `Azure.AKS.AuthorizedIPs`
      - `Azure.AKS.LocalAccounts`
      - `Azure.AKS.AzureRBAC`
- Bug fixes:
  - Fixed output of Bicep informational and warning messages in error stream. [#1157](https://github.com/Azure/PSRule.Rules.Azure/issues/1157)

What's changed since pre-release v1.11.0-B2112112:

- New features:
  - Bicep support promoted from experimental to generally available (GA). [#1176](https://github.com/Azure/PSRule.Rules.Azure/issues/1176)

## v1.11.0-B2112112 (pre-release)

What's changed since pre-release v1.11.0-B2112104:

- New rules:
  - Azure Redis Cache:
    - Use availability zones for Azure Cache for Redis for regions that support it. [#1078](https://github.com/Azure/PSRule.Rules.Azure/issues/1078)
      - `Azure.Redis.AvailabilityZone`
      - `Azure.RedisEnterprise.Zones`

## v1.11.0-B2112104 (pre-release)

What's changed since pre-release v1.11.0-B2112073:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use Azure AD Pod Managed Identities (preview). [#991](https://github.com/Azure/PSRule.Rules.Azure/issues/991)
- Engineering:
  - Rule refactoring of rules from PowerShell to YAML. [#1109](https://github.com/Azure/PSRule.Rules.Azure/issues/1109)
    - The following rules were refactored:
      - `Azure.AppConfig.SKU`
      - `Azure.AppConfig.Name`
      - `Azure.AppInsights.Workspace`
      - `Azure.AppInsights.Name`
      - `Azure.Cosmos.AccountName`
      - `Azure.FrontDoor.State`
      - `Azure.FrontDoor.Name`
      - `Azure.FrontDoor.WAF.Mode`
      - `Azure.FrontDoor.WAF.Enabled`
      - `Azure.FrontDoor.WAF.Name`
      - `Azure.AKS.MinNodeCount`
      - `Azure.AKS.ManagedIdentity`
      - `Azure.AKS.StandardLB`
      - `Azure.AKS.AzurePolicyAddOn`
      - `Azure.AKS.ManagedAAD`
      - `Azure.AKS.AuthorizedIPs`
      - `Azure.AKS.LocalAccounts`
      - `Azure.AKS.AzureRBAC`
- Bug fixes:
  - Fixed output of Bicep informational and warning messages in error stream. [#1157](https://github.com/Azure/PSRule.Rules.Azure/issues/1157)
  - Fixed obsolete flag for baseline `Azure.Preview_2021_12`. [#1166](https://github.com/Azure/PSRule.Rules.Azure/issues/1166)

## v1.11.0-B2112073 (pre-release)

What's changed since pre-release v1.11.0-B2112024:

- New features:
  - Added baselines containing only Azure preview features. [#1129](https://github.com/Azure/PSRule.Rules.Azure/issues/1129)
    - Added baseline `Azure.Preview_2021_09`.
    - Added baseline `Azure.Preview_2021_12`.
  - Added `Azure.GA_2021_12` baseline. [#1146](https://github.com/Azure/PSRule.Rules.Azure/issues/1146)
    - Includes rules released before or during December 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_09` as obsolete.
- New rules:
  - All resources:
    - Check comments for each template resource. [#969](https://github.com/Azure/PSRule.Rules.Azure/issues/969)
- Bug fixes:
  - Fixed template function `equals` parameter count mismatch. [#1137](https://github.com/Azure/PSRule.Rules.Azure/issues/1137)
  - Fixed copy loop on nested deployment parameters is not handled. [#1144](https://github.com/Azure/PSRule.Rules.Azure/issues/1144)
  - Fixed outer copy loop of nested deployment. [#1154](https://github.com/Azure/PSRule.Rules.Azure/issues/1154)

## v1.11.0-B2112024 (pre-release)

What's changed since pre-release v1.11.0-B2111014:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters have the HTTP application routing add-on disabled. [#1131](https://github.com/Azure/PSRule.Rules.Azure/issues/1131)
    - Check clusters use the Secrets Store CSI Driver add-on. [#992](https://github.com/Azure/PSRule.Rules.Azure/issues/992)
    - Check clusters autorotation with the Secrets Store CSI Driver add-on. [#993](https://github.com/Azure/PSRule.Rules.Azure/issues/993)
  - Automation Account:
    - Automation accounts should enable diagnostic logs. [#1075](https://github.com/Azure/PSRule.Rules.Azure/issues/1075)
- Updated rules:
  - Azure Kubernetes Service:
    - Promoted `Azure.AKS.AutoUpgrade` to GA rule set. [#1130](https://github.com/Azure/PSRule.Rules.Azure/issues/1130)
- General improvements:
  - Added support for template function `tenant()`. [#1124](https://github.com/Azure/PSRule.Rules.Azure/issues/1124)
  - Added support for template function `managementGroup()`. [#1125](https://github.com/Azure/PSRule.Rules.Azure/issues/1125)
  - Added support for template function `pickZones()`. [#518](https://github.com/Azure/PSRule.Rules.Azure/issues/518)
- Bug fixes:
  - Fixed `Azure.Policy.WaiverExpiry` date conversion. [#1118](https://github.com/Azure/PSRule.Rules.Azure/issues/1118)

## v1.11.0-B2111014 (pre-release)

What's changed since v1.10.0:

- New rules:
  - Application Security Group:
    - Check Application Security Groups meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Firewall:
    - Check Firewalls meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
    - Check Firewall policies meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Private Endpoint:
    - Check Private Endpoints meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
  - Virtual WAN:
    - Check Virtual WANs meet naming requirements. [#1110](https://github.com/Azure/PSRule.Rules.Azure/issues/1110)
- Engineering:
  - Rule refactoring of rules from PowerShell to YAML. [#1109](https://github.com/Azure/PSRule.Rules.Azure/issues/1109)
    - The following rules were refactored:
      - `Azure.LB.Name`
      - `Azure.NSG.Name`
      - `Azure.Firewall.Mode`
      - `Azure.Route.Name`
      - `Azure.VNET.Name`
      - `Azure.VNG.Name`
      - `Azure.VNG.ConnectionName`

## v1.10.4

What's changed since v1.10.3:

- Bug fixes:
  - Fixed outer copy loop of nested deployment. [#1154](https://github.com/Azure/PSRule.Rules.Azure/issues/1154)

## v1.10.3

What's changed since v1.10.2:

- Bug fixes:
  - Fixed copy loop on nested deployment parameters is not handled. [#1144](https://github.com/Azure/PSRule.Rules.Azure/issues/1144)

## v1.10.2

What's changed since v1.10.1:

- Bug fixes:
  - Fixed template function `equals` parameter count mismatch. [#1137](https://github.com/Azure/PSRule.Rules.Azure/issues/1137)

## v1.10.1

What's changed since v1.10.0:

- Bug fixes:
  - Fixed `Azure.Policy.WaiverExpiry` date conversion. [#1118](https://github.com/Azure/PSRule.Rules.Azure/issues/1118)

## v1.10.0

What's changed since v1.9.1:

- New features:
  - Added support for parameter strong types. [#1083](https://github.com/Azure/PSRule.Rules.Azure/issues/1083)
    - The value of string parameters can be tested against the expected type.
    - When configuring a location strong type, the parameter value must be a valid Azure location.
    - When configuring a resource type strong type, the parameter value must be a matching resource Id.
- New rules:
  - All resources:
    - Check template expressions do not exceed a maximum length. [#1006](https://github.com/Azure/PSRule.Rules.Azure/issues/1006)
  - Automation Service:
    - Check automation accounts should use managed identities for authentication. [#1074](https://github.com/Azure/PSRule.Rules.Azure/issues/1074)
  - Event Grid:
    - Check topics and domains use managed identities. [#1091](https://github.com/Azure/PSRule.Rules.Azure/issues/1091)
    - Check topics and domains use private endpoints. [#1092](https://github.com/Azure/PSRule.Rules.Azure/issues/1092)
    - Check topics and domains use identity-based authentication. [#1093](https://github.com/Azure/PSRule.Rules.Azure/issues/1093)
- General improvements:
  - Updated default baseline to use module configuration. [#1089](https://github.com/Azure/PSRule.Rules.Azure/issues/1089)
- Engineering:
  - Bump PSRule dependency to v1.9.0. [#1081](https://github.com/Azure/PSRule.Rules.Azure/issues/1081)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v6.0.0. [#1080](https://github.com/Azure/PSRule.Rules.Azure/pull/1080)
  - Bump Microsoft.SourceLink.GitHub to 1.1.1. [#1085](https://github.com/Azure/PSRule.Rules.Azure/pull/1085)
- Bug fixes:
  - Fixed expansion of secret references. [#1098](https://github.com/Azure/PSRule.Rules.Azure/issues/1098)
  - Fixed handling of tagging for deployments. [#1099](https://github.com/Azure/PSRule.Rules.Azure/issues/1099)
  - Fixed strong type issue flagged with empty defaultValue string. [#1100](https://github.com/Azure/PSRule.Rules.Azure/issues/1100)

What's changed since pre-release v1.10.0-B2111081:

- No additional changes.

## v1.10.0-B2111081 (pre-release)

What's changed since pre-release v1.10.0-B2111072:

- New rules:
  - Automation Service:
    - Automation accounts should use managed identities for authentication. [#1074](https://github.com/Azure/PSRule.Rules.Azure/issues/1074)

## v1.10.0-B2111072 (pre-release)

What's changed since pre-release v1.10.0-B2111058:

- New rules:
  - All resources:
    - Check template expressions do not exceed a maximum length. [#1006](https://github.com/Azure/PSRule.Rules.Azure/issues/1006)
- Bug fixes:
  - Fixed expansion of secret references. [#1098](https://github.com/Azure/PSRule.Rules.Azure/issues/1098)
  - Fixed handling of tagging for deployments. [#1099](https://github.com/Azure/PSRule.Rules.Azure/issues/1099)
  - Fixed strong type issue flagged with empty defaultValue string. [#1100](https://github.com/Azure/PSRule.Rules.Azure/issues/1100)

## v1.10.0-B2111058 (pre-release)

What's changed since pre-release v1.10.0-B2111040:

- New rules:
  - Event Grid:
    - Check topics and domains use managed identities. [#1091](https://github.com/Azure/PSRule.Rules.Azure/issues/1091)
    - Check topics and domains use private endpoints. [#1092](https://github.com/Azure/PSRule.Rules.Azure/issues/1092)
    - Check topics and domains use identity-based authentication. [#1093](https://github.com/Azure/PSRule.Rules.Azure/issues/1093)
- General improvements:
  - Updated default baseline to use module configuration. [#1089](https://github.com/Azure/PSRule.Rules.Azure/issues/1089)

## v1.10.0-B2111040 (pre-release)

What's changed since v1.9.1:

- New features:
  - Added support for parameter strong types. [#1083](https://github.com/Azure/PSRule.Rules.Azure/issues/1083)
    - The value of string parameters can be tested against the expected type.
    - When configuring a location strong type, the parameter value must be a valid Azure location.
    - When configuring a resource type strong type, the parameter value must be a matching resource Id.
- Engineering:
  - Bump PSRule dependency to v1.9.0. [#1081](https://github.com/Azure/PSRule.Rules.Azure/issues/1081)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v6.0.0. [#1080](https://github.com/Azure/PSRule.Rules.Azure/pull/1080)
  - Bump Microsoft.SourceLink.GitHub to 1.1.1. [#1085](https://github.com/Azure/PSRule.Rules.Azure/pull/1085)

## v1.9.1

What's changed since v1.9.0:

- Bug fixes:
  - Fixed can not index into resource group tags. [#1066](https://github.com/Azure/PSRule.Rules.Azure/issues/1066)
  - Fixed `Azure.VM.ASMinMembers` for template deployments. [#1064](https://github.com/Azure/PSRule.Rules.Azure/issues/1064)
  - Fixed zones property not found on public IP resource. [#1070](https://github.com/Azure/PSRule.Rules.Azure/issues/1070)

## v1.9.0

What's changed since v1.8.1:

- New rules:
  - API Management Service:
    - Check API management services are using availability zones when available. [#1017](https://github.com/Azure/PSRule.Rules.Azure/issues/1017)
  - Public IP Address:
    - Check Public IP addresses are configured with zone-redundancy. [#958](https://github.com/Azure/PSRule.Rules.Azure/issues/958)
    - Check Public IP addresses are using Standard SKU. [#979](https://github.com/Azure/PSRule.Rules.Azure/issues/979)
  - User Assigned Managed Identity:
    - Check identities meet naming requirements. [#1021](https://github.com/Azure/PSRule.Rules.Azure/issues/1021)
  - Virtual Network Gateway:
    - Check VPN/ExpressRoute gateways are configured with availability zone SKU. [#926](https://github.com/Azure/PSRule.Rules.Azure/issues/926)
- General improvements:
  - Improved processing of AzOps generated templates. [#799](https://github.com/Azure/PSRule.Rules.Azure/issues/799)
    - `Azure.Template.DefineParameters` is ignored for AzOps generated templates.
    - `Azure.Template.UseLocationParameter` is ignored for AzOps generated templates.
  - Bicep is now installed when using PSRule GitHub Action. [#1050](https://github.com/Azure/PSRule.Rules.Azure/issues/1050)
- Engineering:
  - Bump PSRule dependency to v1.8.0. [#1018](https://github.com/Azure/PSRule.Rules.Azure/issues/1018)
  - Added automated PR workflow to bump `providers.json` monthly. [#1041](https://github.com/Azure/PSRule.Rules.Azure/issues/1041)
- Bug fixes:
  - Fixed AKS Network Policy should accept calico. [#1046](https://github.com/Azure/PSRule.Rules.Azure/issues/1046)
  - Fixed `Azure.ACR.AdminUser` fails when `adminUserEnabled` not set. [#1014](https://github.com/Azure/PSRule.Rules.Azure/issues/1014)
  - Fixed `Azure.KeyVault.Logs` reports cannot index into a null array. [#1024](https://github.com/Azure/PSRule.Rules.Azure/issues/1024)
  - Fixed template function empty returns object reference not set exception. [#1025](https://github.com/Azure/PSRule.Rules.Azure/issues/1025)
  - Fixed delayed binding of `and` template function. [#1026](https://github.com/Azure/PSRule.Rules.Azure/issues/1026)
  - Fixed template function array nests array with array parameters. [#1027](https://github.com/Azure/PSRule.Rules.Azure/issues/1027)
  - Fixed property used by `Azure.ACR.MinSKU` to work more reliably with templates. [#1034](https://github.com/Azure/PSRule.Rules.Azure/issues/1034)
  - Fixed could not determine JSON object type for MockMember using CreateObject. [#1035](https://github.com/Azure/PSRule.Rules.Azure/issues/1035)
  - Fixed Bicep convention ordering. [#1053](https://github.com/Azure/PSRule.Rules.Azure/issues/1053)

What's changed since pre-release v1.9.0-B2110087:

- No additional changes.

## v1.9.0-B2110087 (pre-release)

What's changed since pre-release v1.9.0-B2110082:

- Bug fixes:
  - Fixed Bicep convention ordering. [#1053](https://github.com/Azure/PSRule.Rules.Azure/issues/1053)

## v1.9.0-B2110082 (pre-release)

What's changed since pre-release v1.9.0-B2110059:

- General improvements:
  - Bicep is now installed when using PSRule GitHub Action. [#1050](https://github.com/Azure/PSRule.Rules.Azure/issues/1050)
- Engineering:
  - Added automated PR workflow to bump `providers.json` monthly. [#1041](https://github.com/Azure/PSRule.Rules.Azure/issues/1041)
- Bug fixes:
  - Fixed AKS Network Policy should accept calico. [#1046](https://github.com/Azure/PSRule.Rules.Azure/issues/1046)

## v1.9.0-B2110059 (pre-release)

What's changed since pre-release v1.9.0-B2110040:

- New rules:
  - API Management Service:
    - Check API management services are using availability zones when available. [#1017](https://github.com/Azure/PSRule.Rules.Azure/issues/1017)
- Bug fixes:
  - Fixed property used by `Azure.ACR.MinSKU` to work more reliably with templates. [#1034](https://github.com/Azure/PSRule.Rules.Azure/issues/1034)
  - Fixed could not determine JSON object type for MockMember using CreateObject. [#1035](https://github.com/Azure/PSRule.Rules.Azure/issues/1035)

## v1.9.0-B2110040 (pre-release)

What's changed since pre-release v1.9.0-B2110025:

- New rules:
  - User Assigned Managed Identity:
    - Check identities meet naming requirements. [#1021](https://github.com/Azure/PSRule.Rules.Azure/issues/1021)
- Bug fixes:
  - Fixed `Azure.KeyVault.Logs` reports cannot index into a null array. [#1024](https://github.com/Azure/PSRule.Rules.Azure/issues/1024)
  - Fixed template function empty returns object reference not set exception. [#1025](https://github.com/Azure/PSRule.Rules.Azure/issues/1025)
  - Fixed delayed binding of `and` template function. [#1026](https://github.com/Azure/PSRule.Rules.Azure/issues/1026)
  - Fixed template function array nests array with array parameters. [#1027](https://github.com/Azure/PSRule.Rules.Azure/issues/1027)

## v1.9.0-B2110025 (pre-release)

What's changed since pre-release v1.9.0-B2110014:

- Engineering:
  - Bump PSRule dependency to v1.8.0. [#1018](https://github.com/Azure/PSRule.Rules.Azure/issues/1018)
- Bug fixes:
  - Fixed `Azure.ACR.AdminUser` fails when `adminUserEnabled` not set. [#1014](https://github.com/Azure/PSRule.Rules.Azure/issues/1014)

## v1.9.0-B2110014 (pre-release)

What's changed since pre-release v1.9.0-B2110009:

- Bug fixes:
  - Fixed expression out of range of valid values. [#1005](https://github.com/Azure/PSRule.Rules.Azure/issues/1005)
  - Fixed template expand fails in nested reference expansion. [#1007](https://github.com/Azure/PSRule.Rules.Azure/issues/1007)

## v1.9.0-B2110009 (pre-release)

What's changed since pre-release v1.9.0-B2109027:

- Bug fixes:
  - Fixed handling of comments with template and parameter file rules. [#996](https://github.com/Azure/PSRule.Rules.Azure/issues/996)
  - Fixed `Azure.Template.UseLocationParameter` to only apply to templates deployed as RG scope [#995](https://github.com/Azure/PSRule.Rules.Azure/issues/995)
  - Fixed expand template fails with `createObject` when no parameters are specified. [#1000](https://github.com/Azure/PSRule.Rules.Azure/issues/1000)

## v1.9.0-B2109027 (pre-release)

What's changed since v1.8.0:

- New rules:
  - Public IP Address:
    - Check Public IP addresses are configured with zone-redundancy. [#958](https://github.com/Azure/PSRule.Rules.Azure/issues/958)
    - Check Public IP addresses are using Standard SKU. [#979](https://github.com/Azure/PSRule.Rules.Azure/issues/979)
  - Virtual Network Gateway:
    - Check VPN/ExpressRoute gateways are configured with availability zone SKU. [#926](https://github.com/Azure/PSRule.Rules.Azure/issues/926)
- General improvements:
  - Improved processing of AzOps generated templates. [#799](https://github.com/Azure/PSRule.Rules.Azure/issues/799)
    - `Azure.Template.DefineParameters` is ignored for AzOps generated templates.
    - `Azure.Template.UseLocationParameter` is ignored for AzOps generated templates.
- Bug fixes:
  - Fixed `ToUpper` fails to convert character. [#986](https://github.com/Azure/PSRule.Rules.Azure/issues/986)

## v1.8.1

What's changed since v1.8.0:

- Bug fixes:
  - Fixed handling of comments with template and parameter file rules. [#996](https://github.com/Azure/PSRule.Rules.Azure/issues/996)
  - Fixed `Azure.Template.UseLocationParameter` to only apply to templates deployed as RG scope [#995](https://github.com/Azure/PSRule.Rules.Azure/issues/995)
  - Fixed expand template fails with `createObject` when no parameters are specified. [#1000](https://github.com/Azure/PSRule.Rules.Azure/issues/1000)
  - Fixed `ToUpper` fails to convert character. [#986](https://github.com/Azure/PSRule.Rules.Azure/issues/986)
  - Fixed expression out of range of valid values. [#1005](https://github.com/Azure/PSRule.Rules.Azure/issues/1005)
  - Fixed template expand fails in nested reference expansion. [#1007](https://github.com/Azure/PSRule.Rules.Azure/issues/1007)

## v1.8.0

What's changed since v1.7.0:

- New features:
  - Added `Azure.GA_2021_09` baseline. [#961](https://github.com/Azure/PSRule.Rules.Azure/issues/961)
    - Includes rules released before or during September 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_06` as obsolete.
- New rules:
  - Application Gateway:
    - Check App Gateways should use availability zones when available. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#928](https://github.com/Azure/PSRule.Rules.Azure/issues/928)
  - Azure Kubernetes Service:
    - Check clusters have control plane audit logs enabled. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#882](https://github.com/Azure/PSRule.Rules.Azure/issues/882)
    - Check clusters have control plane diagnostics enabled. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#922](https://github.com/Azure/PSRule.Rules.Azure/issues/922)
    - Check clusters use Container Insights for monitoring workloads. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#881](https://github.com/Azure/PSRule.Rules.Azure/issues/881)
    - Check clusters use availability zones when available. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#880](https://github.com/Azure/PSRule.Rules.Azure/issues/880)
  - Cosmos DB:
    - Check DB account names meet naming requirements. [#954](https://github.com/Azure/PSRule.Rules.Azure/issues/954)
    - Check DB accounts use Azure AD identities for resource management operations. [#953](https://github.com/Azure/PSRule.Rules.Azure/issues/953)
  - Load Balancer:
    - Check Load balancers are using Standard SKU. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#957](https://github.com/Azure/PSRule.Rules.Azure/issues/957)
    - Check Load Balancers are configured with zone-redundancy. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#927](https://github.com/Azure/PSRule.Rules.Azure/issues/927)
- Engineering:
  - Bump PSRule dependency to v1.7.2. [#951](https://github.com/Azure/PSRule.Rules.Azure/issues/951)
  - Automated update of availability zone information in providers.json. [#907](https://github.com/Azure/PSRule.Rules.Azure/issues/907)
  - Increased test coverage of rule reasons. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#960](https://github.com/Azure/PSRule.Rules.Azure/issues/960)
- Bug fixes:
  - Fixed export of in-flight AKS related subnets for kubenet clusters. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#920](https://github.com/Azure/PSRule.Rules.Azure/issues/920)
  - Fixed plan instance count is not applicable to Elastic Premium plans. [#946](https://github.com/Azure/PSRule.Rules.Azure/issues/946)
  - Fixed minimum App Service Plan fails Elastic Premium plans. [#945](https://github.com/Azure/PSRule.Rules.Azure/issues/945)
  - Fixed App Service Plan should include PremiumV3 plan. [#944](https://github.com/Azure/PSRule.Rules.Azure/issues/944)
  - Fixed Azure.VM.NICAttached with private endpoints. [#932](https://github.com/Azure/PSRule.Rules.Azure/issues/932)
  - Fixed Bicep CLI fails with unexpected end of content. [#889](https://github.com/Azure/PSRule.Rules.Azure/issues/889)
  - Fixed incomplete reason message for `Azure.Storage.MinTLS`. [#971](https://github.com/Azure/PSRule.Rules.Azure/issues/971)
  - Fixed false positive of `Azure.Storage.UseReplication` with large file storage. [#965](https://github.com/Azure/PSRule.Rules.Azure/issues/965)

What's changed since pre-release v1.8.0-B2109060:

- No additional changes.

## v1.8.0-B2109086 (pre-release)

What's changed since pre-release v1.8.0-B2109060:

- New rules:
  - Load Balancer:
    - Check Load balancers are using Standard SKU. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#957](https://github.com/Azure/PSRule.Rules.Azure/issues/957)
- Engineering:
  - Increased test coverage of rule reasons. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#960](https://github.com/Azure/PSRule.Rules.Azure/issues/960)
- Bug fixes:
  - Fixed Bicep CLI fails with unexpected end of content. [#889](https://github.com/Azure/PSRule.Rules.Azure/issues/889)
  - Fixed incomplete reason message for `Azure.Storage.MinTLS`. [#971](https://github.com/Azure/PSRule.Rules.Azure/issues/971)
  - Fixed false positive of `Azure.Storage.UseReplication` with large file storage. [#965](https://github.com/Azure/PSRule.Rules.Azure/issues/965)

## v1.8.0-B2109060 (pre-release)

What's changed since pre-release v1.8.0-B2109046:

- New features:
  - Added `Azure.GA_2021_09` baseline. [#961](https://github.com/Azure/PSRule.Rules.Azure/issues/961)
    - Includes rules released before or during September 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_06` as obsolete.
- New rules:
  - Load Balancer:
    - Check Load Balancers are configured with zone-redundancy. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#927](https://github.com/Azure/PSRule.Rules.Azure/issues/927)

## v1.8.0-B2109046 (pre-release)

What's changed since pre-release v1.8.0-B2109020:

- New rules:
  - Application Gateway:
    - Check App Gateways should use availability zones when available. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#928](https://github.com/Azure/PSRule.Rules.Azure/issues/928)
  - Cosmos DB:
    - Check DB account names meet naming requirements. [#954](https://github.com/Azure/PSRule.Rules.Azure/issues/954)
    - Check DB accounts use Azure AD identities for resource management operations. [#953](https://github.com/Azure/PSRule.Rules.Azure/issues/953)
- Bug fixes:
  - Fixed plan instance count is not applicable to Elastic Premium plans. [#946](https://github.com/Azure/PSRule.Rules.Azure/issues/946)
  - Fixed minimum App Service Plan fails Elastic Premium plans. [#945](https://github.com/Azure/PSRule.Rules.Azure/issues/945)
  - Fixed App Service Plan should include PremiumV3 plan. [#944](https://github.com/Azure/PSRule.Rules.Azure/issues/944)
  - Fixed Azure.VM.NICAttached with private endpoints. [#932](https://github.com/Azure/PSRule.Rules.Azure/issues/932)
- Engineering:
  - Bump PSRule dependency to v1.7.2. [#951](https://github.com/Azure/PSRule.Rules.Azure/issues/951)

## v1.8.0-B2109020 (pre-release)

What's changed since pre-release v1.8.0-B2108026:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters have control plane audit logs enabled. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#882](https://github.com/Azure/PSRule.Rules.Azure/issues/882)
    - Check clusters have control plane diagnostics enabled. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#922](https://github.com/Azure/PSRule.Rules.Azure/issues/922)
- Engineering:
  - Bump PSRule dependency to v1.7.0. [#938](https://github.com/Azure/PSRule.Rules.Azure/issues/938)

## v1.8.0-B2108026 (pre-release)

What's changed since pre-release v1.8.0-B2108013:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use Container Insights for monitoring workloads. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#881](https://github.com/Azure/PSRule.Rules.Azure/issues/881)
- Bug fixes:
  - Fixed export of in-flight AKS related subnets for kubenet clusters. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#920](https://github.com/Azure/PSRule.Rules.Azure/issues/920)

## v1.8.0-B2108013 (pre-release)

What's changed since v1.7.0:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use availability zones when available. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#880](https://github.com/Azure/PSRule.Rules.Azure/issues/880)
- Engineering:
  - Bump PSRule dependency to v1.6.1. [#913](https://github.com/Azure/PSRule.Rules.Azure/issues/913)
  - Automated update of availability zone information in providers.json. [#907](https://github.com/Azure/PSRule.Rules.Azure/issues/907)

## v1.7.0

What's changed since v1.6.0:

- New rules:
  - All resources:
    - Check template parameter files use metadata links. [#846](https://github.com/Azure/PSRule.Rules.Azure/issues/846)
      - Configure the `AZURE_PARAMETER_FILE_METADATA_LINK` option to enable this rule.
    - Check template files use a recent schema. [#845](https://github.com/Azure/PSRule.Rules.Azure/issues/845)
    - Check template files use a https schema scheme. [#894](https://github.com/Azure/PSRule.Rules.Azure/issues/894)
    - Check template parameter files use a https schema scheme. [#894](https://github.com/Azure/PSRule.Rules.Azure/issues/894)
    - Check template parameters set a value. [#896](https://github.com/Azure/PSRule.Rules.Azure/issues/896)
    - Check template parameters use a valid secret reference. [#897](https://github.com/Azure/PSRule.Rules.Azure/issues/897)
  - Azure Kubernetes Service:
    - Check clusters using Azure CNI should use large subnets. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#273](https://github.com/Azure/PSRule.Rules.Azure/issues/273)
    - Check clusters use auto-scale node pools. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#218](https://github.com/Azure/PSRule.Rules.Azure/issues/218)
      - By default, a minimum of a `/23` subnet is required.
      - Configure `AZURE_AKS_CNI_MINIMUM_CLUSTER_SUBNET_SIZE` to change the default minimum subnet size.
  - Storage Account:
    - Check Storage Accounts only accept explicitly allowed network traffic. [#884](https://github.com/Azure/PSRule.Rules.Azure/issues/884)
- Updated rules:
  - Virtual Network:
    - Excluded `AzureFirewallManagementSubnet` from `Azure.VNET.UseNSGs`. [#869](https://github.com/Azure/PSRule.Rules.Azure/issues/869)
- General improvements:
  - Added version information to bicep compilation exceptions. [#903](https://github.com/Azure/PSRule.Rules.Azure/issues/903)
- Engineering:
  - Bump PSRule dependency to v1.6.0. [#871](https://github.com/Azure/PSRule.Rules.Azure/issues/871)
- Bug fixes:
  - Fixed DateTimeAdd function and tests within timezones with DST. [#891](https://github.com/Azure/PSRule.Rules.Azure/issues/891)
  - Fixed `Azure.Template.ParameterValue` failing on empty value. [#901](https://github.com/Azure/PSRule.Rules.Azure/issues/901)

What's changed since pre-release v1.7.0-B2108059:

- No additional changes.

## v1.7.0-B2108059 (pre-release)

What's changed since pre-release v1.7.0-B2108049:

- General improvements:
  - Added version information to bicep compilation exceptions. [#903](https://github.com/Azure/PSRule.Rules.Azure/issues/903)
- Bug fixes:
  - Fixed `Azure.Template.ParameterValue` failing on empty value. [#901](https://github.com/Azure/PSRule.Rules.Azure/issues/901)

## v1.7.0-B2108049 (pre-release)

What's changed since pre-release v1.7.0-B2108040:

- New rules:
  - All resources:
    - Check template files use a recent schema. [#845](https://github.com/Azure/PSRule.Rules.Azure/issues/845)
    - Check template files use a https schema scheme. [#894](https://github.com/Azure/PSRule.Rules.Azure/issues/894)
    - Check template parameter files use a https schema scheme. [#894](https://github.com/Azure/PSRule.Rules.Azure/issues/894)
    - Check template parameters set a value. [#896](https://github.com/Azure/PSRule.Rules.Azure/issues/896)
    - Check template parameters use a valid secret reference. [#897](https://github.com/Azure/PSRule.Rules.Azure/issues/897)
- Bug fixes:
  - Fixed DateTimeAdd function and tests within timezones with DST. [#891](https://github.com/Azure/PSRule.Rules.Azure/issues/891)

## v1.7.0-B2108040 (pre-release)

What's changed since pre-release v1.7.0-B2108020:

- New rules:
  - All resources:
    - Check template parameter files use metadata links. [#846](https://github.com/Azure/PSRule.Rules.Azure/issues/846)
      - Configure the `AZURE_PARAMETER_FILE_METADATA_LINK` option to enable this rule.
  - Azure Kubernetes Service:
    - Check clusters using Azure CNI should use large subnets. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#273](https://github.com/Azure/PSRule.Rules.Azure/issues/273)
      - By default, a minimum of a `/23` subnet is required.
      - Configure `AZURE_AKS_CNI_MINIMUM_CLUSTER_SUBNET_SIZE` to change the default minimum subnet size.
  - Storage Account:
    - Check Storage Accounts only accept explicitly allowed network traffic. [#884](https://github.com/Azure/PSRule.Rules.Azure/issues/884)

## v1.7.0-B2108020 (pre-release)

What's changed since v1.6.0:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use auto-scale node pools. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#218](https://github.com/Azure/PSRule.Rules.Azure/issues/218)
- Updated rules:
  - Virtual Network:
    - Excluded `AzureFirewallManagementSubnet` from `Azure.VNET.UseNSGs`. [#869](https://github.com/Azure/PSRule.Rules.Azure/issues/869)
- Engineering:
  - Bump PSRule dependency to v1.6.0. [#871](https://github.com/Azure/PSRule.Rules.Azure/issues/871)

## v1.6.0

What's changed since v1.5.1:

- New features:
  - **Experimental**: Added support for expansion from Bicep source files. [#848](https://github.com/Azure/PSRule.Rules.Azure/issues/848) [#670](https://github.com/Azure/PSRule.Rules.Azure/issues/670) [#858](https://github.com/Azure/PSRule.Rules.Azure/issues/858)
    - Bicep support is currently experimental.
    - To opt-in set the `AZURE_BICEP_FILE_EXPANSION` configuration to `true`.
    - For more information see [Using Bicep](https://azure.github.io/PSRule.Rules.Azure/using-bicep/).
- New rules:
  - Application Gateways:
    - Check Application Gateways publish endpoints by HTTPS. [#841](https://github.com/Azure/PSRule.Rules.Azure/issues/841)
- Engineering:
  - Bump PSRule dependency to v1.5.0. [#832](https://github.com/Azure/PSRule.Rules.Azure/issues/832)
  - Migration of Pester v4 tests to Pester v5. Thanks [@ArmaanMcleod](https://github.com/ArmaanMcleod). [#395](https://github.com/Azure/PSRule.Rules.Azure/issues/395)

What's changed since pre-release v1.6.0-B2108038:

- Bug fixes:
  - Fixed Bicep expand creates deadlock and times out. [#863](https://github.com/Azure/PSRule.Rules.Azure/issues/863)

## v1.6.0-B2108038 (pre-release)

What's changed since pre-release v1.6.0-B2108023:

- Bug fixes:
  - Fixed Bicep expand hangs analysis. [#858](https://github.com/Azure/PSRule.Rules.Azure/issues/858)

## v1.6.0-B2108023 (pre-release)

What's changed since pre-release v1.6.0-B2107028:

- New features:
  - **Experimental**: Added support for expansion from Bicep source files. [#848](https://github.com/Azure/PSRule.Rules.Azure/issues/848) [#670](https://github.com/Azure/PSRule.Rules.Azure/issues/670)
    - Bicep support is currently experimental.
    - To opt-in set the `AZURE_BICEP_FILE_EXPANSION` configuration to `true`.
    - For more information see [Using Bicep](https://azure.github.io/PSRule.Rules.Azure/using-bicep/).

## v1.6.0-B2107028 (pre-release)

What's changed since v1.5.1:

- New rules:
  - Application Gateways:
    - Check Application Gateways publish endpoints by HTTPS. [#841](https://github.com/Azure/PSRule.Rules.Azure/issues/841)
- Engineering:
  - Bump PSRule dependency to v1.5.0. [#832](https://github.com/Azure/PSRule.Rules.Azure/issues/832)

## v1.5.1

What's changed since v1.5.0:

- Bug fixes:
  - Fixed rule does not detect more restrictive NSG rules. [#831](https://github.com/Azure/PSRule.Rules.Azure/issues/831)

## v1.5.0

What's changed since v1.4.1:

- New features:
  - Added `Azure.GA_2021_06` baseline. [#822](https://github.com/Azure/PSRule.Rules.Azure/issues/822)
    - Includes rules released before or during June 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_03` as obsolete.
- New rules:
  - Application Insights:
    - Check App Insights resources use workspace-based configuration. [#813](https://github.com/Azure/PSRule.Rules.Azure/issues/813)
    - Check App Insights resources meet naming requirements. [#814](https://github.com/Azure/PSRule.Rules.Azure/issues/814)
- General improvements:
  - Exclude not applicable rules for templates generated with Bicep and PSArm. [#815](https://github.com/Azure/PSRule.Rules.Azure/issues/815)
  - Updated rule help to use docs pages for online version. [#824](https://github.com/Azure/PSRule.Rules.Azure/issues/824)
- Engineering:
  - Bump PSRule dependency to v1.4.0. [#823](https://github.com/Azure/PSRule.Rules.Azure/issues/823)
  - Bump YamlDotNet dependency to v11.2.1. [#821](https://github.com/Azure/PSRule.Rules.Azure/pull/821)
  - Migrate project to Azure GitHub organization and updated links. [#800](https://github.com/Azure/PSRule.Rules.Azure/pull/800)
- Bug fixes:
  - Fixed detection of parameters and variables with line breaks. [#811](https://github.com/Azure/PSRule.Rules.Azure/issues/811)

What's changed since pre-release v1.5.0-B2107002:

- No additional changes.

## v1.5.0-B2107002 (pre-release)

What's changed since pre-release v1.5.0-B2106018:

- New features:
  - Added `Azure.GA_2021_06` baseline. [#822](https://github.com/Azure/PSRule.Rules.Azure/issues/822)
    - Includes rules released before or during June 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_03` as obsolete.
- General improvements:
  - Updated rule help to use docs pages for online version. [#824](https://github.com/Azure/PSRule.Rules.Azure/issues/824)
- Engineering:
  - Bump PSRule dependency to v1.4.0. [#823](https://github.com/Azure/PSRule.Rules.Azure/issues/823)
  - Bump YamlDotNet dependency to v11.2.1. [#821](https://github.com/Azure/PSRule.Rules.Azure/pull/821)

## v1.5.0-B2106018 (pre-release)

What's changed since v1.4.1:

- New rules:
  - Application Insights:
    - Check App Insights resources use workspace-based configuration. [#813](https://github.com/Azure/PSRule.Rules.Azure/issues/813)
    - Check App Insights resources meet naming requirements. [#814](https://github.com/Azure/PSRule.Rules.Azure/issues/814)
- General improvements:
  - Exclude not applicable rules for templates generated with Bicep and PSArm. [#815](https://github.com/Azure/PSRule.Rules.Azure/issues/815)
- Engineering:
  - Bump YamlDotNet dependency to v11.2.0. [#801](https://github.com/Azure/PSRule.Rules.Azure/pull/801)
  - Migrate project to Azure GitHub organization and updated links. [#800](https://github.com/Azure/PSRule.Rules.Azure/pull/800)
- Bug fixes:
  - Fixed detection of parameters and variables with line breaks. [#811](https://github.com/Azure/PSRule.Rules.Azure/issues/811)

## v1.4.1

What's changed since v1.4.0:

- Bug fixes:
  - Fixed boolean string conversion case. [#793](https://github.com/Azure/PSRule.Rules.Azure/issues/793)
  - Fixed case sensitive property matching. [#794](https://github.com/Azure/PSRule.Rules.Azure/issues/794)
  - Fixed automatic expansion of template parameter files. [#796](https://github.com/Azure/PSRule.Rules.Azure/issues/796)
    - Template parameter files are not automatically expanded by default.
    - To enable this, set the `AZURE_PARAMETER_FILE_EXPANSION` configuration option.

## v1.4.0

What's changed since v1.3.2:

- New features:
  - Automatically expand template from parameter files for analysis. [#772](https://github.com/Azure/PSRule.Rules.Azure/issues/772)
    - Previously templates needed to be exported with `Export-AzRuleTemplateData`.
    - To export template data automatically use PSRule cmdlets with `-Format File`.
- New rules:
  - Cognitive Search:
    - Check search services meet index SLA replica requirement. [#761](https://github.com/Azure/PSRule.Rules.Azure/issues/761)
    - Check search services meet query SLA replica requirement. [#762](https://github.com/Azure/PSRule.Rules.Azure/issues/762)
    - Check search services meet naming requirements. [#763](https://github.com/Azure/PSRule.Rules.Azure/issues/763)
    - Check search services use a minimum SKU. [#764](https://github.com/Azure/PSRule.Rules.Azure/issues/764)
    - Check search services use managed identities. [#765](https://github.com/Azure/PSRule.Rules.Azure/issues/765)
  - Azure Kubernetes Service:
    - Check clusters use AKS-managed Azure AD integration. [#436](https://github.com/Azure/PSRule.Rules.Azure/issues/436)
    - Check clusters have local account disabled (preview). [#786](https://github.com/Azure/PSRule.Rules.Azure/issues/786)
    - Check clusters have an auto-upgrade channel set (preview). [#787](https://github.com/Azure/PSRule.Rules.Azure/issues/787)
    - Check clusters limit access network access to the API server. [#788](https://github.com/Azure/PSRule.Rules.Azure/issues/788)
    - Check clusters used Azure RBAC for Kubernetes authorization. [#789](https://github.com/Azure/PSRule.Rules.Azure/issues/789)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.20.5. [#767](https://github.com/Azure/PSRule.Rules.Azure/issues/767)
- General improvements:
  - Automatically nest template sub-resources for analysis. [#746](https://github.com/Azure/PSRule.Rules.Azure/issues/746)
    - Sub-resources such as diagnostic logs or configurations are automatically nested.
    - Automatic nesting a resource requires:
      - The parent resource is defined in the same template.
      - The sub-resource depends on the parent resource.
  - Added support for source location references to template files. [#781](https://github.com/Azure/PSRule.Rules.Azure/issues/781)
    - Output includes source location to resources exported from a templates.
- Bug fixes:
  - Fixed string index parsing in expressions with whitespace. [#775](https://github.com/Azure/PSRule.Rules.Azure/issues/775)
  - Fixed base for DateTimeAdd is not a valid string. [#777](https://github.com/Azure/PSRule.Rules.Azure/issues/777)
- Engineering:
  - Added source link to project. [#783](https://github.com/Azure/PSRule.Rules.Azure/issues/783)

What's changed since pre-release v1.4.0-B2105057:

- No additional changes.

## v1.4.0-B2105057 (pre-release)

What's changed since pre-release v1.4.0-B2105050:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use AKS-managed Azure AD integration. [#436](https://github.com/Azure/PSRule.Rules.Azure/issues/436)
    - Check clusters have local account disabled (preview). [#786](https://github.com/Azure/PSRule.Rules.Azure/issues/786)
    - Check clusters have an auto-upgrade channel set (preview). [#787](https://github.com/Azure/PSRule.Rules.Azure/issues/787)
    - Check clusters limit access network access to the API server. [#788](https://github.com/Azure/PSRule.Rules.Azure/issues/788)
    - Check clusters used Azure RBAC for Kubernetes authorization. [#789](https://github.com/Azure/PSRule.Rules.Azure/issues/789)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.20.5. [#767](https://github.com/Azure/PSRule.Rules.Azure/issues/767)
- Engineering:
  - Added source link to project. [#783](https://github.com/Azure/PSRule.Rules.Azure/issues/783)

## v1.4.0-B2105050 (pre-release)

What's changed since pre-release v1.4.0-B2105044:

- General improvements:
  - Added support for source location references to template files. [#781](https://github.com/Azure/PSRule.Rules.Azure/issues/781)
    - Output includes source location to resources exported from a templates.

## v1.4.0-B2105044 (pre-release)

What's changed since pre-release v1.4.0-B2105027:

- New features:
  - Automatically expand template from parameter files for analysis. [#772](https://github.com/Azure/PSRule.Rules.Azure/issues/772)
    - Previously templates needed to be exported with `Export-AzRuleTemplateData`.
    - To export template data automatically use PSRule cmdlets with `-Format File`.
- Bug fixes:
  - Fixed string index parsing in expressions with whitespace. [#775](https://github.com/Azure/PSRule.Rules.Azure/issues/775)
  - Fixed base for DateTimeAdd is not a valid string. [#777](https://github.com/Azure/PSRule.Rules.Azure/issues/777)

## v1.4.0-B2105027 (pre-release)

What's changed since pre-release v1.4.0-B2105020:

- New rules:
  - Cognitive Search:
    - Check search services meet index SLA replica requirement. [#761](https://github.com/Azure/PSRule.Rules.Azure/issues/761)
    - Check search services meet query SLA replica requirement. [#762](https://github.com/Azure/PSRule.Rules.Azure/issues/762)
    - Check search services meet naming requirements. [#763](https://github.com/Azure/PSRule.Rules.Azure/issues/763)
    - Check search services use a minimum SKU. [#764](https://github.com/Azure/PSRule.Rules.Azure/issues/764)
    - Check search services use managed identities. [#765](https://github.com/Azure/PSRule.Rules.Azure/issues/765)

## v1.4.0-B2105020 (pre-release)

What's changed since v1.3.2:

- General improvements:
  - Automatically nest template sub-resources for analysis. [#746](https://github.com/Azure/PSRule.Rules.Azure/issues/746)
    - Sub-resources such as diagnostic logs or configurations are automatically nested.
    - Automatic nesting a resource requires:
      - The parent resource is defined in the same template.
      - The sub-resource depends on the parent resource.

## v1.3.2

What's changed since v1.3.1:

- Bug fixes:
  - Fixed rule reason reported the parameter inputObject is null. [#753](https://github.com/Azure/PSRule.Rules.Azure/issues/753)

## v1.3.1

What's changed since v1.3.0:

- Engineering:
  - Bump PSRule dependency to v1.3.0. [#749](https://github.com/Azure/PSRule.Rules.Azure/issues/749)
  - Bump YamlDotNet dependency to v11.1.1. [#742](https://github.com/Azure/PSRule.Rules.Azure/issues/742)

## v1.3.0

What's changed since v1.2.1:

- New rules:
  - Policy:
    - Check policy assignment display name and description are set. [#725](https://github.com/Azure/PSRule.Rules.Azure/issues/725)
    - Check policy assignment assigned by metadata is set. [#726](https://github.com/Azure/PSRule.Rules.Azure/issues/726)
    - Check policy exemption display name and description are set. [#723](https://github.com/Azure/PSRule.Rules.Azure/issues/723)
    - Check policy waiver exemptions have an expiry date set. [#724](https://github.com/Azure/PSRule.Rules.Azure/issues/724)
- Removed rules:
  - Storage:
    - Remove `Azure.Storage.UseEncryption` as Storage Service Encryption (SSE) is always on. [#630](https://github.com/Azure/PSRule.Rules.Azure/issues/630)
      - SSE is on by default and can not be disabled.
- General improvements:
  - Additional metadata added in parameter files is passed through with `Get-AzRuleTemplateLink`. [#706](https://github.com/Azure/PSRule.Rules.Azure/issues/706)
  - Improved binding support for File inputs. [#480](https://github.com/Azure/PSRule.Rules.Azure/issues/480)
    - Template and parameter file names now return a relative path instead of full path.
  - Added API version for each module resource. [#729](https://github.com/Azure/PSRule.Rules.Azure/issues/729)
- Engineering:
  - Clean up depreciated warning message for configuration option `azureAllowedRegions`. [#737](https://github.com/Azure/PSRule.Rules.Azure/issues/737)
  - Clean up depreciated warning message for configuration option `minAKSVersion`. [#738](https://github.com/Azure/PSRule.Rules.Azure/issues/738)
  - Bump PSRule dependency to v1.2.0. [#713](https://github.com/Azure/PSRule.Rules.Azure/issues/713)
- Bug fixes:
  - Fixed could not load file or assembly YamlDotNet. [#741](https://github.com/Azure/PSRule.Rules.Azure/issues/741)
    - This fix pins the PSRule version to v1.2.0 until the next stable release of PSRule for Azure.

What's changed since pre-release v1.3.0-B2104040:

- No additional changes.

## v1.3.0-B2104040 (pre-release)

What's changed since pre-release v1.3.0-B2104034:

- Bug fixes:
  - Fixed could not load file or assembly YamlDotNet. [#741](https://github.com/Azure/PSRule.Rules.Azure/issues/741)
    - This fix pins the PSRule version to v1.2.0 until the next stable release of PSRule for Azure.

## v1.3.0-B2104034 (pre-release)

What's changed since pre-release v1.3.0-B2104023:

- New rules:
  - Policy:
    - Check policy assignment display name and description are set. [#725](https://github.com/Azure/PSRule.Rules.Azure/issues/725)
    - Check policy assignment assigned by metadata is set. [#726](https://github.com/Azure/PSRule.Rules.Azure/issues/726)
    - Check policy exemption display name and description are set. [#723](https://github.com/Azure/PSRule.Rules.Azure/issues/723)
    - Check policy waiver exemptions have an expiry date set. [#724](https://github.com/Azure/PSRule.Rules.Azure/issues/724)
- Engineering:
  - Clean up depreciated warning message for configuration option `azureAllowedRegions`. [#737](https://github.com/Azure/PSRule.Rules.Azure/issues/737)
  - Clean up depreciated warning message for configuration option `minAKSVersion`. [#738](https://github.com/Azure/PSRule.Rules.Azure/issues/738)

## v1.3.0-B2104023 (pre-release)

What's changed since pre-release v1.3.0-B2104013:

- General improvements:
  - Improved binding support for File inputs. [#480](https://github.com/Azure/PSRule.Rules.Azure/issues/480)
    - Template and parameter file names now return a relative path instead of full path.
  - Added API version for each module resource. [#729](https://github.com/Azure/PSRule.Rules.Azure/issues/729)

## v1.3.0-B2104013 (pre-release)

What's changed since pre-release v1.3.0-B2103007:

- Engineering:
  - Bump PSRule dependency to v1.2.0. [#713](https://github.com/Azure/PSRule.Rules.Azure/issues/713)
- Bug fixes:
  - Fixed export not expanding nested deployments. [#715](https://github.com/Azure/PSRule.Rules.Azure/issues/715)

## v1.3.0-B2103007 (pre-release)

What's changed since v1.2.0:

- Removed rules:
  - Storage:
    - Remove `Azure.Storage.UseEncryption` as Storage Service Encryption (SSE) is always on. [#630](https://github.com/Azure/PSRule.Rules.Azure/issues/630)
      - SSE is on by default and can not be disabled.
- General improvements:
  - Additional metadata added in parameter files is passed through with `Get-AzRuleTemplateLink`. [#706](https://github.com/Azure/PSRule.Rules.Azure/issues/706)

## v1.2.1

What's changed since v1.2.0:

- Bug fixes:
  - Fixed export not expanding nested deployments. [#715](https://github.com/Azure/PSRule.Rules.Azure/issues/715)

## v1.2.0

What's changed since v1.1.4:

- New features:
  - Added `Azure.GA_2021_03` baseline. [#673](https://github.com/Azure/PSRule.Rules.Azure/issues/673)
    - Includes rules released before or during March 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2020_12` as obsolete.
- New rules:
  - Key Vault:
    - Check vaults, keys, and secrets meet name requirements. [#646](https://github.com/Azure/PSRule.Rules.Azure/issues/646)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.19.7. [#696](https://github.com/Azure/PSRule.Rules.Azure/issues/696)
- General improvements:
  - Added support for user defined functions in templates. [#682](https://github.com/Azure/PSRule.Rules.Azure/issues/682)
- Engineering:
  - Bump PSRule dependency to v1.1.0. [#692](https://github.com/Azure/PSRule.Rules.Azure/issues/692)

What's changed since pre-release v1.2.0-B2103044:

- No additional changes.

## v1.2.0-B2103044 (pre-release)

What's changed since pre-release v1.2.0-B2103032:

- New features:
  - Added `Azure.GA_2021_03` baseline. [#673](https://github.com/Azure/PSRule.Rules.Azure/issues/673)
    - Includes rules released before or during March 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2020_12` as obsolete.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.19.7. [#696](https://github.com/Azure/PSRule.Rules.Azure/issues/696)

## v1.2.0-B2103032 (pre-release)

What's changed since pre-release v1.2.0-B2103024:

- New rules:
  - Key Vault:
    - Check vaults, keys, and secrets meet name requirements. [#646](https://github.com/Azure/PSRule.Rules.Azure/issues/646)
- Engineering:
  - Bump PSRule dependency to v1.1.0. [#692](https://github.com/Azure/PSRule.Rules.Azure/issues/692)

## v1.2.0-B2103024 (pre-release)

What's changed since v1.1.4:

- General improvements:
  - Added support for user defined functions in templates. [#682](https://github.com/Azure/PSRule.Rules.Azure/issues/682)

## v1.1.4

What's changed since v1.1.3:

- Bug fixes:
  - Fixed handling of literal index with copyIndex function. [#686](https://github.com/Azure/PSRule.Rules.Azure/issues/686)
  - Fixed handling of inner scoped nested deployments. [#687](https://github.com/Azure/PSRule.Rules.Azure/issues/687)

## v1.1.3

What's changed since v1.1.2:

- Bug fixes:
  - Fixed parsing of property names for functions across multiple lines. [#683](https://github.com/Azure/PSRule.Rules.Azure/issues/683)

## v1.1.2

What's changed since v1.1.1:

- Bug fixes:
  - Fixed copy peer property resolve. [#677](https://github.com/Azure/PSRule.Rules.Azure/issues/677)
  - Fixed partial resource group or subscription object not populating. [#678](https://github.com/Azure/PSRule.Rules.Azure/issues/678)
  - Fixed lazy loading of environment and resource providers. [#679](https://github.com/Azure/PSRule.Rules.Azure/issues/679)

## v1.1.1

What's changed since v1.1.0:

- Bug fixes:
  - Fixed support for parameter file schemas. [#674](https://github.com/Azure/PSRule.Rules.Azure/issues/674)

## v1.1.0

What's changed since v1.0.0:

- New features:
  - Exporting template with `Export-AzRuleTemplateData` supports custom resource group and subscription. [#651](https://github.com/Azure/PSRule.Rules.Azure/issues/651)
    - Subscription and resource group used for deployment can be specified instead of using defaults.
    - `ResourceGroupName` parameter of `Export-AzRuleTemplateData` has been renamed to `ResourceGroup`.
    - Added a parameter alias for `ResourceGroupName` on `Export-AzRuleTemplateData`.
- New rules:
  - All resources:
    - Check template parameters are defined. [#631](https://github.com/Azure/PSRule.Rules.Azure/issues/631)
    - Check location parameter is type string. [#632](https://github.com/Azure/PSRule.Rules.Azure/issues/632)
    - Check template parameter `minValue` and `maxValue` constraints are valid. [#637](https://github.com/Azure/PSRule.Rules.Azure/issues/637)
    - Check template resources do not use hard coded locations. [#633](https://github.com/Azure/PSRule.Rules.Azure/issues/633)
    - Check resource group location not referenced instead of location parameter. [#634](https://github.com/Azure/PSRule.Rules.Azure/issues/634)
    - Check increased debug detail is disabled for nested deployments. [#638](https://github.com/Azure/PSRule.Rules.Azure/issues/638)
- General improvements:
  - Added support for matching template by name. [#661](https://github.com/Azure/PSRule.Rules.Azure/issues/661)
    - `Get-AzRuleTemplateLink` discovers `<templateName>.json` from `<templateName>.parameters.json`.
- Engineering:
  - Bump PSRule dependency to v1.0.3. [#648](https://github.com/Azure/PSRule.Rules.Azure/issues/648)
- Bug fixes:
  - Fixed `Azure.VM.ADE` to limit rule to exports only. [#644](https://github.com/Azure/PSRule.Rules.Azure/issues/644)
  - Fixed `if` condition values evaluation order. [#652](https://github.com/Azure/PSRule.Rules.Azure/issues/652)
  - Fixed handling of `int` parameters with large values. [#653](https://github.com/Azure/PSRule.Rules.Azure/issues/653)
  - Fixed handling of expressions split over multiple lines. [#654](https://github.com/Azure/PSRule.Rules.Azure/issues/654)
  - Fixed handling of bool parameter values within logical expressions. [#655](https://github.com/Azure/PSRule.Rules.Azure/issues/655)
  - Fixed copy loop value does not fall within the expected range. [#664](https://github.com/Azure/PSRule.Rules.Azure/issues/664)
  - Fixed template comparison functions handling of large integer values. [#666](https://github.com/Azure/PSRule.Rules.Azure/issues/666)
  - Fixed handling of `createArray` function with no arguments. [#667](https://github.com/Azure/PSRule.Rules.Azure/issues/667)

What's changed since pre-release v1.1.0-B2102034:

- No additional changes.

## v1.1.0-B2102034 (pre-release)

What's changed since pre-release v1.1.0-B2102023:

- General improvements:
  - Added support for matching template by name. [#661](https://github.com/Azure/PSRule.Rules.Azure/issues/661)
    - `Get-AzRuleTemplateLink` discovers `<templateName>.json` from `<templateName>.parameters.json`.
- Bug fixes:
  - Fixed copy loop value does not fall within the expected range. [#664](https://github.com/Azure/PSRule.Rules.Azure/issues/664)
  - Fixed template comparison functions handling of large integer values. [#666](https://github.com/Azure/PSRule.Rules.Azure/issues/666)
  - Fixed handling of `createArray` function with no arguments. [#667](https://github.com/Azure/PSRule.Rules.Azure/issues/667)

## v1.1.0-B2102023 (pre-release)

What's changed since pre-release v1.1.0-B2102015:

- New features:
  - Exporting template with `Export-AzRuleTemplateData` supports custom resource group and subscription. [#651](https://github.com/Azure/PSRule.Rules.Azure/issues/651)
    - Subscription and resource group used for deployment can be specified instead of using defaults.
    - `ResourceGroupName` parameter of `Export-AzRuleTemplateData` has been renamed to `ResourceGroup`.
    - Added a parameter alias for `ResourceGroupName` on `Export-AzRuleTemplateData`.

## v1.1.0-B2102015 (pre-release)

What's changed since pre-release v1.1.0-B2102010:

- Bug fixes:
  - Fixed `if` condition values evaluation order. [#652](https://github.com/Azure/PSRule.Rules.Azure/issues/652)
  - Fixed handling of `int` parameters with large values. [#653](https://github.com/Azure/PSRule.Rules.Azure/issues/653)
  - Fixed handling of expressions split over multiple lines. [#654](https://github.com/Azure/PSRule.Rules.Azure/issues/654)
  - Fixed handling of bool parameter values within logical expressions. [#655](https://github.com/Azure/PSRule.Rules.Azure/issues/655)

## v1.1.0-B2102010 (pre-release)

What's changed since pre-release v1.1.0-B2102001:

- Engineering:
  - Bump PSRule dependency to v1.0.3. [#648](https://github.com/Azure/PSRule.Rules.Azure/issues/648)
- Bug fixes:
  - Fixed `Azure.VM.ADE` to limit rule to exports only. [#644](https://github.com/Azure/PSRule.Rules.Azure/issues/644)

## v1.1.0-B2102001 (pre-release)

What's changed since v1.0.0:

- New rules:
  - All resources:
    - Check template parameters are defined. [#631](https://github.com/Azure/PSRule.Rules.Azure/issues/631)
    - Check location parameter is type string. [#632](https://github.com/Azure/PSRule.Rules.Azure/issues/632)
    - Check template parameter `minValue` and `maxValue` constraints are valid. [#637](https://github.com/Azure/PSRule.Rules.Azure/issues/637)
    - Check template resources do not use hard coded locations. [#633](https://github.com/Azure/PSRule.Rules.Azure/issues/633)
    - Check resource group location not referenced instead of location parameter. [#634](https://github.com/Azure/PSRule.Rules.Azure/issues/634)
    - Check increased debug detail is disabled for nested deployments. [#638](https://github.com/Azure/PSRule.Rules.Azure/issues/638)
- Engineering:
  - Bump PSRule dependency to v1.0.2. [#635](https://github.com/Azure/PSRule.Rules.Azure/issues/635)

## v1.0.0

What's changed since v0.19.0:

- New rules:
  - All resources:
    - Check parameter default value type matches type. [#311](https://github.com/Azure/PSRule.Rules.Azure/issues/311)
    - Check location parameter defaults to resource group. [#361](https://github.com/Azure/PSRule.Rules.Azure/issues/361)
  - Front Door:
    - Check Front Door uses a health probe for each backend pool. [#546](https://github.com/Azure/PSRule.Rules.Azure/issues/546)
    - Check Front Door uses a dedicated health probe path backend pools. [#547](https://github.com/Azure/PSRule.Rules.Azure/issues/547)
    - Check Front Door uses HEAD requests for backend health probes. [#613](https://github.com/Azure/PSRule.Rules.Azure/issues/613)
  - Service Fabric:
    - Check Service Fabric clusters use AAD client authentication. [#619](https://github.com/Azure/PSRule.Rules.Azure/issues/619)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.19.6. [#603](https://github.com/Azure/PSRule.Rules.Azure/issues/603)
- General improvements:
  - Renamed `Export-AzTemplateRuleData` to `Export-AzRuleTemplateData`. [#596](https://github.com/Azure/PSRule.Rules.Azure/issues/596)
    - New name `Export-AzRuleTemplateData` aligns with prefix of other cmdlets.
    - Use of `Export-AzTemplateRuleData` is now deprecated and will be removed in the next major version.
    - Added alias to allow `Export-AzTemplateRuleData` to continue to be used.
    - Using `Export-AzTemplateRuleData` returns a deprecation warning.
  - Added support for `environment` template function. [#517](https://github.com/Azure/PSRule.Rules.Azure/issues/517)
- Engineering:
  - Bump PSRule dependency to v1.0.1. [#611](https://github.com/Azure/PSRule.Rules.Azure/issues/611)

What's changed since pre-release v1.0.0-B2101028:

- No additional changes.

## v1.0.0-B2101028 (pre-release)

What's changed since pre-release v1.0.0-B2101016:

- New rules:
  - All resources:
    - Check parameter default value type matches type. [#311](https://github.com/Azure/PSRule.Rules.Azure/issues/311)
- General improvements:
  - Renamed `Export-AzTemplateRuleData` to `Export-AzRuleTemplateData`. [#596](https://github.com/Azure/PSRule.Rules.Azure/issues/596)
    - New name `Export-AzRuleTemplateData` aligns with prefix of other cmdlets.
    - Use of `Export-AzTemplateRuleData` is now deprecated and will be removed in the next major version.
    - Added alias to allow `Export-AzTemplateRuleData` to continue to be used.
    - Using `Export-AzTemplateRuleData` returns a deprecation warning.

## v1.0.0-B2101016 (pre-release)

What's changed since pre-release v1.0.0-B2101006:

- New rules:
  - Service Fabric:
    - Check Service Fabric clusters use AAD client authentication. [#619](https://github.com/Azure/PSRule.Rules.Azure/issues/619)
- Bug fixes:
  - Fixed reason `Azure.FrontDoor.ProbePath` so the probe name is included. [#617](https://github.com/Azure/PSRule.Rules.Azure/issues/617)

## v1.0.0-B2101006 (pre-release)

What's changed since v0.19.0:

- New rules:
  - All resources:
    - Check location parameter defaults to resource group. [#361](https://github.com/Azure/PSRule.Rules.Azure/issues/361)
  - Front Door:
    - Check Front Door uses a health probe for each backend pool. [#546](https://github.com/Azure/PSRule.Rules.Azure/issues/546)
    - Check Front Door uses a dedicated health probe path backend pools. [#547](https://github.com/Azure/PSRule.Rules.Azure/issues/547)
    - Check Front Door uses HEAD requests for backend health probes. [#613](https://github.com/Azure/PSRule.Rules.Azure/issues/613)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to 1.19.6. [#603](https://github.com/Azure/PSRule.Rules.Azure/issues/603)
- General improvements:
  - Added support for `environment` template function. [#517](https://github.com/Azure/PSRule.Rules.Azure/issues/517)
- Engineering:
  - Bump PSRule dependency to v1.0.1. [#611](https://github.com/Azure/PSRule.Rules.Azure/issues/611)
- Redis Cache Enterprise
  - Check Redis Cache Enterprise uses minimum TLS 1.2 [1179](https://github.com/Azure/PSRule.Rules.Azure/issues/1179)

[troubleshooting guide]: troubleshooting.md
