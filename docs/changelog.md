---
discussion: false
link_users: true
description: See what is new and changed in the latest dot release of PSRule for Azure v1.
---

# Change log

See [upgrade notes][1] for helpful information when upgrading from previous versions.

[1]: upgrade-notes.md
[2]: deprecations.md

**Important notes**:

- Issue #741: `Could not load file or assembly YamlDotNet`.
  See [troubleshooting guide] for a workaround to this issue.
- The following configuration options are deprecated and have been replaced with alternative options.
  If you have these options configured, please update them to the replacement.
  Support for the old names will be removed in v2.
  See [upgrade notes][1] for more information.
  - `Azure_AKSMinimumVersion` is replaced with `AZURE_AKS_CLUSTER_MINIMUM_VERSION`.
  - `Azure_AKSNodeMinimumMaxPods` is replaced with `AZURE_AKS_POOL_MINIMUM_MAXPODS`.
  - `Azure_AllowedRegions` is replaced with `AZURE_RESOURCE_ALLOWED_LOCATIONS`.
  - `Azure_MinimumCertificateLifetime` is replaced with `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME`.
- The `SupportsTag` PowerShell function has been replaced with the `Azure.Resource.SupportsTags` selector.
  Update PowerShell rules to use the `Azure.Resource.SupportsTags` selector instead.
  Support for the `SupportsTag` function will be removed in v2.
  See [upgrade notes][1] for more information.

## Unreleased

## v1.47.0-B0033 (pre-release)

- New rules:
  - App Configuration:
    - Check that replica locations are in allowed regions by @BernieWhite.
      [#3441](https://github.com/Azure/PSRule.Rules.Azure/issues/3441)
  - Azure Cache for Redis:
    - Check for legacy Azure Cache for Redis instances by @BenjaminEngeset.
      [#3605](https://github.com/Azure/PSRule.Rules.Azure/issues/3605)
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_REDIS_CACHE_NAME_FORMAT`
        - `AZURE_REDIS_ENTERPRISE_NAME_FORMAT`
    - Added configured name format by @BernieWhite.
  - Azure Database for MySQL:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_MYSQL_SERVER_NAME_FORMAT`
  - Azure Database for PostgreSQL:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_POSTGRESQL_SERVER_NAME_FORMAT`
  - Azure Kubernetes Service:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_AKS_CLUSTER_NAME_FORMAT`
        - `AZURE_AKS_SYSTEM_POOL_NAME_FORMAT`
        - `AZURE_AKS_USER_POOL_NAME_FORMAT`
  - Container Apps:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_CONTAINER_APP_NAME_FORMAT`
        - `AZURE_CONTAINER_APP_ENVIRONMENT_NAME_FORMAT`
        - `AZURE_CONTAINER_APP_JOB_NAME_FORMAT`
  - Container Instance:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration option:
        - `AZURE_CONTAINER_INSTANCE_NAME_FORMAT`
  - Container Registry:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration option:
        - `AZURE_CONTAINER_REGISTRY_NAME_FORMAT`
  - Cosmos DB:
    - Check that Cosmos DB accounts have availability zones enabled by @BenjaminEngeset.
      [#3055](https://github.com/Azure/PSRule.Rules.Azure/issues/3055)
    - Check that MongoDB vCore clusters use Microsoft Entra ID authentication by @BenjaminEngeset.
      [#3369](https://github.com/Azure/PSRule.Rules.Azure/issues/3369)
    - Check that MongoDB vCore clusters have availability zones enabled by @BenjaminEngeset.
      [#3586](https://github.com/Azure/PSRule.Rules.Azure/issues/3586)
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration options:
        - `AZURE_COSMOS_CASSANDRA_NAME_FORMAT`
        - `AZURE_COSMOS_DATABASE_NAME_FORMAT`
        - `AZURE_COSMOS_GREMLIN_NAME_FORMAT`
        - `AZURE_COSMOS_MONGO_NAME_FORMAT`
        - `AZURE_COSMOS_NOSQL_NAME_FORMAT`
        - `AZURE_COSMOS_POSTGRESQL_NAME_FORMAT`
        - `AZURE_COSMOS_TABLE_NAME_FORMAT`
  - Data Explorer:
    - Check that public network access is disabled by @BenjaminEngeset.
      [#3114](https://github.com/Azure/PSRule.Rules.Azure/issues/3114)
  - Event Hub:
    - Check that zone redundancy is enabled for Event Hub namespaces in supported regions by @BenjaminEngeset.
      [#3029](https://github.com/Azure/PSRule.Rules.Azure/issues/3029)
  - Managed Instance for Apache Cassandra:
    - Check that Managed Instance for Apache Cassandra clusters have availability zones enabled by @BenjaminEngeset.
      [#3592](https://github.com/Azure/PSRule.Rules.Azure/issues/3592)
  - Managed Grafana:
    - Check that zone redundancy is enabled for Grafana workspaces in supported regions by @BenjaminEngeset.
      [#3294](https://github.com/Azure/PSRule.Rules.Azure/issues/3294)
  - Service Fabric:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration option:
        - `AZURE_SERVICE_FABRIC_CLUSTER_NAME_FORMAT`
        - `AZURE_SERVICE_FABRIC_MANAGED_CLUSTER_NAME_FORMAT`
  - SQL Database:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration option:
        - `AZURE_SQL_DATABASE_NAME_FORMAT`
        - `AZURE_SQL_SERVER_NAME_FORMAT`
        - `AZURE_SQL_ELASTIC_POOL_NAME_FORMAT`
        - `AZURE_SQL_JOB_AGENT_NAME_FORMAT`
  - SQL Managed Instance:
    - Check resources naming matches configured name format by @BernieWhite.
      [#3548](https://github.com/Azure/PSRule.Rules.Azure/issues/3548)
      - The name format can be configured by the following configuration option:
        - `AZURE_SQL_MI_NAME_FORMAT`
- Updated rules:
  - Application Gateway Policy:
    - Updated `Azure.AppGwWAF.RuleGroups` to use Microsoft Default Rule Set instead of legacy OWASP rule set by @BenjaminEngeset.
      [#3553](https://github.com/Azure/PSRule.Rules.Azure/issues/3553)
  - Cosmos DB:
    - Renamed `Azure.Cosmos.DisableLocalAuth` to `Azure.Cosmos.NoSQLLocalAuth` to reflect it applies only to NoSQL API by @BernieWhite.
      [#3576](https://github.com/Azure/PSRule.Rules.Azure/issues/3576)

## v1.46.0

What's changed since v1.45.2:

- New features:
  - **Experimental:** Added Well-Architected Framework - Security pillar Level 1 maturity baseline by @BernieWhite.
    [#3107](https://github.com/Azure/PSRule.Rules.Azure/issues/3107)
    [#3517](https://github.com/Azure/PSRule.Rules.Azure/issues/3517)
    - The `Azure.Pillar.Security.L1` baseline provides an initial set of rules aligned to the first level of maturity.
    - This is an experimental baseline and may change in future releases.
  - Added CSV download of rule list associated with each baseline by @BernieWhite.
    [#3511](https://github.com/Azure/PSRule.Rules.Azure/issues/3511)
  - Added September 2025 baselines `Azure.GA_2025_09` and `Azure.Preview_2025_09` by @BernieWhite.
    [#3539](https://github.com/Azure/PSRule.Rules.Azure/issues/3539)
    - Includes rules released before or during September 2025.
    - Marked `Azure.GA_2025_06` and `Azure.Preview_2025_06` baselines as obsolete.
- New rules:
  - Azure Cache for Redis:
    - Check that Entra ID is required for all authentication of cache instances by @BernieWhite.
      [#3113](https://github.com/Azure/PSRule.Rules.Azure/issues/3113)
  - Container Registry:
    - Check replica locations are within allowed regions by @BernieWhite
      [#3442](https://github.com/Azure/PSRule.Rules.Azure/issues/3442)
    - Check that export policy is disabled for registries by @BernieWhite
      [#3444](https://github.com/Azure/PSRule.Rules.Azure/issues/3444)
  - Storage Account:
    - Check that local authentication is disabled for storage accounts by @BernieWhite.
      [#3115](https://github.com/Azure/PSRule.Rules.Azure/issues/3115)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.32.7` as the minimum version by @BernieWhite.
      [#3541](https://github.com/Azure/PSRule.Rules.Azure/issues/3541)
  - Container Registry:
    - Updated `Azure.ACR.GeoReplica` to ensure geo-replication applies to pre-flight and in-flight cases by @BernieWhite.
      [#3477](https://github.com/Azure/PSRule.Rules.Azure/issues/3477)
- General improvements:
  - Updated provider data by @BernieWhite.
    [#3538](https://github.com/Azure/PSRule.Rules.Azure/issues/3538)
- Bug fixes:
  - Fixed false negative for App Service `web` configuration cases set with `siteConfig` by @BernieWhite.
    [#3521](https://github.com/Azure/PSRule.Rules.Azure/issues/3521)

What's changed since pre-release v1.46.0-B0050:

- No additional changes.

## v1.46.0-B0050 (pre-release)

What's changed since v1.45.2:

- New features:
  - **Experimental:** Added Well-Architected Framework - Security pillar Level 1 maturity baseline by @BernieWhite.
    [#3107](https://github.com/Azure/PSRule.Rules.Azure/issues/3107)
    [#3517](https://github.com/Azure/PSRule.Rules.Azure/issues/3517)
    - The `Azure.Pillar.Security.L1` baseline provides an initial set of rules aligned to the first level of maturity.
    - This is an experimental baseline and may change in future releases.
  - Added CSV download of rule list associated with each baseline by @BernieWhite.
    [#3511](https://github.com/Azure/PSRule.Rules.Azure/issues/3511)
  - Added September 2025 baselines `Azure.GA_2025_09` and `Azure.Preview_2025_09` by @BernieWhite.
    [#3539](https://github.com/Azure/PSRule.Rules.Azure/issues/3539)
    - Includes rules released before or during September 2025.
    - Marked `Azure.GA_2025_06` and `Azure.Preview_2025_06` baselines as obsolete.
- New rules:
  - Azure Cache for Redis:
    - Check that Entra ID is required for all authentication of cache instances by @BernieWhite.
      [#3113](https://github.com/Azure/PSRule.Rules.Azure/issues/3113)
  - Container Registry:
    - Check replica locations are within allowed regions by @BernieWhite
      [#3442](https://github.com/Azure/PSRule.Rules.Azure/issues/3442)
    - Check that export policy is disabled for registries by @BernieWhite
      [#3444](https://github.com/Azure/PSRule.Rules.Azure/issues/3444)
  - Storage Account:
    - Check that local authentication is disabled for storage accounts by @BernieWhite.
      [#3115](https://github.com/Azure/PSRule.Rules.Azure/issues/3115)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.32.7` as the minimum version by @BernieWhite.
      [#3541](https://github.com/Azure/PSRule.Rules.Azure/issues/3541)
  - Container Registry:
    - Updated `Azure.ACR.GeoReplica` to ensure geo-replication applies to pre-flight and in-flight cases by @BernieWhite.
      [#3477](https://github.com/Azure/PSRule.Rules.Azure/issues/3477)
- General improvements:
  - Updated provider data by @BernieWhite.
    [#3538](https://github.com/Azure/PSRule.Rules.Azure/issues/3538)
- Bug fixes:
  - Fixed false negative for App Service `web` configuration cases set with `siteConfig` by @BernieWhite.
    [#3521](https://github.com/Azure/PSRule.Rules.Azure/issues/3521)

## v1.45.2

What's changed since v1.45.1:

- Bug fixes:
  - Fixed inconsistent handling of subnets with `Azure.VNET.SubnetNaming` and `Azure.VNET.UseNSGs` by @BernieWhite
    [#3497](https://github.com/Azure/PSRule.Rules.Azure/issues/3497)

## v1.45.1

What's changed since v1.45.0:

- Bug fixes:
  - Fixed imported user defined function is unable to access local variable by @BernieWhite.
    [#3483](https://github.com/Azure/PSRule.Rules.Azure/issues/3483)

## v1.45.0

What's changed since v1.44.2:

- New features:
  - Added June 2025 baselines `Azure.GA_2025_06` and `Azure.Preview_2025_06` by @BernieWhite.
    [#3465](https://github.com/Azure/PSRule.Rules.Azure/issues/3465)
    - Includes rules released before or during June 2025.
    - Marked `Azure.GA_2025_03` and `Azure.Preview_2025_03` baselines as obsolete.
  - Added June 2025 CAF baseline `Azure.CAF_2025_06` for recent naming changes by @BernieWhite.
    [#3464](https://github.com/Azure/PSRule.Rules.Azure/issues/3464)
- New rules:
  - App Configuration:
    - Check that App Configuration Key Values do not contain known secrets by @BernieWhite.
      [#3439](https://github.com/Azure/PSRule.Rules.Azure/issues/3439)
  - Event Grid:
    - Check namespaces use a minimum of TLS 1.2 by @BernieWhite.
      [#3354](https://github.com/Azure/PSRule.Rules.Azure/issues/3354)
  - Monitor Alerts:
    - Check that metric alerts are configured to automatically mitigate by @BernieWhite.
      [#3457](https://github.com/Azure/PSRule.Rules.Azure/issues/3457)
    - Check that scheduled query alerts are configured for lower frequency by @BernieWhite.
      [#3458](https://github.com/Azure/PSRule.Rules.Azure/issues/3458)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.32.5` as the minimum version by @BernieWhite.
      [#3463](https://github.com/Azure/PSRule.Rules.Azure/issues/3463)
  - Container Registry:
    - Deprecated `Azure.ACR.ContentTrust` rule by @BernieWhite.
      [#3443](https://github.com/Azure/PSRule.Rules.Azure/issues/3443)
      - The Docker content trust feature will retire in March 2028.
      - Content trust is replaced by OCI artifact signing, which is supported by Azure Container Registry.
  - Virtual Network Gateway:
    - Updated documentation and promoted `Azure.VNG.MaintenanceConfig` to GA by @BernieWhite.
      [#3379](https://github.com/Azure/PSRule.Rules.Azure/issues/3379)
      - Bumped rule set to `2025_06`.
- General improvements:
  - Native support for exporting policy as rules by @BernieWhite.
    [#2971](https://github.com/Azure/PSRule.Rules.Azure/issues/2971)
    [#2970](https://github.com/Azure/PSRule.Rules.Azure/issues/2970)
    - This removes the dependency on the `Az.Resources` module for policy exports.
  - Optimize generation of nested allOf/ anyOf condition in policy as rules by @BernieWhite.
    [#1965](https://github.com/Azure/PSRule.Rules.Azure/issues/1965)
- Bug fixes:
  - Fixed wrong verbose log when running `Export-AzPolicyAssignmentData` by @BernieWhite.
    [#1877](https://github.com/Azure/PSRule.Rules.Azure/issues/1877)
  - Fixed parent is missing on mocked token when expanding PE AVM module by @BernieWhite.
    [#3446](https://github.com/Azure/PSRule.Rules.Azure/issues/3446)
  - Fixed `Azure.AppGw.MinInstance` should allow 0 minimum capacity for v2 with autoscale by @BernieWhite @mbender-ms.
    [#3452](https://github.com/Azure/PSRule.Rules.Azure/issues/3452)
  - Fixed secure outputs objects may not be fully mocked by @BernieWhite.
    [#3434](https://github.com/Azure/PSRule.Rules.Azure/issues/3434)
  - Fixed incorrect inversion of policy as rules conditions by @BernieWhite.
    [#3419](https://github.com/Azure/PSRule.Rules.Azure/issues/3419)
  - Fixed string boolean values not converted during evaluation of policy as rules by @BernieWhite.
    [#3426](https://github.com/Azure/PSRule.Rules.Azure/issues/3426)

What's changed since pre-release v1.45.0-B0143:

- No additional changes.

## v1.45.0-B0143 (pre-release)

What's changed since pre-release v1.45.0-B0104:

- New features:
  - Added June 2025 baselines `Azure.GA_2025_06` and `Azure.Preview_2025_06` by @BernieWhite.
    [#3465](https://github.com/Azure/PSRule.Rules.Azure/issues/3465)
    - Includes rules released before or during June 2025.
    - Marked `Azure.GA_2025_03` and `Azure.Preview_2025_03` baselines as obsolete.
  - Added June 2025 CAF baseline `Azure.CAF_2025_06` for recent naming changes by @BernieWhite.
    [#3464](https://github.com/Azure/PSRule.Rules.Azure/issues/3464)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.32.5` as the minimum version by @BernieWhite.
      [#3463](https://github.com/Azure/PSRule.Rules.Azure/issues/3463)

## v1.45.0-B0104 (pre-release)

What's changed since pre-release v1.45.0-B0068:

- New rules:
  - Event Grid:
    - Check namespaces use a minimum of TLS 1.2 by @BernieWhite.
      [#3354](https://github.com/Azure/PSRule.Rules.Azure/issues/3354)
  - Monitor Alerts:
    - Check that metric alerts are configured to automatically mitigate by @BernieWhite.
      [#3457](https://github.com/Azure/PSRule.Rules.Azure/issues/3457)
    - Check that scheduled query alerts are configured for lower frequency by @BernieWhite.
      [#3458](https://github.com/Azure/PSRule.Rules.Azure/issues/3458)
- General improvements:
  - Native support for exporting policy as rules by @BernieWhite.
    [#2971](https://github.com/Azure/PSRule.Rules.Azure/issues/2971)
    [#2970](https://github.com/Azure/PSRule.Rules.Azure/issues/2970)
    - This removes the dependency on the `Az.Resources` module for policy exports.
- Bug fixes:
  - Fixed wrong verbose log when running `Export-AzPolicyAssignmentData` by @BernieWhite.
    [#1877](https://github.com/Azure/PSRule.Rules.Azure/issues/1877)

## v1.45.0-B0068 (pre-release)

What's changed since pre-release v1.45.0-B0037:

- New rules:
  - App Configuration:
    - Check that App Configuration Key Values do not contain known secrets by @BernieWhite.
      [#3439](https://github.com/Azure/PSRule.Rules.Azure/issues/3439)
- Updated rules:
  - Container Registry:
    - Deprecated `Azure.ACR.ContentTrust` rule by @BernieWhite.
      [#3443](https://github.com/Azure/PSRule.Rules.Azure/issues/3443)
      - The Docker content trust feature will retire in March 2028.
      - Content trust is replaced by OCI artifact signing, which is supported by Azure Container Registry.
  - Virtual Network Gateway:
    - Updated documentation and promoted `Azure.VNG.MaintenanceConfig` to GA by @BernieWhite.
      [#3379](https://github.com/Azure/PSRule.Rules.Azure/issues/3379)
      - Bumped rule set to `2025_06`.
- Bug fixes:
  - Fixed parent is missing on mocked token when expanding PE AVM module by @BernieWhite.
    [#3446](https://github.com/Azure/PSRule.Rules.Azure/issues/3446)
  - Fixed `Azure.AppGw.MinInstance` should allow 0 minimum capacity for v2 with autoscale by @BernieWhite @mbender-ms.
    [#3452](https://github.com/Azure/PSRule.Rules.Azure/issues/3452)

## v1.45.0-B0037 (pre-release)

What's changed since pre-release v1.45.0-B0017:

- Bug fixes:
  - Fixed secure outputs objects may not be fully mocked by @BernieWhite.
    [#3434](https://github.com/Azure/PSRule.Rules.Azure/issues/3434)

## v1.45.0-B0017 (pre-release)

What's changed since v1.44.2:

- General improvements:
  - Optimize generation of nested allOf/ anyOf condition in policy as rules by @BernieWhite.
    [#1965](https://github.com/Azure/PSRule.Rules.Azure/issues/1965)
- Bug fixes:
  - Fixed incorrect inversion of policy as rules conditions by @BernieWhite.
    [#3419](https://github.com/Azure/PSRule.Rules.Azure/issues/3419)
  - Fixed string boolean values not converted during evaluation of policy as rules by @BernieWhite.
    [#3426](https://github.com/Azure/PSRule.Rules.Azure/issues/3426)

## v1.44.2

What's changed since v1.44.1:

- Bug fixes:
  - Fixed compatibility with newer `Az.Accounts` modules by @BernieWhite.
    [#3420](https://github.com/Azure/PSRule.Rules.Azure/issues/3420)

## v1.44.1

What's changed since v1.44.0:

- Bug fixes:
  - Fixes `Azure.Log.Replication` by removing `location` check by @BernieWhite.
    [#3411](https://github.com/Azure/PSRule.Rules.Azure/issues/3411)
  - Fixes the function `tryIndexFromEnd` was not found by @BernieWhite.
    [#3409](https://github.com/Azure/PSRule.Rules.Azure/issues/3409)
  - Fixes `Azure.APIM.PolicyBase` to provide detailed output when policy sections are missing by @BernieWhite.
    [#3413](https://github.com/Azure/PSRule.Rules.Azure/issues/3413)

## v1.44.0

What's changed since v1.43.0:

- New features:
  - Added support for the `buildUri` and `parseUri` functions during Bicep expansion by @BernieWhite.
    [#3345](https://github.com/Azure/PSRule.Rules.Azure/issues/3345)
  - Added support for the `toPhysicalZone`, `toPhysicalZones`, `toLogicalZone`, `toLogicalZones` Bicep functions by @BernieWhite.
    [#3346](https://github.com/Azure/PSRule.Rules.Azure/issues/3346)
  - Added the `userPrincipalName` property to the `deployer()` object by @BernieWhite.
    [#3390](https://github.com/Azure/PSRule.Rules.Azure/issues/3390)
  - Added support for optionally exporting in-flight security alerts from Microsoft Defender for Cloud by @BernieWhite.
    [#3238](https://github.com/Azure/PSRule.Rules.Azure/issues/3238)
    - To export security alerts use the `-ExportSecurityAlerts` switch when running `Export-AzRuleData`.
- New rules:
  - Application Insights:
    - Check that local authentication is disabled by @BernieWhite.
      [#3374](https://github.com/Azure/PSRule.Rules.Azure/issues/3374)
    - Check application insights resources matches configured name format by @BernieWhite.
      [#3375](https://github.com/Azure/PSRule.Rules.Azure/issues/3375)
      - The name format can be configured by the `AZURE_APP_INSIGHTS_NAME_FORMAT` configuration option.
  - Entra Domain Services:
    - Check that the SKU supports geo-replication by @BernieWhite.
      [#3355](https://github.com/Azure/PSRule.Rules.Azure/issues/3355)
    - Check that at least two replicas are configured by @BernieWhite.
      [#3364](https://github.com/Azure/PSRule.Rules.Azure/issues/3364)
    - Check that replicas are located in allowed locations by @BernieWhite.
      [#3365](https://github.com/Azure/PSRule.Rules.Azure/issues/3365)
      - Configure the `AZURE_RESOURCE_ALLOWED_LOCATIONS` configuration option to specify allowed locations.
  - Microsoft Defender for Cloud:
    - Check if subscriptions have active security alerts in Microsoft Defender for Cloud by @BernieWhite.
      [#3238](https://github.com/Azure/PSRule.Rules.Azure/issues/3238)
  - Monitor Logs:
    - Check that log workspaces replicate to allowed locations by @BernieWhite.
      [#3373](https://github.com/Azure/PSRule.Rules.Azure/issues/3373)
      - Configure the `AZURE_RESOURCE_ALLOWED_LOCATIONS` configuration option to specify allowed locations.
    - Check that log workspaces meet the service naming requirements by @BernieWhite.
      [#3376](https://github.com/Azure/PSRule.Rules.Azure/issues/3376)
    - Check log workspaces matches configured name format by @BernieWhite.
      [#3376](https://github.com/Azure/PSRule.Rules.Azure/issues/3376)
      - The name format can be configured by the `AZURE_LOG_WORKSPACE_NAME_FORMAT` configuration option.
  - Service Fabric:
    - Check that Service Fabric clusters use encrypted and signed node-to-node communication by @BernieWhite.
      [#3356](https://github.com/Azure/PSRule.Rules.Azure/issues/3356)
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types and properties by @BernieWhite.
      [#3366](https://github.com/Azure/PSRule.Rules.Azure/issues/3366)
      [#3368](https://github.com/Azure/PSRule.Rules.Azure/issues/3368)
      [#3342](https://github.com/Azure/PSRule.Rules.Azure/issues/3342)
      - Added support for new resource types:
        - `Microsoft.AzureFleet/fleets`
        - `Microsoft.DocumentDB/mongoClusters`
        - `Microsoft.Web/staticSites`
        - `Microsoft.Web/staticSites/basicAuth`
      - Added new sensitive properties to:
        - `Microsoft.AAD/domainServices`
    - Updated `Azure.Deployment.OutputSecretValue` to support secure outputs by @BernieWhite.
      [#3357](https://github.com/Azure/PSRule.Rules.Azure/issues/3357)
  - Monitor Logs:
    - Updated documentation and promoted `Azure.Log.Replication` to GA by @BernieWhite.
      [#3372](https://github.com/Azure/PSRule.Rules.Azure/issues/3372)
      - This rule was renamed from `Azure.LogAnalytics.Replication` to `Azure.Log.Replication` to drop the legacy name.
      - Bumped rule set to `2025_06`.
  - Virtual Network:
    - Updated documentation and promoted `Azure.VNET.PrivateSubnet` to GA by @BernieWhite.
      [#3386](https://github.com/Azure/PSRule.Rules.Azure/issues/3386)
      - Bumped rule set to `2025_06`.
  - Virtual Machine Scale Sets:
    - Updated documentation and promoted `Azure.VMSS.AutoInstanceRepairs` to GA by @BernieWhite.
      [#3378](https://github.com/Azure/PSRule.Rules.Azure/issues/3378)
      - Bumped rule set to `2025_06`.
- Bug fixes:
  - Fixed identification of secure parameters with custom type for `Azure.Deployment.SecureParameter` by @BernieWhite.
    [#3347](https://github.com/Azure/PSRule.Rules.Azure/issues/3347)
  - Fixed not implemented exception for deployment name in lambda expression by @BernieWhite.
    [#3393](https://github.com/Azure/PSRule.Rules.Azure/issues/3393)
  - Fixed incorrect parsing of double quoted string during expansion by @BernieWhite.
    [#3394](https://github.com/Azure/PSRule.Rules.Azure/issues/3394)

What's changed since pre-release v1.44.0-B0081:

- No additional changes.

## v1.44.0-B0081 (pre-release)

What's changed since pre-release v1.44.0-B0052:

- New features:
  - Added support for optionally exporting in-flight security alerts from Microsoft Defender for Cloud by @BernieWhite.
    [#3238](https://github.com/Azure/PSRule.Rules.Azure/issues/3238)
    - To export security alerts use the `-ExportSecurityAlerts` switch when running `Export-AzRuleData`.
- New rules:
  - Microsoft Defender for Cloud:
    - Check if subscriptions have active security alerts in Microsoft Defender for Cloud by @BernieWhite.
      [#3238](https://github.com/Azure/PSRule.Rules.Azure/issues/3238)

## v1.44.0-B0052 (pre-release)

What's changed since pre-release v1.44.0-B0027:

- New features:
  - Added support for the `toPhysicalZone`, `toPhysicalZones`, `toLogicalZone`, `toLogicalZones` Bicep functions by @BernieWhite.
    [#3346](https://github.com/Azure/PSRule.Rules.Azure/issues/3346)
  - Added the `userPrincipalName` property to the `deployer()` object by @BernieWhite.
    [#3390](https://github.com/Azure/PSRule.Rules.Azure/issues/3390)
- New rules:
  - Service Fabric:
    - Check that Service Fabric clusters use encrypted and signed node-to-node communication by @BernieWhite.
      [#3356](https://github.com/Azure/PSRule.Rules.Azure/issues/3356)
- Updated rules:
  - Virtual Network:
    - Updated documentation and promoted `Azure.VNET.PrivateSubnet` to GA by @BernieWhite.
      [#3386](https://github.com/Azure/PSRule.Rules.Azure/issues/3386)
      - Bumped rule set to `2025_06`.
  - Virtual Machine Scale Sets:
    - Updated documentation and promoted `Azure.VMSS.AutoInstanceRepairs` to GA by @BernieWhite.
      [#3378](https://github.com/Azure/PSRule.Rules.Azure/issues/3378)
      - Bumped rule set to `2025_06`.
- Bug fixes:
  - Fixed not implemented exception for deployment name in lambda expression by @BernieWhite.
    [#3393](https://github.com/Azure/PSRule.Rules.Azure/issues/3393)
  - Fixed incorrect parsing of double quoted string during expansion by @BernieWhite.
    [#3394](https://github.com/Azure/PSRule.Rules.Azure/issues/3394)

## v1.44.0-B0027 (pre-release)

What's changed since pre-release v1.44.0-B0011:

- New rules:
  - Application Insights:
    - Check that local authentication is disabled by @BernieWhite.
      [#3374](https://github.com/Azure/PSRule.Rules.Azure/issues/3374)
    - Check application insights resources matches configured name format by @BernieWhite.
      [#3375](https://github.com/Azure/PSRule.Rules.Azure/issues/3375)
      - The name format can be configured by the `AZURE_APP_INSIGHTS_NAME_FORMAT` configuration option.
  - Entra Domain Services:
    - Check that the SKU supports geo-replication by @BernieWhite.
      [#3355](https://github.com/Azure/PSRule.Rules.Azure/issues/3355)
    - Check that at least two replicas are configured by @BernieWhite.
      [#3364](https://github.com/Azure/PSRule.Rules.Azure/issues/3364)
    - Check that replicas are located in allowed locations by @BernieWhite.
      [#3365](https://github.com/Azure/PSRule.Rules.Azure/issues/3365)
      - Configure the `AZURE_RESOURCE_ALLOWED_LOCATIONS` configuration option to specify allowed locations.
  - Monitor Logs:
    - Check that log workspaces replicate to allowed locations by @BernieWhite.
      [#3373](https://github.com/Azure/PSRule.Rules.Azure/issues/3373)
      - Configure the `AZURE_RESOURCE_ALLOWED_LOCATIONS` configuration option to specify allowed locations.
    - Check that log workspaces meet the service naming requirements by @BernieWhite.
      [#3376](https://github.com/Azure/PSRule.Rules.Azure/issues/3376)
    - Check log workspaces matches configured name format by @BernieWhite.
      [#3376](https://github.com/Azure/PSRule.Rules.Azure/issues/3376)
      - The name format can be configured by the `AZURE_LOG_WORKSPACE_NAME_FORMAT` configuration option.
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types and properties by @BernieWhite.
      [#3366](https://github.com/Azure/PSRule.Rules.Azure/issues/3366)
      [#3368](https://github.com/Azure/PSRule.Rules.Azure/issues/3368)
      - Added support for new resource types:
        - `Microsoft.DocumentDB/mongoClusters`
      - Added new sensitive properties to:
        - `Microsoft.AAD/domainServices`
  - Monitor Logs:
    - Updated documentation and promoted `Azure.Log.Replication` to GA by @BernieWhite.
      [#3372](https://github.com/Azure/PSRule.Rules.Azure/issues/3372)
      - This rule was renamed from `Azure.LogAnalytics.Replication` to `Azure.Log.Replication` to drop the legacy name.
      - Bumped rule set to `2025_06`.

## v1.44.0-B0011 (pre-release)

What's changed since v1.43.0:

- New features:
  - Added support for the `buildUri` and `parseUri` functions during Bicep expansion by @BernieWhite.
    [#3345](https://github.com/Azure/PSRule.Rules.Azure/issues/3345)
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.OutputSecretValue` to support secure outputs by @BernieWhite.
      [#3357](https://github.com/Azure/PSRule.Rules.Azure/issues/3357)
    - Updated `Azure.Deployment.SecureValue` to check additional resource types and properties by @BernieWhite.
      [#3342](https://github.com/Azure/PSRule.Rules.Azure/issues/3342)
      - Added support for new resource types:
        - `Microsoft.AzureFleet/fleets`
        - `Microsoft.Web/staticSites`
        - `Microsoft.Web/staticSites/basicAuth`
- Bug fixes:
  - Fixed identification of secure parameters with custom type for `Azure.Deployment.SecureParameter` by @BernieWhite.
    [#3347](https://github.com/Azure/PSRule.Rules.Azure/issues/3347)

## v1.43.0

What's changed since v1.42.0:

- New rules:
  - AI Search:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_AI_SEARCH_NAME_FORMAT` configuration option.
  - AI Service:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_AI_SERVICES_NAME_FORMAT` configuration option.
  - All resources:
    - Check if resource tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_RESOURCE_REQUIRED_TAGS` configuration option.
  - Deployment:
    - Check if sensitive values have been passed to non-secure parameters that might leak the value @BernieWhite.
      [#3319](https://github.com/Azure/PSRule.Rules.Azure/issues/3319)
  - Event Grid:
    - Check if resource names for topics and domains matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for domains can be configured by the `AZURE_EVENTGRID_DOMAIN_NAME_FORMAT` configuration option.
      - The name format for topics can be configured by the `AZURE_EVENTGRID_CUSTOM_TOPIC_NAME_FORMAT` configuration option.
      - The name format for system topics can be configured by the `AZURE_EVENTGRID_SYSTEM_TOPIC_NAME_FORMAT` configuration option.
  - Load Balancer:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_LOAD_BALANCER_NAME_FORMAT` configuration option.
  - Network Security Group:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
  - Public IP Address:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_PUBLIC_IP_ADDRESS_NAME_FORMAT` configuration option.
  - Resource Group:
    - Check if the resource group name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_RESOURCE_GROUP_NAME_FORMAT` configuration option.
    - Check if resource group tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_RESOURCE_GROUP_REQUIRED_TAGS` configuration option.
  - Route Table:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_ROUTE_TABLE_NAME_FORMAT` configuration option.
  - Storage Account:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_STORAGE_ACCOUNT_NAME_FORMAT` configuration option.
  - Subscription:
    - Check if subscription tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_SUBSCRIPTION_REQUIRED_TAGS` configuration option.
  - Virtual Machine:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_VIRTUAL_MACHINE_NAME_FORMAT` configuration option.
  - Virtual Network:
    - Check if resource name and subnet name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for virtual networks can be configured by the `AZURE_VNET_NAME_FORMAT` configuration option.
      - The name format for subnets can be configured by the `AZURE_VNET_SUBNET_NAME_FORMAT` configuration option.
  - Virtual Network Gateway:
    - Check if resource and connection name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for gateways can be configured by the `AZURE_VIRTUAL_NETWORK_GATEWAY_NAME_FORMAT` configuration option.
      - The name format for connections can be configured by the `AZURE_GATEWAY_CONNECTION_NAME_FORMAT` configuration option.
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types and properties by @BernieWhite.
      [#3321](https://github.com/Azure/PSRule.Rules.Azure/issues/3321)
      - Added support for new resource types:
        - `Microsoft.ApiManagement/service/caches`
        - `Microsoft.ApiManagement/service/loggers`
        - `Microsoft.ApiManagement/service/subscriptions`
        - `Microsoft.App/containerApps/sourcecontrols`
        - `Microsoft.App/managedEnvironments/storages`
        - `Microsoft.App/sessionPools`
        - `Microsoft.Kusto/clusters/databases/scripts`
        - `Microsoft.ContainerInstance/containerGroupProfiles`
      - Added new sensitive properties to:
        - `Microsoft.ApiManagement/service`
        - `Microsoft.App/managedEnvironments`
        - `Microsoft.Network/applicationGateways`
        - `Microsoft.ContainerInstance/containerGroups`
  - Resource Group:
    - **Important change**: Renamed the rule `Azure.ResourceGroup.Name` to `Azure.Group.Name` by @BernieWhite.
      [#3319](https://github.com/Azure/PSRule.Rules.Azure/issues/3319)
      - The rule was renamed to better align with upcoming related rules.

What's changed since pre-release v1.43.0-B0017:

- No additional changes.

## v1.43.0-B0017 (pre-release)

What's changed since v1.42.0:

- New rules:
  - AI Search:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_AI_SEARCH_NAME_FORMAT` configuration option.
  - AI Service:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_AI_SERVICES_NAME_FORMAT` configuration option.
  - All resources:
    - Check if resource tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_RESOURCE_REQUIRED_TAGS` configuration option.
  - Deployment:
    - Check if sensitive values have been passed to non-secure parameters that might leak the value @BernieWhite.
      [#3319](https://github.com/Azure/PSRule.Rules.Azure/issues/3319)
  - Event Grid:
    - Check if resource names for topics and domains matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for domains can be configured by the `AZURE_EVENTGRID_DOMAIN_NAME_FORMAT` configuration option.
      - The name format for topics can be configured by the `AZURE_EVENTGRID_CUSTOM_TOPIC_NAME_FORMAT` configuration option.
      - The name format for system topics can be configured by the `AZURE_EVENTGRID_SYSTEM_TOPIC_NAME_FORMAT` configuration option.
  - Load Balancer:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_LOAD_BALANCER_NAME_FORMAT` configuration option.
  - Network Security Group:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
  - Public IP Address:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_PUBLIC_IP_ADDRESS_NAME_FORMAT` configuration option.
  - Resource Group:
    - Check if the resource group name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_RESOURCE_GROUP_NAME_FORMAT` configuration option.
    - Check if resource group tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_RESOURCE_GROUP_REQUIRED_TAGS` configuration option.
  - Route Table:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_ROUTE_TABLE_NAME_FORMAT` configuration option.
  - Storage Account:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_STORAGE_ACCOUNT_NAME_FORMAT` configuration option.
  - Subscription:
    - Check if subscription tags match the required tags by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The required tags can be configured by the `AZURE_SUBSCRIPTION_REQUIRED_TAGS` configuration option.
  - Virtual Machine:
    - Check if resource name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format can be configured by the `AZURE_VIRTUAL_MACHINE_NAME_FORMAT` configuration option.
  - Virtual Network:
    - Check if resource name and subnet name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for virtual networks can be configured by the `AZURE_VNET_NAME_FORMAT` configuration option.
      - The name format for subnets can be configured by the `AZURE_VNET_SUBNET_NAME_FORMAT` configuration option.
  - Virtual Network Gateway:
    - Check if resource and connection name matches the configured name format by @BernieWhite.
      [#3325](https://github.com/Azure/PSRule.Rules.Azure/issues/3325)
      - The name format for gateways can be configured by the `AZURE_VIRTUAL_NETWORK_GATEWAY_NAME_FORMAT` configuration option.
      - The name format for connections can be configured by the `AZURE_GATEWAY_CONNECTION_NAME_FORMAT` configuration option.
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types and properties by @BernieWhite.
      [#3321](https://github.com/Azure/PSRule.Rules.Azure/issues/3321)
      - Added support for new resource types:
        - `Microsoft.ApiManagement/service/caches`
        - `Microsoft.ApiManagement/service/loggers`
        - `Microsoft.ApiManagement/service/subscriptions`
        - `Microsoft.App/containerApps/sourcecontrols`
        - `Microsoft.App/managedEnvironments/storages`
        - `Microsoft.App/sessionPools`
        - `Microsoft.Kusto/clusters/databases/scripts`
        - `Microsoft.ContainerInstance/containerGroupProfiles`
      - Added new sensitive properties to:
        - `Microsoft.ApiManagement/service`
        - `Microsoft.App/managedEnvironments`
        - `Microsoft.Network/applicationGateways`
        - `Microsoft.ContainerInstance/containerGroups`
  - Resource Group:
    - **Important change**: Renamed the rule `Azure.ResourceGroup.Name` to `Azure.Group.Name` by @BernieWhite.
      [#3319](https://github.com/Azure/PSRule.Rules.Azure/issues/3319)
      - The rule was renamed to better align with upcoming related rules.

## v1.42.0

What's changed since v1.41.4:

- New features:
  - Added March 2025 baselines `Azure.GA_2025_03` and `Azure.Preview_2025_03` by @BernieWhite.
    [#3304](https://github.com/Azure/PSRule.Rules.Azure/issues/3304)
    - Includes rules released before or during March 2025.
    - Marked `Azure.GA_2024_12` and `Azure.Preview_2024_12` baselines as obsolete.
- New rules:
  - Azure DNS:
    - Check that public zones use DNSSEC by @BernieWhite.
      [#3201](https://github.com/Azure/PSRule.Rules.Azure/issues/3201)
  - Azure SQL Database:
    - Check that logical SQL servers have vulnerability assessment enabled by @BernieWhite.
      [#3196](https://github.com/Azure/PSRule.Rules.Azure/issues/3196)
  - Event Grid:
    - Check that topics and domains use a minimum of TLS 1.2 by @BernieWhite.
      [#3306](https://github.com/Azure/PSRule.Rules.Azure/issues/3306)
  - Image Builder:
    - Check that image builder build and validation scripts are pinned by @BernieWhite.
      [#2903](https://github.com/Azure/PSRule.Rules.Azure/issues/2903)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.30.10` as the minimum version by @BernieWhite.
      [#3301](https://github.com/Azure/PSRule.Rules.Azure/issues/3301)
  - App Service:
    - Updated SKUs support by `Azure.AppService.AvailabilityZone` by @Sjors-Boom.
      [#3299](https://github.com/Azure/PSRule.Rules.Azure/issues/3299)
    - Updated `Azure.AppService.MinTLS` to include TLS 1.3 as a valid minimum version by @BernieWhite.
      [#3269](https://github.com/Azure/PSRule.Rules.Azure/issues/3269)
  - Azure Managed Grafana:
    - Bumped `Azure.Grafana.Version` to use version `11` as `10` is now depreciated by @BernieWhite.
      [#3293](https://github.com/Azure/PSRule.Rules.Azure/issues/3293)
      - Bumped rule set to `2025_03`.
- General improvements:
  - Added support for `fail` and `deployer` functions during Bicep expansion by @BernieWhite.
    [#3308](https://github.com/Azure/PSRule.Rules.Azure/issues/3308)
  - Added a new quickstart guide for using Azure Pipelines with PSRule by @that-ar-guy.
    [#3220](https://github.com/Azure/PSRule.Rules.Azure/pull/3220)
  - Added additional exclusions to policies for `Azure.AppService.MinTLS` by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Engineering:
  - Updates to WAF documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Updated resource providers and policy aliases by @BernieWhite.
    [#3285](https://github.com/Azure/PSRule.Rules.Azure/issues/3285)

What's changed since pre-release v1.42.0-B0066:

- No additional changes.

## v1.42.0-B0066 (pre-release)

What's changed since pre-release v1.42.0-B0021:

- New features:
  - Added March 2025 baselines `Azure.GA_2025_03` and `Azure.Preview_2025_03` by @BernieWhite.
    [#3304](https://github.com/Azure/PSRule.Rules.Azure/issues/3304)
    - Includes rules released before or during March 2025.
    - Marked `Azure.GA_2024_12` and `Azure.Preview_2024_12` baselines as obsolete.
- New rules:
  - Azure DNS:
    - Check that public zones use DNSSEC by @BernieWhite.
      [#3201](https://github.com/Azure/PSRule.Rules.Azure/issues/3201)
  - Azure SQL Database:
    - Check that logical SQL servers have vulnerability assessment enabled by @BernieWhite.
      [#3196](https://github.com/Azure/PSRule.Rules.Azure/issues/3196)
  - Event Grid:
    - Check that topics and domains use a minimum of TLS 1.2 by @BernieWhite.
      [#3306](https://github.com/Azure/PSRule.Rules.Azure/issues/3306)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.30.10` as the minimum version by @BernieWhite.
      [#3301](https://github.com/Azure/PSRule.Rules.Azure/issues/3301)
  - App Service:
    - Updated SKUs support by `Azure.AppService.AvailabilityZone` by @Sjors-Boom.
      [#3299](https://github.com/Azure/PSRule.Rules.Azure/issues/3299)
  - Azure Managed Grafana:
    - Bumped `Azure.Grafana.Version` to use version `11` as `10` is now depreciated by @BernieWhite.
      [#3293](https://github.com/Azure/PSRule.Rules.Azure/issues/3293)
      - Bumped rule set to `2025_03`.
- General improvements:
  - Added support for `fail` and `deployer` functions during Bicep expansion by @BernieWhite.
    [#3308](https://github.com/Azure/PSRule.Rules.Azure/issues/3308)
- Engineering:
  - Updated resource providers and policy aliases by @BernieWhite.
    [#3285](https://github.com/Azure/PSRule.Rules.Azure/issues/3285)

## v1.42.0-B0021 (pre-release)

What's changed since v1.41.4:

- New rules:
  - Image Builder:
    - Check that image builder build and validation scripts are pinned by @BernieWhite.
      [#2903](https://github.com/Azure/PSRule.Rules.Azure/issues/2903)
- Updated rules:
  - App Service:
    - Updated `Azure.AppService.MinTLS` to include TLS 1.3 as a valid minimum version by @BernieWhite.
      [#3269](https://github.com/Azure/PSRule.Rules.Azure/issues/3269)
- General improvements:
  - Added a new quickstart guide for using Azure Pipelines with PSRule by @that-ar-guy.
    [#3220](https://github.com/Azure/PSRule.Rules.Azure/pull/3220)
  - Added additional exclusions to policies for `Azure.AppService.MinTLS` by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Engineering:
  - Updates to WAF documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)

## v1.41.4

What's changed since v1.41.3:

- Bug fixes:
  - Fixed Azure VM Standalone failing on data disks check by @BernieWhite.
    [#3263](https://github.com/Azure/PSRule.Rules.Azure/issues/3263)
  - Fixed in-flight analysis of key rotation policy fails due to missing data by @BernieWhite.
    [#3261](https://github.com/Azure/PSRule.Rules.Azure/issues/3261)
    - Disabled export of `keys` from management plane API because the data is incomplete for this rule.

## v1.41.3

What's changed since v1.41.2:

- Bug fixes:
  - Fixed ordering of symbolic copy loop dependencies by @BernieWhite.
    [#3257](https://github.com/Azure/PSRule.Rules.Azure/issues/3257)

## v1.41.2

What's changed since v1.41.1:

- Bug fixes:
  - Fixed recursive lookup of cross module resources in the deployment by @BernieWhite.
    [#3251](https://github.com/Azure/PSRule.Rules.Azure/issues/3251)
    - This improves the ability to reference resource properties in the same parent deployment.
    - Additionally, projection of runtime properties has been improved.
  - Fixed literal strings may be incorrectly interpreted as expressions by @BernieWhite.
    [#3252](https://github.com/Azure/PSRule.Rules.Azure/issues/3252)

## v1.41.1

What's changed since v1.41.0:

- Bug fixes:
  - Fixed incorrect generation of resource ID for tenant scoped deployments by @BernieWhite.
    [#3237](https://github.com/Azure/PSRule.Rules.Azure/issues/3237)
  - Fixed in-flight export of subscription resource type `Microsoft.Subscription` by @BernieWhite.
    [#3231](https://github.com/Azure/PSRule.Rules.Azure/issues/3231)

## v1.41.0

What's changed since v1.40.0:

- New features:
  - Added December 2024 baselines `Azure.GA_2024_12` and `Azure.Preview_2024_12` by @BernieWhite.
    [#3165](https://github.com/Azure/PSRule.Rules.Azure/issues/3165)
    - Includes rules released before or during December 2024.
    - Marked `Azure.GA_2024_09` and `Azure.Preview_2024_09` baselines as obsolete.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.30.6` as the minimum version by @BernieWhite.
      [#3206](https://github.com/Azure/PSRule.Rules.Azure/issues/3206)
  - Container Registry:
    - Updated documentation and promoted `Azure.ACR.AnonymousAccess` to GA by @BernieWhite.
      [#3119](https://github.com/Azure/PSRule.Rules.Azure/issues/3119)
      - Bumped rule set to `2024_12`.
- General improvements:
  - **Important change**: Deprecated rules with no clear WAF alignment by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
    - The following rules are deprecated:
      - `Azure.APIM.ProductTerms`
- Engineering:
  - Updated resource providers and policy aliases by @BernieWhite.
    [#3166](https://github.com/Azure/PSRule.Rules.Azure/pull/3166)

What's changed since pre-release v1.41.0-B0015:

- No additional changes.

## v1.41.0-B0015 (pre-release)

What's changed since v1.40.0:

- New features:
  - Added December 2024 baselines `Azure.GA_2024_12` and `Azure.Preview_2024_12` by @BernieWhite.
    [#3165](https://github.com/Azure/PSRule.Rules.Azure/issues/3165)
    - Includes rules released before or during December 2024.
    - Marked `Azure.GA_2024_09` and `Azure.Preview_2024_09` baselines as obsolete.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.30.6` as the minimum version by @BernieWhite.
      [#3206](https://github.com/Azure/PSRule.Rules.Azure/issues/3206)
  - Container Registry:
    - Updated documentation and promoted `Azure.ACR.AnonymousAccess` to GA by @BernieWhite.
      [#3119](https://github.com/Azure/PSRule.Rules.Azure/issues/3119)
      - Bumped rule set to `2024_12`.
- General improvements:
  - **Important change**: Deprecated rules with no clear WAF alignment by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
    - The following rules are deprecated:
      - `Azure.APIM.ProductTerms`
- Engineering:
  - Updated resource providers and policy aliases by @BernieWhite.
    [#3166](https://github.com/Azure/PSRule.Rules.Azure/pull/3166)

## v1.40.0

What's changed since v1.39.3:

- New features:
  - Added support for expanding from `.jsonc` parameter files by @BernieWhite.
    [#2053](https://github.com/Azure/PSRule.Rules.Azure/issues/2053)
    - Previously only parameter files with the `.json` extension where automatically expanded.
    - This feature adds support so that JSON parameter files with the `.jsonc` extension are also discovered and expanded.
    - No additional configuration is required if expansion of JSON parameter files is enabled.
    - To enable parameter file expansion set the `AZURE_PARAMETER_FILE_EXPANSION` configuration option to `true`.
- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types by @BernieWhite.
      [#2650](https://github.com/Azure/PSRule.Rules.Azure/issues/2650)
      [#2651](https://github.com/Azure/PSRule.Rules.Azure/issues/2651)
      - Added support for container apps secret properties.
      - Added support for deployment script secret properties.
      - Bumped rule set to `2024_12`.
    - Updated `Azure.Deployment.SecureParameter` to reduce false positives by @BernieWhite.
      [#3149](https://github.com/Azure/PSRule.Rules.Azure/issues/3149)
      - Parameters named ending with `name`, `uri`, `url`, `path`, `type`, `id`, or `options` are ignored.
      - The `customerManagedKey` parameter is ignored.
  - Microsoft Defender for Cloud:
    - Updated `Azure.DefenderCloud.Contact` to use `emails` property and removed `phone` by @BernieWhite.
      [#3117](https://github.com/Azure/PSRule.Rules.Azure/issues/3117)
      - Renamed rule to `Azure.Defender.SecurityContact` to better align with naming for defender rules.
      - Bumped rule set to `2024_12`.
- General improvements:
  - Added first time contributor guide in docs by @that-ar-guy.
    [#3097](https://github.com/Azure/PSRule.Rules.Azure/issues/3097)
  - Additional quality updates to documentation by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
  - Migrated Azure samples into PSRule for Azure by @BernieWhite.
    [#3085](https://github.com/Azure/PSRule.Rules.Azure/issues/3085)
- Bug fixes:
  - Fixed evaluation of APIM policies when using embedded C# with quotes by @BernieWhite.
    [#3184](https://github.com/Azure/PSRule.Rules.Azure/issues/3184)
  - Fixed resource group ID is incorrect under subscription scope by @BernieWhite.
    [#3198](https://github.com/Azure/PSRule.Rules.Azure/issues/3198)
  - Fixed object to hashtable conversion for default parameter values by @BernieWhite.
    [#3033](https://github.com/Azure/PSRule.Rules.Azure/issues/3033)
  - Fixed deployments with more than one module at tenant scope by @BernieWhite.
    [#3167](https://github.com/Azure/PSRule.Rules.Azure/issues/3167)
  - Fixed projection of default role authorization property `principalType` by @BernieWhite.
    [#3163](https://github.com/Azure/PSRule.Rules.Azure/issues/3163)
  - Fixed user defined function not found when used as parameter default by @BernieWhite.
    [#3169](https://github.com/Azure/PSRule.Rules.Azure/issues/3169)
  - Fixed evaluation of `Azure.NSG.LateralTraversal` with empty string properties by @BernieWhite.
    [#3130](https://github.com/Azure/PSRule.Rules.Azure/issues/3130)
  - Fixed evaluation of `Azure.Deployment.AdminUsername` with symbolic references by @BernieWhite.
    [#3146](https://github.com/Azure/PSRule.Rules.Azure/issues/3146)
  - Fixed output map expansion with resource IDs by @BernieWhite.
    [#3153](https://github.com/Azure/PSRule.Rules.Azure/issues/3153)

What's changed since pre-release v1.40.0-B0206:

- No additional changes.

## v1.40.0-B0206 (pre-release)

What's changed since pre-release v1.40.0-B0147:

- General improvements:
  - Added first time contributor guide in docs by @that-ar-guy.
    [#3097](https://github.com/Azure/PSRule.Rules.Azure/issues/3097)
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
- Bug fixes:
  - Fixed evaluation of APIM policies when using embedded C# with quotes by @BernieWhite.
    [#3184](https://github.com/Azure/PSRule.Rules.Azure/issues/3184)
  - Fixed resource group ID is incorrect under subscription scope by @BernieWhite.
    [#3198](https://github.com/Azure/PSRule.Rules.Azure/issues/3198)

## v1.40.0-B0147 (pre-release)

What's changed since pre-release v1.40.0-B0103:

- Bug fixes:
  - Fixed object to hashtable conversion for default parameter values by @BernieWhite.
    [#3033](https://github.com/Azure/PSRule.Rules.Azure/issues/3033)
  - Fixed deployments with more than one module at tenant scope by @BernieWhite.
    [#3167](https://github.com/Azure/PSRule.Rules.Azure/issues/3167)

## v1.40.0-B0103 (pre-release)

What's changed since pre-release v1.40.0-B0063:

- New features:
  - Added support for expanding from `.jsonc` parameter files by @BernieWhite.
    [#2053](https://github.com/Azure/PSRule.Rules.Azure/issues/2053)
    - Previously only parameter files with the `.json` extension where automatically expanded.
    - This feature adds support so that JSON parameter files with the `.jsonc` extension are also discovered and expanded.
    - No additional configuration is required if expansion of JSON parameter files is enabled.
    - To enable parameter file expansion set the `AZURE_PARAMETER_FILE_EXPANSION` configuration option to `true`.
- General improvements:
  - Additional quality updates to documentation by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
- Bug fixes:
  - Fixed projection of default role authorization property `principalType` by @BernieWhite.
    [#3163](https://github.com/Azure/PSRule.Rules.Azure/issues/3163)
  - Fixed user defined function not found when used as parameter default by @BernieWhite.
    [#3169](https://github.com/Azure/PSRule.Rules.Azure/issues/3169)

## v1.40.0-B0063 (pre-release)

What's changed since pre-release v1.40.0-B0029:

- Updated rules:
  - Microsoft Defender for Cloud:
    - Updated `Azure.DefenderCloud.Contact` to use `emails` property and removed `phone` by @BernieWhite.
      [#3117](https://github.com/Azure/PSRule.Rules.Azure/issues/3117)
      - Renamed rule to `Azure.Defender.SecurityContact` to better align with naming for defender rules.
      - Bumped rule set to `2024_12`.
- Bug fixes:
  - Fixed evaluation of `Azure.NSG.LateralTraversal` with empty string properties by @BernieWhite.
    [#3130](https://github.com/Azure/PSRule.Rules.Azure/issues/3130)
  - Fixed evaluation of `Azure.Deployment.AdminUsername` with symbolic references by @BernieWhite.
    [#3146](https://github.com/Azure/PSRule.Rules.Azure/issues/3146)

## v1.40.0-B0029 (pre-release)

What's changed since v1.39.3:

- Updated rules:
  - Deployment:
    - Updated `Azure.Deployment.SecureValue` to check additional resource types by @BernieWhite.
      [#2650](https://github.com/Azure/PSRule.Rules.Azure/issues/2650)
      [#2651](https://github.com/Azure/PSRule.Rules.Azure/issues/2651)
      - Added support for container apps secret properties.
      - Added support for deployment script secret properties.
      - Bumped rule set to `2024_12`.
    - Updated `Azure.Deployment.SecureParameter` to reduce false positives by @BernieWhite.
      [#3149](https://github.com/Azure/PSRule.Rules.Azure/issues/3149)
      - Parameters named ending with `name`, `uri`, `url`, `path`, `type`, `id`, or `options` are ignored.
      - The `customerManagedKey` parameter is ignored.
- Engineering:
  - Migrated Azure samples into PSRule for Azure by @BernieWhite.
    [#3085](https://github.com/Azure/PSRule.Rules.Azure/issues/3085)
  - Quality updates to rule documentation by @BernieWhite.
    [#3102](https://github.com/Azure/PSRule.Rules.Azure/issues/3102)
- Bug fixes:
  - Fixed output map expansion with resource IDs by @BernieWhite.
    [#3153](https://github.com/Azure/PSRule.Rules.Azure/issues/3153)

## v1.39.3

What's changed since v1.39.2:

- Bug fixes:
  - Fixed index out of bounds for existing symbolic name reference by @BernieWhite.
    [#3129](https://github.com/Azure/PSRule.Rules.Azure/issues/3129)

## v1.39.2

What's changed since v1.39.1:

- Bug fixes:
  - Fixed user-defined function reference to exported variable by @BernieWhite.
    [#3120](https://github.com/Azure/PSRule.Rules.Azure/issues/3120)
  - Fixed name expand of existing resource references by @BernieWhite.
    [#3123](https://github.com/Azure/PSRule.Rules.Azure/issues/3123)

## v1.39.1

What's changed since v1.39.0:

- Bug fixes:
  - Fixed `GetBicepParamResources` exception when expanding `Microsoft.Graph/groups` resource by @BernieWhite.
    [#3062](https://github.com/Azure/PSRule.Rules.Azure/issues/3062)
  - Fixed `Azure.AppGw.AvailabilityZone` passes when a zonal configuration is used by @BernieWhite.
    [#3061](https://github.com/Azure/PSRule.Rules.Azure/issues/3061)
  - Fixed conditional secret as parameter or placeholder by @BernieWhite.
    [#2054](https://github.com/Azure/PSRule.Rules.Azure/issues/2054)

## v1.39.0

What's changed since v1.38.0:

- New features:
  - Added September 2024 baselines `Azure.GA_2024_09` and `Azure.Preview_2024_09` by @BernieWhite.
    [#3048](https://github.com/Azure/PSRule.Rules.Azure/issues/3048)
    - Includes rules released before or during September 2024.
    - Marked `Azure.GA_2024_06` and `Azure.Preview_2024_06` baselines as obsolete.
- New rules:
  - Azure Kubernetes Service:
    - Verify that clusters have kube-audit logging disabled when not required by @BenjaminEngeset.
      [#2450](https://github.com/Azure/PSRule.Rules.Azure/issues/2450)
    - Verify that clusters have the customer-controlled maintenance windows `aksManagedAutoUpgradeSchedule` and `aksManagedNodeOSUpgradeSchedule` configured by @BenjaminEngeset.
      [#2444](https://github.com/Azure/PSRule.Rules.Azure/issues/2444)
  - App Service:
    - Verify that app service plans have availability zones configured by @BenjaminEngeset.
      [#2964](https://github.com/Azure/PSRule.Rules.Azure/issues/2964)
  - App Service Environment:
    - Verify that app service environments have availability zones configured by @BenjaminEngeset.
      [#2964](https://github.com/Azure/PSRule.Rules.Azure/issues/2964)
  - Azure SQL Database:
    - Verify that Azure SQL databases have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2956](https://github.com/Azure/PSRule.Rules.Azure/issues/2956)
  - Azure SQL Managed Instance:
    - Verify that Azure SQL Managed Instances have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2979](https://github.com/Azure/PSRule.Rules.Azure/issues/2979)
  - Service Bus:
    - Verify that service bus namespaces have geo-replication configured by @BenjaminEngeset.
      [#2988](https://github.com/Azure/PSRule.Rules.Azure/issues/2988)
  - Virtual Machine:
    - Verify that virtual machines does not have public IPs attached by @BenjaminEngeset.
      [#11](https://github.com/Azure/PSRule.Rules.Azure/issues/11)
    - Verify that multi-tenant Hosting Rights are used for Windows client VMs by @BenjaminEngeset.
      [#432](https://github.com/Azure/PSRule.Rules.Azure/issues/432)
    - Verify that availability set members are in a backend pool by @BenjaminEngeset.
      [#67](https://github.com/Azure/PSRule.Rules.Azure/issues/67)
  - Virtual Machine Scale Sets:
    - Verify that virtual machine scale set instances does not have public IPs attached by @BenjaminEngeset.
      [#3014](https://github.com/Azure/PSRule.Rules.Azure/issues/3014)
  - Virtual Network:
    - Verify that zonal-deployed Azure firewalls uses Azure NAT Gateway for outbound access by @BenjaminEngeset.
      [##3005](https://github.com/Azure/PSRule.Rules.Azure/issues/#3005)
    - Verify that subnets have disabled default outbound access for virtual machines by @BenjaminEngeset.
      [#3001](https://github.com/Azure/PSRule.Rules.Azure/issues/3001)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.AuditLogs` documentation to call out important specific of the `kube-audit` log by @BernieWhite.
      [#2449](https://github.com/Azure/PSRule.Rules.Azure/issues/2449)
    - Updated `Azure.AKS.Version` to use `1.29.7` as the minimum version by @BernieWhite.
      [#3042](https://github.com/Azure/PSRule.Rules.Azure/issues/3042)
  - Container Apps:
    - Updated `Azure.ContainerApp.AvailabilityZone` to check for infrastructure subnet by @BernieWhite.
      [#3068](https://github.com/Azure/PSRule.Rules.Azure/issues/3068)
      - Configuring an infrastructure subnet is a requirement for enabling zone redundancy.
        Both rule and documentation have been updated to clearly call this out.
  - Virtual Network:
    - Updated `Azure.VNET.UseNSGs` to correctly handle cases for special purpose and customer-excluded subnets by @BenjaminEngeset.
      [#3007](https://github.com/Azure/PSRule.Rules.Azure/issues/3007)
- General improvements:
  - **Important change:** Replaced the `Azure_AKSNodeMinimumMaxPods` option with `AZURE_AKS_POOL_MINIMUM_MAXPODS` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AKSNodeMinimumMaxPods` is set it will be used instead of `AZURE_AKS_POOL_MINIMUM_MAXPODS`.
    - If only `AZURE_AKS_POOL_MINIMUM_MAXPODS` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AKSNodeMinimumMaxPods` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AKSNodeMinimumMaxPods` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
  - **Important change:** Replaced the `Azure_MinimumCertificateLifetime` option with `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_MinimumCertificateLifetime` is set it will be used instead of `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME`.
    - If only `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_MinimumCertificateLifetime` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_MinimumCertificateLifetime` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
  - Add binding configuration to policy as rules docs by @BernieWhite.
    [#2995](https://github.com/Azure/PSRule.Rules.Azure/issues/2995)
  - Updated resource providers and policy aliases.
    [#3074](https://github.com/Azure/PSRule.Rules.Azure/pull/3074)
- Engineering:
  - Bump development tools to .NET 8.0 SDK by @BernieWhite.
    [#3017](https://github.com/Azure/PSRule.Rules.Azure/issues/3017)
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Bump xunit to v2.9.0.
    [#2982](https://github.com/Azure/PSRule.Rules.Azure/pull/2982)
  - Bump xunit.runner.visualstudio to v2.8.2.
    [#2982](https://github.com/Azure/PSRule.Rules.Azure/pull/2982)
- Bug fixed:
  - Fixed expansion with deployments by resource ID at management group by @BernieWhite
    [#3013](https://github.com/Azure/PSRule.Rules.Azure/issues/3013)
  - Fixed subscription aliases don't support tags by @BernieWhite.
    [#3021](https://github.com/Azure/PSRule.Rules.Azure/issues/3021)
  - Fixed `Azure.AppService.AvailabilityZone` only detects premium by tier property @BenjaminEngeset.
    [#3034](https://github.com/Azure/PSRule.Rules.Azure/issues/3034)
  - Fixed loading of expansion options from non-default options file @BernieWhite.
    [#3033](https://github.com/Azure/PSRule.Rules.Azure/issues/3033)
  - Fixed TLS defaults for `Azure.Redis.MinTLS` and `Azure.RedisEnterprise.MinTLS` by @BernieWhite.
    [#3066](https://github.com/Azure/PSRule.Rules.Azure/issues/3066)
  - Fixed symbolic expand for existing with conditional cases by @BernieWhite.
    [#2917](https://github.com/Azure/PSRule.Rules.Azure/issues/2917)

What's changed since pre-release v1.39.0-B0249:

- No additional changes.

## v1.39.0-B0249 (pre-release)

What's changed since pre-release v1.39.0-B0182:

- Bug fixes:
  - Fixed symbolic expand for existing with conditional cases by @BernieWhite.
    [#2917](https://github.com/Azure/PSRule.Rules.Azure/issues/2917)

## v1.39.0-B0182 (pre-release)

What's changed since pre-release v1.39.0-B0118:

- Updated rules:
  - Container Apps:
    - Updated `Azure.ContainerApp.AvailabilityZone` to check for infrastructure subnet by @BernieWhite.
      [#3068](https://github.com/Azure/PSRule.Rules.Azure/issues/3068)
      - Configuring an infrastructure subnet is a requirement for enabling zone redundancy.
        Both rule and documentation have been updated to clearly call this out.
- General improvements:
  - Updated resource providers and policy aliases.
    [#3074](https://github.com/Azure/PSRule.Rules.Azure/pull/3074)
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Bug fixes:
  - Fixed TLS defaults for `Azure.Redis.MinTLS` and `Azure.RedisEnterprise.MinTLS` by @BernieWhite.
    [#3066](https://github.com/Azure/PSRule.Rules.Azure/issues/3066)

## v1.39.0-B0118 (pre-release)

What's changed since pre-release v1.39.0-B0072:

- New features:
  - Added September 2024 baselines `Azure.GA_2024_09` and `Azure.Preview_2024_09` by @BernieWhite.
    [#3048](https://github.com/Azure/PSRule.Rules.Azure/issues/3048)
    - Includes rules released before or during September 2024.
    - Marked `Azure.GA_2024_06` and `Azure.Preview_2024_06` baselines as obsolete.

## v1.39.0-B0072 (pre-release)

What's changed since pre-release v1.39.0-B0029:

- New rules:
  - Virtual Machine:
    - Verify that virtual machines does not have public IPs attached by @BenjaminEngeset.
      [#11](https://github.com/Azure/PSRule.Rules.Azure/issues/11)
    - Verify that multi-tenant Hosting Rights are used for Windows client VMs by @BenjaminEngeset.
      [#432](https://github.com/Azure/PSRule.Rules.Azure/issues/432)
    - Verify that availability set members are in a backend pool by @BenjaminEngeset.
      [#67](https://github.com/Azure/PSRule.Rules.Azure/issues/67)
  - Virtual Machine Scale Sets:
    - Verify that virtual machine scale set instances does not have public IPs attached by @BenjaminEngeset.
      [#3014](https://github.com/Azure/PSRule.Rules.Azure/issues/3014)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.AuditLogs` documentation to call out important specific of the `kube-audit` log by @BernieWhite.
      [#2449](https://github.com/Azure/PSRule.Rules.Azure/issues/2449)
    - Updated `Azure.AKS.Version` to use `1.29.7` as the minimum version by @BernieWhite.
      [#3042](https://github.com/Azure/PSRule.Rules.Azure/issues/3042)
- General improvements:
  - **Important change:** Replaced the `Azure_AKSNodeMinimumMaxPods` option with `AZURE_AKS_POOL_MINIMUM_MAXPODS` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AKSNodeMinimumMaxPods` is set it will be used instead of `AZURE_AKS_POOL_MINIMUM_MAXPODS`.
    - If only `AZURE_AKS_POOL_MINIMUM_MAXPODS` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AKSNodeMinimumMaxPods` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AKSNodeMinimumMaxPods` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
  - **Important change:** Replaced the `Azure_MinimumCertificateLifetime` option with `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_MinimumCertificateLifetime` is set it will be used instead of `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME`.
    - If only `AZURE_APIM_MINIMUM_CERTIFICATE_LIFETIME` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_MinimumCertificateLifetime` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_MinimumCertificateLifetime` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
- Engineering:
  - Bump development tools to .NET 8.0 SDK by @BernieWhite.
    [#3017](https://github.com/Azure/PSRule.Rules.Azure/issues/3017)
- Bug fixed:
  - Fixed expansion with deployments by resource ID at management group by @BernieWhite
    [#3013](https://github.com/Azure/PSRule.Rules.Azure/issues/3013)
  - Fixed subscription aliases don't support tags by @BernieWhite.
    [#3021](https://github.com/Azure/PSRule.Rules.Azure/issues/3021)
  - Fixed `Azure.AppService.AvailabilityZone` only detects premium by tier property @BenjaminEngeset.
    [#3034](https://github.com/Azure/PSRule.Rules.Azure/issues/3034)
  - Fixed loading of expansion options from non-default options file @BernieWhite.
    [#3033](https://github.com/Azure/PSRule.Rules.Azure/issues/3033)

## v1.39.0-B0029 (pre-release)

What's changed since pre-release v1.39.0-B0009:

- New rules:
  - Azure Kubernetes Service:
    - Verify that clusters have kube-audit logging disabled when not required by @BenjaminEngeset.
      [#2450](https://github.com/Azure/PSRule.Rules.Azure/issues/2450)
    - Verify that clusters have the customer-controlled maintenance windows `aksManagedAutoUpgradeSchedule` and `aksManagedNodeOSUpgradeSchedule` configured by @BenjaminEngeset.
      [#2444](https://github.com/Azure/PSRule.Rules.Azure/issues/2444)
  - Virtual Network:
    - Verify that zonal-deployed Azure firewalls uses Azure NAT Gateway for outbound access by @BenjaminEngeset.
      [##3005](https://github.com/Azure/PSRule.Rules.Azure/issues/#3005)
    - Verify that subnets have disabled default outbound access for virtual machines by @BenjaminEngeset.
      [#3001](https://github.com/Azure/PSRule.Rules.Azure/issues/3001)
- Updated rules:
  - Virtual Network:
    - Updated `Azure.VNET.UseNSGs` to correctly handle cases for special purpose and customer-excluded subnets by @BenjaminEngeset.
      [#3007](https://github.com/Azure/PSRule.Rules.Azure/issues/3007)
- General improvements:
  - Add binding configuration to policy as rules docs by @BernieWhite.
    [#2995](https://github.com/Azure/PSRule.Rules.Azure/issues/2995)

## v1.39.0-B0009 (pre-release)

What's changed since v1.38.0:

- New rules:
  - App Service:
    - Verify that app service plans have availability zones configured by @BenjaminEngeset.
      [#2964](https://github.com/Azure/PSRule.Rules.Azure/issues/2964)
  - App Service Environment:
    - Verify that app service environments have availability zones configured by @BenjaminEngeset.
      [#2964](https://github.com/Azure/PSRule.Rules.Azure/issues/2964)
  - Azure SQL Database:
    - Verify that Azure SQL databases have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2956](https://github.com/Azure/PSRule.Rules.Azure/issues/2956)
  - Azure SQL Managed Instance:
    - Verify that Azure SQL Managed Instances have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2979](https://github.com/Azure/PSRule.Rules.Azure/issues/2979)
  - Service Bus:
    - Verify that service bus namespaces have geo-replication configured by @BenjaminEngeset.
      [#2988](https://github.com/Azure/PSRule.Rules.Azure/issues/2988)
- Engineering:
  - Bump xunit to v2.9.0.
    [#2982](https://github.com/Azure/PSRule.Rules.Azure/pull/2982)
  - Bump xunit.runner.visualstudio to v2.8.2.
    [#2982](https://github.com/Azure/PSRule.Rules.Azure/pull/2982)

## v1.38.0

What's changed since v1.37.0:

- New features:
  - Added June 2024 baselines `Azure.GA_2024_06` and `Azure.Preview_2024_06` by @BernieWhite.
    [#2961](https://github.com/Azure/PSRule.Rules.Azure/issues/2961)
    - Includes rules released before or during June 2024.
    - Marked `Azure.GA_2024_03` and `Azure.Preview_2024_03` baselines as obsolete.
- New rules:
  - Azure Database for MySQL:
    - Verify that Azure Database for MySQL servers have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2916](https://github.com/Azure/PSRule.Rules.Azure/issues/2916)
    - Verify that servers have zone-redundant high availability (HA) configured by @BenjaminEngeset.
      [#2914](https://github.com/Azure/PSRule.Rules.Azure/issues/2914)
  - Azure Database for PostgreSQL:
    - Verify that Azure Database for PostgreSQL servers have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2927](https://github.com/Azure/PSRule.Rules.Azure/issues/2927)
    - Verify that servers have zone-redundant high availability (HA) configured by @BenjaminEngeset.
      [#2932](https://github.com/Azure/PSRule.Rules.Azure/issues/2932)
  - Azure Firewall:
    - Verify that firewalls have availability zones configured by @BenjaminEngeset.
      [#2909](https://github.com/Azure/PSRule.Rules.Azure/issues/2909)
  - Azure Kubernetes Service:
    - Added check to automatically upgrade AKS cluster node image by @sharmilamusunuru.
      [#2445](https://github.com/Azure/PSRule.Rules.Azure/issues/2445)
  - Azure Virtual Desktop:
    - Added check for scheduled agent updates on host pools by @BernieWhite.
      [#2946](https://github.com/Azure/PSRule.Rules.Azure/issues/2946)
  - Cosmos DB:
    - Verify that Cosmos DB accounts have continuous backup configured by @BenjaminEngeset.
      [#2954](https://github.com/Azure/PSRule.Rules.Azure/issues/2954)
  - Virtual Network Gateway:
    - Verify that VPN/ExpressRoute gateways have a customer-controlled maintenance configuration configured by @BenjaminEngeset.
      [#2910](https://github.com/Azure/PSRule.Rules.Azure/issues/2910)
  - Virtual Machine Scale Sets:
    - Verify that virtual machine scale sets have best-effort zone balance configured by @BenjaminEngeset.
      [#2901](https://github.com/Azure/PSRule.Rules.Azure/issues/2901)
    - Verify that virtual machine scale sets have availability zones configured by @BenjaminEngeset.
      [#2902](https://github.com/Azure/PSRule.Rules.Azure/issues/2902)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use `1.28.9` as the minimum version by @BernieWhite.
      [#2930](https://github.com/Azure/PSRule.Rules.Azure/issues/2930)
  - Virtual Machine:
    - Updated `Azure.VM.MaintenanceConfig` to align to the reliability pillar by @BernieWhite.
      [#2925](https://github.com/Azure/PSRule.Rules.Azure/issues/2925)
      - Promoted to GA and bumped rule set to `2024_06`.
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Bump Pester to v5.6.0.
    [#2934](https://github.com/Azure/PSRule.Rules.Azure/pull/2934)
  - Bump PSScriptAnalyzer to v1.22.0.
    [#2934](https://github.com/Azure/PSRule.Rules.Azure/pull/2934)
- Bug fixes:
  - Fixed handling of multi-line descriptions for policy definition and assignment exports by @BernieWhite.
    [#2973](https://github.com/Azure/PSRule.Rules.Azure/issues/2973)
  - Fixed support for `references` function by @BernieWhite.
    [#2922](https://github.com/Azure/PSRule.Rules.Azure/issues/2922)
  - Fixed group by subscription casing when exporting in-flight resources by @BernieWhite.
    [#2957](https://github.com/Azure/PSRule.Rules.Azure/issues/2957)
  - Fixed install Az.Resources warning by @BernieWhite.
    [#2887](https://github.com/Azure/PSRule.Rules.Azure/issues/2887)
    - Added new configuration option set by environment variable to suppress the warning.
    - Set `PSRULE_AZURE_RESOURCE_MODULE_NOWARN` to `true` to suppress the warning.
  - Fixed `filter` on unknown runtime property by @BernieWhite.
    [#2966](https://github.com/Azure/PSRule.Rules.Azure/issues/2966)
  - Fixed failed to expand with direct outputs reference by @BernieWhite.
    [#2935](https://github.com/Azure/PSRule.Rules.Azure/issues/2935)
  - Fixed identification of `list*` function false positive with resource by @BernieWhite.
    [#2919](https://github.com/Azure/PSRule.Rules.Azure/issues/2919)
  - Fixed documentation bugs for container apps by @BernieWhite.
    [#2876](https://github.com/Azure/PSRule.Rules.Azure/issues/2876)

What's changed since pre-release v1.38.0-B0068:

- No additional changes.

## v1.38.0-B0106 (pre-release)

What's changed since pre-release v1.38.0-B0068:

- New rules:
  - Cosmos DB:
    - Verify that Cosmos DB accounts have continuous backup configured by @BenjaminEngeset.
      [#2954](https://github.com/Azure/PSRule.Rules.Azure/issues/2954)
- Bug fixes:
  - Rollback Az.Resources to v6.7.0 by @BernieWhite.
    [#2970](https://github.com/Azure/PSRule.Rules.Azure/issues/2970)
  - Fixed handling of multi-line descriptions for policy definition and assignment exports by @BernieWhite.
    [#2973](https://github.com/Azure/PSRule.Rules.Azure/issues/2973)

## v1.38.0-B0068 (pre-release)

What's changed since pre-release v1.38.0-B0034:

- New features:
  - Added March 2024 baselines `Azure.GA_2024_06` and `Azure.Preview_2024_06` by @BernieWhite.
    [#2961](https://github.com/Azure/PSRule.Rules.Azure/issues/2961)
    - Includes rules released before or during June 2024.
    - Marked `Azure.GA_2024_03` and `Azure.Preview_2024_03` baselines as obsolete.
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Bug fixes:
  - Fixed support for `references` function by @BernieWhite.
    [#2922](https://github.com/Azure/PSRule.Rules.Azure/issues/2922)
  - Fixed group by subscription casing when exporting in-flight resources by @BernieWhite.
    [#2957](https://github.com/Azure/PSRule.Rules.Azure/issues/2957)
  - Fixed install Az.Resources warning by @BernieWhite.
    [#2887](https://github.com/Azure/PSRule.Rules.Azure/issues/2887)
    - Added new configuration option set by environment variable to suppress the warning.
    - Set `PSRULE_AZURE_RESOURCE_MODULE_NOWARN` to `true` to suppress the warning.
  - Fixed `filter` on unknown runtime property by @BernieWhite.
    [#2966](https://github.com/Azure/PSRule.Rules.Azure/issues/2966)

## v1.38.0-B0034 (pre-release)

What's changed since pre-release v1.38.0-B0011:

- New rules:
  - Azure Kubernetes Service:
    - Added check to automatically upgrade AKS cluster node image by @sharmilamusunuru.
      [#2445](https://github.com/Azure/PSRule.Rules.Azure/issues/2445)
  - Azure Virtual Desktop:
    - Added check for scheduled agent updates on host pools by @BernieWhite.
      [#2946](https://github.com/Azure/PSRule.Rules.Azure/issues/2946)
  - Virtual Machine Scale Sets:
    - Verify that virtual machine scale sets have best-effort zone balance configured by @BenjaminEngeset.
      [#2901](https://github.com/Azure/PSRule.Rules.Azure/issues/2901)
    - Verify that virtual machine scale sets have availability zones configured by @BenjaminEngeset.
      [#2902](https://github.com/Azure/PSRule.Rules.Azure/issues/2902)
- Engineering:
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Bug fixes:
  - Fixed failed to expand with direct outputs reference by @BernieWhite.
    [#2935](https://github.com/Azure/PSRule.Rules.Azure/issues/2935)
  - Fixed identification of `list*` function false positive with resource by @BernieWhite.
    [#2919](https://github.com/Azure/PSRule.Rules.Azure/issues/2919)
  - Fixed documentation bugs for container apps by @BernieWhite.
    [#2876](https://github.com/Azure/PSRule.Rules.Azure/issues/2876)

## v1.38.0-B0011 (pre-release)

What's changed since v1.37.0:

- New rules:
  - Azure Database for MySQL:
    - Verify that Azure Database for MySQL servers have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2916](https://github.com/Azure/PSRule.Rules.Azure/issues/2916)
    - Verify that servers have zone-redundant high availability (HA) configured by @BenjaminEngeset.
      [#2914](https://github.com/Azure/PSRule.Rules.Azure/issues/2914)
  - Azure Database for PostgreSQL:
    - Verify that Azure Database for PostgreSQL servers have a customer-controlled maintenance window configured by @BenjaminEngeset.
      [#2927](https://github.com/Azure/PSRule.Rules.Azure/issues/2927)
    - Verify that servers have zone-redundant high availability (HA) configured by @BenjaminEngeset.
      [#2932](https://github.com/Azure/PSRule.Rules.Azure/issues/2932)
  - Azure Firewall:
    - Verify that firewalls have availability zones configured by @BenjaminEngeset.
      [#2909](https://github.com/Azure/PSRule.Rules.Azure/issues/2909)
  - Virtual Network Gateway:
    - Verify that VPN/ExpressRoute gateways have a customer-controlled maintenance configuration configured by @BenjaminEngeset.
      [#2910](https://github.com/Azure/PSRule.Rules.Azure/issues/2910)
- Updated rules:
  - Virtual Machine:
    - Updated `Azure.VM.MaintenanceConfig` to align to the reliability pillar by @BernieWhite.
      [#2925](https://github.com/Azure/PSRule.Rules.Azure/issues/2925)
      - Promoted to GA and bumped rule set to `2024_06`.
  - Updated `Azure.AKS.Version` to use `1.28.9` as the minimum version by @BernieWhite.
    [#2930](https://github.com/Azure/PSRule.Rules.Azure/issues/2930)
- Engineering:
  - Bump Pester to v5.6.0.
    [#2934](https://github.com/Azure/PSRule.Rules.Azure/pull/2934)
  - Bump Az.Resources to v7.1.0.
    [#2934](https://github.com/Azure/PSRule.Rules.Azure/pull/2934)
  - Bump PSScriptAnalyzer to v1.22.0.
    [#2934](https://github.com/Azure/PSRule.Rules.Azure/pull/2934)

## v1.37.0

What's changed since v1.36.0:

- New features:
  - Added support for new Bicep language features introduced in v0.27.1 by @BernieWhite.
    [#2860](https://github.com/Azure/PSRule.Rules.Azure/issues/2860)
    [#2859](https://github.com/Azure/PSRule.Rules.Azure/issues/2859)
    - Added support for `shallowMerge`, `groupBy`, `objectKeys`, and `mapValues`.
    - Updated syntax for Bicep lambda usage of `map`, `reduce`, and `filter` which now support indices.
    - Added support for spread operator.
- New rules:
  - App Service:
    - Check that applications uses supported Node.js runtime versions by @BenjaminEngeset.
      [#2879](https://github.com/Azure/PSRule.Rules.Azure/issues/2879)
  - Application Gateway:
    - Check that WAF v2 doesn't use legacy WAF configuration by @BenjaminEngeset.
      [#2877](https://github.com/Azure/PSRule.Rules.Azure/issues/2877)
  - Azure Cache for Redis:
    - Verify that cache instances have Entra ID authentication enabled by @BenjaminEngeset.
      [#2899](https://github.com/Azure/PSRule.Rules.Azure/issues/2899)
  - Azure Managed Grafana:
    - Check that Azure Managed Grafana workspaces uses Grafana version 10 by @BenjaminEngeset.
      [#2878](https://github.com/Azure/PSRule.Rules.Azure/issues/2878)
  - Cosmos DB:
    - Check that database accounts use a paid tier by @BernieWhite.
      [#2845](https://github.com/Azure/PSRule.Rules.Azure/issues/2845)
    - Check that database accounts have local authentication disabled by @BenjaminEngeset.
      [#2846](https://github.com/Azure/PSRule.Rules.Azure/issues/2846)
    - Check that database accounts have public network access disabled by @BenjaminEngeset.
      [#2702](https://github.com/Azure/PSRule.Rules.Azure/issues/2702)
  - Event Hub:
    - Check that access to the namespace endpoints is restricted to only allowed sources by @BenjaminEngeset.
      [#2701](https://github.com/Azure/PSRule.Rules.Azure/issues/2701)
  - Log Analytics:
    - Check that workspaces have workspace replication enabled by @BenjaminEngeset.
      [#2893](https://github.com/Azure/PSRule.Rules.Azure/issues/2893)
  - Virtual Machine Scale Sets:
    - Check that automatic instance repairs are enabled by @BenjaminEngeset.
      [#2895](https://github.com/Azure/PSRule.Rules.Azure/issues/2895)
- Updated rules:
  - API Management:
    - **Important change**: Updated `Azure.APIM.AvailabilityZone` to improve accuracy with non-premium SKUs by @BenjaminEngeset.
      [#2788](https://github.com/Azure/PSRule.Rules.Azure/issues/2788)
      - Removed the `If` Premium SKU.
      - Added check for Premium SKU.
      - Bumped rule set to `2024_06`.
    - **Important change**: Updated `Azure.APIM.MultiRegion` to improve accuracy with non-premium SKUs by @BenjaminEngeset.
      [#2787](https://github.com/Azure/PSRule.Rules.Azure/issues/2787)
      - Removed the `If` Premium SKU.
      - Added check for Premium SKU.
      - Bumped rule set to `2024_06`.
  - Deployment:
    - Add additional exclusions for `Azure.Deployment.SecureParameter` by @BernieWhite.
      [#2857](https://github.com/Azure/PSRule.Rules.Azure/issues/2857)
- General improvements:
  - Quality updates to documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Updated resource providers and policy aliases.
    [#2880](https://github.com/Azure/PSRule.Rules.Azure/pull/2880)
  - Added support for `split` and `concat` functions during policy export by @BernieWhite.
    [#2851](https://github.com/Azure/PSRule.Rules.Azure/issues/2851)
- Engineering:
  - Bump xunit to v2.8.1.
    [#2892](https://github.com/Azure/PSRule.Rules.Azure/pull/2892)
  - Bump xunit.runner.visualstudio to v2.8.1.
    [#2891](https://github.com/Azure/PSRule.Rules.Azure/pull/2891)
  - Bump System.Management.Automation to 7.3.12.
    [#2868](https://github.com/Azure/PSRule.Rules.Azure/pull/2868)
  - Bump Microsoft.NET.Test.Sdk to v17.10.0.
    [#2884](https://github.com/Azure/PSRule.Rules.Azure/pull/2884)
- Bug fixed:
  - Fixed `union` does not perform deep merge or keep property order by @BernieWhite.
    [#2885](https://github.com/Azure/PSRule.Rules.Azure/issues/2885)
  - Fixed dependency ordering for cross scope deployments by @BernieWhite.
    [#2850](https://github.com/Azure/PSRule.Rules.Azure/issues/2850)

What's changed since pre-release v1.37.0-B0071:

- No additional changes.

## v1.37.0-B0071 (pre-release)

What's changed since pre-release v1.37.0-B0034:

- New rules:
  - App Service:
    - Check that applications uses supported Node.js runtime versions by @BenjaminEngeset.
      [#2879](https://github.com/Azure/PSRule.Rules.Azure/issues/2879)
  - Azure Cache for Redis:
    - Verify that cache instances have Entra ID authentication enabled by @BenjaminEngeset.
      [#2899](https://github.com/Azure/PSRule.Rules.Azure/issues/2899)
  - Log Analytics:
    - Check that workspaces have workspace replication enabled by @BenjaminEngeset.
      [#2893](https://github.com/Azure/PSRule.Rules.Azure/issues/2893)
  - Virtual Machine Scale Sets:
    - Check that automatic instance repairs are enabled by @BenjaminEngeset.
      [#2895](https://github.com/Azure/PSRule.Rules.Azure/issues/2895)
- Updated rules:
  - API Management:
    - **Important change**: Updated `Azure.APIM.MultiRegion` to improve accuracy with non-premium SKUs by @BenjaminEngeset.
      [#2787](https://github.com/Azure/PSRule.Rules.Azure/issues/2787)
      - Removed the `If` Premium SKU.
      - Added check for Premium SKU.
      - Bumped rule set to `2024_06`.
- General improvements:
  - Added support for `split` and `concat` functions during policy export by @BernieWhite.
    [#2851](https://github.com/Azure/PSRule.Rules.Azure/issues/2851)
- Engineering:
  - Bump xunit to v2.8.1.
    [#2892](https://github.com/Azure/PSRule.Rules.Azure/pull/2892)
  - Bump xunit.runner.visualstudio to v2.8.1.
    [#2891](https://github.com/Azure/PSRule.Rules.Azure/pull/2891)

## v1.37.0-B0034 (pre-release)

What's changed since pre-release v1.37.0-B0009:

- New features:
  - Added support for new Bicep language features introduced in v0.27.1 by @BernieWhite.
    [#2860](https://github.com/Azure/PSRule.Rules.Azure/issues/2860)
    [#2859](https://github.com/Azure/PSRule.Rules.Azure/issues/2859)
    - Added support for `shallowMerge`, `groupBy`, `objectKeys`, and `mapValues`.
    - Updated syntax for Bicep lambda usage of `map`, `reduce`, and `filter` which now support indices.
    - Added support for spread operator.
- New rules:
  - Application Gateway:
    - Check that WAF v2 doesn't use legacy WAF configuration by @BenjaminEngeset.
      [#2877](https://github.com/Azure/PSRule.Rules.Azure/issues/2877)
  - Azure Managed Grafana:
    - Check that Azure Managed Grafana workspaces uses Grafana version 10 by @BenjaminEngeset.
      [#2878](https://github.com/Azure/PSRule.Rules.Azure/issues/2878)
  - Cosmos DB:
    - Check that database accounts have local authentication disabled by @BenjaminEngeset.
      [#2846](https://github.com/Azure/PSRule.Rules.Azure/issues/2846)
    - Check that database accounts have public network access disabled by @BenjaminEngeset.
      [#2702](https://github.com/Azure/PSRule.Rules.Azure/issues/2702)
  - Event Hub:
    - Check that access to the namespace endpoints is restricted to only allowed sources by @BenjaminEngeset.
      [#2701](https://github.com/Azure/PSRule.Rules.Azure/issues/2701)
- Updated rules:
  - API Management:
    - **Important change**: Updated `Azure.APIM.AvailabilityZone` to improve accuracy with non-premium SKUs by @BenjaminEngeset.
      [#2788](https://github.com/Azure/PSRule.Rules.Azure/issues/2788)
      - Removed the `If` Premium SKU.
      - Added check for Premium SKU.
      - Bumped rule set to `2024_06`.
- General improvements:
  - Updated resource providers and policy aliases.
    [#2880](https://github.com/Azure/PSRule.Rules.Azure/pull/2880)
- Engineering:
  - Bump xunit to v2.8.0.
    [#2870](https://github.com/Azure/PSRule.Rules.Azure/pull/2870)
  - Bump xunit.runner.visualstudio to v2.8.0.
    [#2871](https://github.com/Azure/PSRule.Rules.Azure/pull/2871)
  - Bump System.Management.Automation to 7.3.12.
    [#2868](https://github.com/Azure/PSRule.Rules.Azure/pull/2868)
  - Bump Microsoft.NET.Test.Sdk to v17.10.0.
    [#2884](https://github.com/Azure/PSRule.Rules.Azure/pull/2884)
- Bug fixed:
  - Fixed `union` does not perform deep merge or keep property order by @BernieWhite.
    [#2885](https://github.com/Azure/PSRule.Rules.Azure/issues/2885)

## v1.37.0-B0009 (pre-release)

What's changed since v1.36.0:

- New rules:
  - Cosmos DB:
    - Check that database accounts use a paid tier by @BernieWhite.
      [#2845](https://github.com/Azure/PSRule.Rules.Azure/issues/2845)
- Updated rules:
  - Deployment:
    - Add additional exclusions for `Azure.Deployment.SecureParameter` by @BernieWhite.
      [#2857](https://github.com/Azure/PSRule.Rules.Azure/issues/2857)
- General improvements:
  - Quality updates to documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Bug fixes:
  - Fixed dependency ordering for cross scope deployments by @BernieWhite.
    [#2850](https://github.com/Azure/PSRule.Rules.Azure/issues/2850)

## v1.36.0

What's changed since v1.35.3:

- New rules:
  - Container App:
    - Check that Container Apps have a minimum number of replicas by @BernieWhite.
      [#2790](https://github.com/Azure/PSRule.Rules.Azure/issues/2790)
    - Check that Container App environments are zone redundant by @BernieWhite.
      [#2791](https://github.com/Azure/PSRule.Rules.Azure/issues/2791)
  - Cosmos DB:
    - Check that database accounts only accept a minimum of TLS 1.2 by @BernieWhite.
      [#2809](https://github.com/Azure/PSRule.Rules.Azure/issues/2809)
  - Entra Domain Services:
    - Check that instances use a minimum version of NTLM by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
    - Check that instances use a minimum version of TLS by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
    - Check that instances do not use RC4 encryption by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
- General improvements:
  - **Important change**: Deprecated rules with no clear WAF alignment by @BernieWhite.
    [#2493](https://github.com/Azure/PSRule.Rules.Azure/issues/2493)
    - The following rules are deprecated:
      - `Azure.Template.UseParameters`
      - `Azure.Template.UseVariables`
      - `Azure.Template.DefineParameters`
      - `Azure.Template.ValidSecretRef`
    - These rules have been deprecated and will be removed in v2.
    - See [deprecations][2] for more information.
  - Quality updates to documentation by @lukemurraynz @BernieWhite.
    [#2789](https://github.com/Azure/PSRule.Rules.Azure/pull/2789)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Additional policies added to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Bug fixes:
  - Fixed not found warning when exporting firewall policy `signatureOverrides` by @BernieWhite.
    [#2806](https://github.com/Azure/PSRule.Rules.Azure/issues/2806)
  - Fixed `Azure.Storage.UseReplication` to allow for zone-redundant replication by @sebassem.
    [#2827](https://github.com/Azure/PSRule.Rules.Azure/issues/2827)
  - Fixed nested usage of `listKeys` mocks by @BernieWhite.
    [#2829](https://github.com/Azure/PSRule.Rules.Azure/issues/2829)

What's changed since pre-release v1.36.0-B0077:

- General improvements:
  - Quality updates to documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)

## v1.36.0-B0077 (pre-release)

What's changed since pre-release v1.36.0-B0046:

- New rules:
  - Entra Domain Services:
    - Check that instances use a minimum version of NTLM by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
    - Check that instances use a minimum version of TLS by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
    - Check that instances do not use RC4 encryption by @BernieWhite.
      [#2837](https://github.com/Azure/PSRule.Rules.Azure/issues/2837)
- General improvements:
  - **Important change**: Deprecated rules with no clear WAF alignment by @BernieWhite.
    [#2493](https://github.com/Azure/PSRule.Rules.Azure/issues/2493)
    - The following rules are deprecated:
      - `Azure.Template.UseParameters`
      - `Azure.Template.UseVariables`
      - `Azure.Template.DefineParameters`
      - `Azure.Template.ValidSecretRef`
    - These rules have been deprecated and will be removed in v2.
    - See [deprecations][2] for more information.

## v1.36.0-B0046 (pre-release)

What's changed since pre-release v1.36.0-B0020:

- Bug fixes:
  - Fixed `Azure.Storage.UseReplication` to allow for zone-redundant replication by @sebassem.
    [#2827](https://github.com/Azure/PSRule.Rules.Azure/issues/2827)
  - Fixed nested usage of `listKeys` mocks by @BernieWhite.
    [#2829](https://github.com/Azure/PSRule.Rules.Azure/issues/2829)

## v1.36.0-B0020 (pre-release)

What's changed since v1.35.3:

- New rules:
  - Container App:
    - Check that Container Apps have a minimum number of replicas by @BernieWhite.
      [#2790](https://github.com/Azure/PSRule.Rules.Azure/issues/2790)
    - Check that Container App environments are zone redundant by @BernieWhite.
      [#2791](https://github.com/Azure/PSRule.Rules.Azure/issues/2791)
  - Cosmos DB:
    - Check that database accounts only accept a minimum of TLS 1.2 by @BernieWhite.
      [#2809](https://github.com/Azure/PSRule.Rules.Azure/issues/2809)
- General improvements:
  - Quality updates to documentation by @lukemurraynz @BernieWhite.
    [#2789](https://github.com/Azure/PSRule.Rules.Azure/pull/2789)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Additional policies added to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Bug fixes:
  - Fixed not found warning when exporting firewall policy `signatureOverrides` by @BernieWhite.
    [#2806](https://github.com/Azure/PSRule.Rules.Azure/issues/2806)

## v1.35.3

What's changed since v1.35.2:

- Bug fixes:
  - Fixed false positive with load balancers that use a public IP by @BernieWhite.
    [#2814](https://github.com/Azure/PSRule.Rules.Azure/issues/2814)

## v1.35.2

What's changed since v1.35.1:

- Bug fixes:
  - Fixed regression when handing ambiguous mock array outputs by @BernieWhite.
    [#2801](https://github.com/Azure/PSRule.Rules.Azure/issues/2801)

## v1.35.1

What's changed since v1.35.0:

- Bug fixes:
  - Fixed null parameter overrides default value by @BernieWhite.
    [#2795](https://github.com/Azure/PSRule.Rules.Azure/issues/2795)

## v1.35.0

What's changed since v1.34.2:

- New features:
  - Added WAF pillar specific baselines by @BernieWhite.
    [#1633](https://github.com/Azure/PSRule.Rules.Azure/issues/1633)
    [#2752](https://github.com/Azure/PSRule.Rules.Azure/issues/2752)
    - Use pillar specific baselines to target a specific area of the Azure Well-Architected Framework.
    - The following baselines have been added:
      - `Azure.Pillar.CostOptimization`
      - `Azure.Pillar.OperationalExcellence`
      - `Azure.Pillar.PerformanceEfficiency`
      - `Azure.Pillar.Reliability`
      - `Azure.Pillar.Security`
  - Added March 2024 baselines `Azure.GA_2024_03` and `Azure.Preview_2024_03` by @BernieWhite.
    [#2781](https://github.com/Azure/PSRule.Rules.Azure/issues/2781)
    - Includes rules released before or during March 2024.
    - Marked `Azure.GA_2023_12` and `Azure.Preview_2023_12` baselines as obsolete.
- Updated rules:
  - Updated `Azure.AppService.NETVersion` to detect out of date .NET versions including .NET 5/6/7 by @BernieWhite.
    [#2766](https://github.com/Azure/PSRule.Rules.Azure/issues/2766)
    - Bumped rule set to `2024_03`.
  - Updated `Azure.AppService.PHPVersion` to detect out of date PHP versions before 8.2 by @BernieWhite.
    [#2768](https://github.com/Azure/PSRule.Rules.Azure/issues/2768)
    - Fixed `Azure.AppService.PHPVersion` check fails when phpVersion is null.
    - Bumped rule set to `2024_03`.
  - Updated `Azure.AKS.Version` to use `1.27.9` as the minimum version by @BernieWhite.
    [#2771](https://github.com/Azure/PSRule.Rules.Azure/issues/2771)
- General improvements:
  - Renamed Cognitive Services rules to Azure AI by @BernieWhite.
    [#2776](https://github.com/Azure/PSRule.Rules.Azure/issues/2776)
    - Rules that were previously named `Azure.Cognitive.*` have been renamed to `Azure.AI.*`.
    - For each rule that has been renamed, an alias has been added to reference the old name.
  - Improved export of in-flight data for Event Grid and Azure Firewall Policies by @BernieWhite.
    [#2774](https://github.com/Azure/PSRule.Rules.Azure/issues/2774)
  - Additional policies added to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
    [#1243](https://github.com/Azure/PSRule.Rules.Azure/issues/1243)
    [#2757](https://github.com/Azure/PSRule.Rules.Azure/issues/2757)
    - Add rule severity to rule documentation pages.
    - Add documentation redirects for renamed rules.
  - Updated links to learn.microsoft.com (from docs.microsoft.com) by @lukemurraynz.
    [#2785](https://github.com/Azure/PSRule.Rules.Azure/pull/2785)
- Engineering:
  - Bump coverlet.collector to v6.0.2.
    [#2754](https://github.com/Azure/PSRule.Rules.Azure/pull/2754)
- Bug fixes:
  - Fixed false negative from `Azure.LB.AvailabilityZone` when zone list is empty or null by @jtracey93.
    [#2759](https://github.com/Azure/PSRule.Rules.Azure/issues/2759)
  - Fixed failed to expand JObject value with invalid key by @BernieWhite.
    [#2751](https://github.com/Azure/PSRule.Rules.Azure/issues/2751)

What's changed since pre-release v1.35.0-B0116:

- General improvements:
  - Updated links to learn.microsoft.com (from docs.microsoft.com) by @lukemurraynz.
    [#2785](https://github.com/Azure/PSRule.Rules.Azure/pull/2785)

## v1.35.0-B0116 (pre-release)

What's changed since pre-release v1.35.0-B0084:

- New features:
  - Added March 2024 baselines `Azure.GA_2024_03` and `Azure.Preview_2024_03` by @BernieWhite.
    [#2781](https://github.com/Azure/PSRule.Rules.Azure/issues/2781)
    - Includes rules released before or during March 2024.
    - Marked `Azure.GA_2023_12` and `Azure.Preview_2023_12` baselines as obsolete.
- General improvements:
  - Renamed Cognitive Services rules to Azure AI by @BernieWhite.
    [#2776](https://github.com/Azure/PSRule.Rules.Azure/issues/2776)
    - Rules that were previously named `Azure.Cognitive.*` have been renamed to `Azure.AI.*`.
    - For each rule that has been renamed, an alias has been added to reference the old name.

## v1.35.0-B0084 (pre-release)

What's changed since pre-release v1.35.0-B0055:

- General improvements:
  - Improved export of in-flight data for Event Grid and Azure Firewall Policies by @BernieWhite.
    [#2774](https://github.com/Azure/PSRule.Rules.Azure/issues/2774)

## v1.35.0-B0055 (pre-release)

What's changed since pre-release v1.35.0-B0030:

- Updated rules:
  - Updated `Azure.AppService.NETVersion` to detect out of date .NET versions including .NET 5/6/7 by @BernieWhite.
    [#2766](https://github.com/Azure/PSRule.Rules.Azure/issues/2766)
    - Bumped rule set to `2024_03`.
  - Updated `Azure.AppService.PHPVersion` to detect out of date PHP versions before 8.2 by @BernieWhite.
    [#2768](https://github.com/Azure/PSRule.Rules.Azure/issues/2768)
    - Fixed `Azure.AppService.PHPVersion` check fails when phpVersion is null.
    - Bumped rule set to `2024_03`.
  - Updated `Azure.AKS.Version` to use `1.27.9` as the minimum version by @BernieWhite.
    [#2771](https://github.com/Azure/PSRule.Rules.Azure/issues/2771)
- General improvements:
  - Quality updates to rule documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
  - Additional policies added to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Bug fixes:
  - Fixed failed to expand JObject value with invalid key by @BernieWhite.
    [#2751](https://github.com/Azure/PSRule.Rules.Azure/issues/2751)

## v1.35.0-B0030 (pre-release)

What's changed since pre-release v1.35.0-B0012:

- General improvements:
  - Add rule severity to rule documentation pages by @BernieWhite.
    [#1243](https://github.com/Azure/PSRule.Rules.Azure/issues/1243)
  - Add documentation redirects for renamed rules by @BernieWhite.
    [#2757](https://github.com/Azure/PSRule.Rules.Azure/issues/2757)
- Engineering:
  - Bump coverlet.collector to v6.0.2.
    [#2754](https://github.com/Azure/PSRule.Rules.Azure/pull/2754)
- Bug fixes:
  - Fixed false negative from `Azure.LB.AvailabilityZone` when zone list is empty or null by @jtracey93.
    [#2759](https://github.com/Azure/PSRule.Rules.Azure/issues/2759)

## v1.35.0-B0012 (pre-release)

What's changed since v1.34.2:

- New features:
  - Added WAF pillar specific baselines by @BernieWhite.
    [#1633](https://github.com/Azure/PSRule.Rules.Azure/issues/1633)
    [#2752](https://github.com/Azure/PSRule.Rules.Azure/issues/2752)
    - Use pillar specific baselines to target a specific area of the Azure Well-Architected Framework.
    - The following baselines have been added:
      - `Azure.Pillar.CostOptimization`
      - `Azure.Pillar.OperationalExcellence`
      - `Azure.Pillar.PerformanceEfficiency`
      - `Azure.Pillar.Reliability`
      - `Azure.Pillar.Security`
- General improvements:
  - Documentation improvements by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)

## v1.34.2

What's changed since v1.34.1:

- Bug fixes:
  - Fixed export of in-flight data for flexible PostgreSQL servers by @BernieWhite.
    [#2744](https://github.com/Azure/PSRule.Rules.Azure/issues/2744)

## v1.34.1

What's changed since v1.34.0:

- Bug fixes:
  - Fixed policy as rules export issues by @BernieWhite.
    [#2724](https://github.com/Azure/PSRule.Rules.Azure/issues/2724)
    [#2725](https://github.com/Azure/PSRule.Rules.Azure/issues/2725)
    [#2726](https://github.com/Azure/PSRule.Rules.Azure/issues/2726)
    [#2727](https://github.com/Azure/PSRule.Rules.Azure/issues/2727)

## v1.34.0

What's changed since v1.33.2:

- New rules:
  - Azure Kubernetes Service:
    - Check that user mode pools have a minimum number of nodes by @BernieWhite.
      [#2683](https://github.com/Azure/PSRule.Rules.Azure/issues/2683)
      - Added configuration to support changing the minimum number of node and to exclude node pools.
      - Set `AZURE_AKS_CLUSTER_USER_POOL_MINIMUM_NODES` to set the minimum number of user nodes.
      - Set `AZURE_AKS_CLUSTER_USER_POOL_EXCLUDED_FROM_MINIMUM_NODES` to exclude a specific node pool by name.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.MinNodeCount` the count nodes system node pools by @BernieWhite.
      [#2683](https://github.com/Azure/PSRule.Rules.Azure/issues/2683)
      - Improved guidance and examples specifically for system node pools.
      - Added configuration to support changing the minimum number of node.
      - Set `AZURE_AKS_CLUSTER_MINIMUM_SYSTEM_NODES` to set the minimum number of system nodes.
  - Front Door:
    - Updated `Azure.FrontDoor.Logs` to cover premium and standard profiles instead of just classic by @BernieWhite.
      [#2704](https://github.com/Azure/PSRule.Rules.Azure/issues/2704)
      - Added a selector for premium and standard profiles `Azure.FrontDoor.IsStandardOrPremium`.
      - Added a selector for classic profiles `Azure.FrontDoor.IsClassic`.
      - Updated rule set to `2024_03`.
  - Microsoft Defender for Cloud:
    - Renamed rules to align with recommended naming length by @BernieWhite.
      [#2718](https://github.com/Azure/PSRule.Rules.Azure/issues/2718)
      - Renamed `Azure.Defender.Storage.SensitiveData` to `Azure.Defender.Storage.DataScan`.
    - Promoted `Azure.Defender.Storage.MalwareScan` to GA rule set by @BernieWhite.
      [#2590](https://github.com/Azure/PSRule.Rules.Azure/issues/2590)
  - Storage Account:
    - Renamed rules to align with recommended naming length by @BernieWhite.
      [#2718](https://github.com/Azure/PSRule.Rules.Azure/issues/2718)
      - Renamed `Azure.Storage.DefenderCloud.MalwareScan` to `Azure.Storage.Defender.MalwareScan`.
      - Renamed `Azure.Storage.DefenderCloud.SensitiveData` to `Azure.Storage.Defender.DataScan`.
    - Promoted `Azure.Storage.Defender.MalwareScan` to GA rule set by @BernieWhite.
      [#2590](https://github.com/Azure/PSRule.Rules.Azure/issues/2590)
- General improvements:
  - Moved `.bicepparam` file support to stable by @BernieWhite.
    [#2682](https://github.com/Azure/PSRule.Rules.Azure/issues/2682)
    - Bicep param files are now automatically expanded when found.
    - To disable expansion, set the configuration option `AZURE_BICEP_PARAMS_FILE_EXPANSION` to `false`.
  - Added support for type/ variable/ and function imports from Bicep files by @BernieWhite.
    [#2537](https://github.com/Azure/PSRule.Rules.Azure/issues/2537)
  - Added duplicate policies to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
  - Documentation and metadata improvements by @BernieWhite.
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2717](https://github.com/Azure/PSRule.Rules.Azure/pull/2717)
  - Improved debugging experience by providing symbols for .NET code by @BernieWhite.
    [#2712](https://github.com/Azure/PSRule.Rules.Azure/issues/2712)
  - Bump Microsoft.NET.Test.Sdk to v17.9.0.
    [#2680](https://github.com/Azure/PSRule.Rules.Azure/pull/2680)
  - Bump xunit to v2.7.0.
    [#2688](https://github.com/Azure/PSRule.Rules.Azure/pull/2688)
  - Bump xunit.runner.visualstudio to v2.5.7.
    [#2689](https://github.com/Azure/PSRule.Rules.Azure/pull/2689)
  - Bump coverlet.collector to v6.0.1.
    [#2699](https://github.com/Azure/PSRule.Rules.Azure/pull/2699)
- Bug fixes:
  - Fixed missing zones property for public IP addresses by @BernieWhite.
    [#2698](https://github.com/Azure/PSRule.Rules.Azure/issues/2698)
  - Fixes for policy as rules by @BernieWhite.
    [#181](https://github.com/Azure/PSRule.Rules.Azure/issues/181)
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)

What's changed since pre-release v1.34.0-B0077:

- No additional changes.

## v1.34.0-B0077 (pre-release)

What's changed since pre-release v1.34.0-B0047:

- Updated rules:
  - Microsoft Defender for Cloud:
    - Renamed rules to align with recommended naming length by @BernieWhite.
      [#2718](https://github.com/Azure/PSRule.Rules.Azure/issues/2718)
      - Renamed `Azure.Defender.Storage.SensitiveData` to `Azure.Defender.Storage.DataScan`.
    - Promoted `Azure.Defender.Storage.MalwareScan` to GA rule set by @BernieWhite.
      [#2590](https://github.com/Azure/PSRule.Rules.Azure/issues/2590)
  - Storage Account:
    - Renamed rules to align with recommended naming length by @BernieWhite.
      [#2718](https://github.com/Azure/PSRule.Rules.Azure/issues/2718)
      - Renamed `Azure.Storage.DefenderCloud.MalwareScan` to `Azure.Storage.Defender.MalwareScan`.
      - Renamed `Azure.Storage.DefenderCloud.SensitiveData` to `Azure.Storage.Defender.DataScan`.
    - Promoted `Azure.Storage.Defender.MalwareScan` to GA rule set by @BernieWhite.
      [#2590](https://github.com/Azure/PSRule.Rules.Azure/issues/2590)
- General improvements:
  - Added duplicate policies to default ignore list by @BernieWhite.
    [#1731](https://github.com/Azure/PSRule.Rules.Azure/issues/1731)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2717](https://github.com/Azure/PSRule.Rules.Azure/pull/2717)
- Bug fixes:
  - Fixes for policy as rules by @BernieWhite.
    [#181](https://github.com/Azure/PSRule.Rules.Azure/issues/181)
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)

## v1.34.0-B0047 (pre-release)

What's changed since pre-release v1.34.0-B0022:

- General improvements:
  - Added support for type/ variable/ and function imports from Bicep files by @BernieWhite.
    [#2537](https://github.com/Azure/PSRule.Rules.Azure/issues/2537)
- Engineering:
  - Improved debugging experience by providing symbols for .NET code by @BernieWhite.
    [#2712](https://github.com/Azure/PSRule.Rules.Azure/issues/2712)

## v1.34.0-B0022 (pre-release)

What's changed since v1.33.2:

- New rules:
  - Azure Kubernetes Service:
    - Check that user mode pools have a minimum number of nodes by @BernieWhite.
      [#2683](https://github.com/Azure/PSRule.Rules.Azure/issues/2683)
      - Added configuration to support changing the minimum number of node and to exclude node pools.
      - Set `AZURE_AKS_CLUSTER_USER_POOL_MINIMUM_NODES` to set the minimum number of user nodes.
      - Set `AZURE_AKS_CLUSTER_USER_POOL_EXCLUDED_FROM_MINIMUM_NODES` to exclude a specific node pool by name.
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.MinNodeCount` the count nodes system node pools by @BernieWhite.
      [#2683](https://github.com/Azure/PSRule.Rules.Azure/issues/2683)
      - Improved guidance and examples specifically for system node pools.
      - Added configuration to support changing the minimum number of node.
      - Set `AZURE_AKS_CLUSTER_MINIMUM_SYSTEM_NODES` to set the minimum number of system nodes.
  - Front Door:
    - Updated `Azure.FrontDoor.Logs` to cover premium and standard profiles instead of just classic by @BernieWhite.
      [#2704](https://github.com/Azure/PSRule.Rules.Azure/issues/2704)
      - Added a selector for premium and standard profiles `Azure.FrontDoor.IsStandardOrPremium`.
      - Added a selector for classic profiles `Azure.FrontDoor.IsClassic`.
      - Updated rule set to `2024_03`.
- General improvements:
  - Moved `.bicepparam` file support to stable by @BernieWhite.
    [#2682](https://github.com/Azure/PSRule.Rules.Azure/issues/2682)
    - Bicep param files are now automatically expanded when found.
    - To disable expansion, set the configuration option `AZURE_BICEP_PARAMS_FILE_EXPANSION` to `false`.
  - Documentation and metadata improvements by @BernieWhite.
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.9.0.
    [#2680](https://github.com/Azure/PSRule.Rules.Azure/pull/2680)
  - Bump xunit to v2.7.0.
    [#2688](https://github.com/Azure/PSRule.Rules.Azure/pull/2688)
  - Bump xunit.runner.visualstudio to v2.5.7.
    [#2689](https://github.com/Azure/PSRule.Rules.Azure/pull/2689)
  - Bump coverlet.collector to v6.0.1.
    [#2699](https://github.com/Azure/PSRule.Rules.Azure/pull/2699)
- Bug fixes:
  - Fixed missing zones property for public IP addresses by @BernieWhite.
    [#2698](https://github.com/Azure/PSRule.Rules.Azure/issues/2698)

## v1.33.2

What's changed since v1.33.1:

- Bug fixes:
  - Fixed false positive of `Azure.Resource.AllowedRegions` raised during assertion call by @BernieWhite.
    [#2687](https://github.com/Azure/PSRule.Rules.Azure/issues/2687)

## v1.33.1

What's changed since v1.33.0:

- Bug fixes:
  - Fixed `Azure.AKS.AuthorizedIPs` is not valid for a private cluster by @BernieWhite.
    [#2677](https://github.com/Azure/PSRule.Rules.Azure/issues/2677)
  - Fixed generating rule for VM extensions from policy is incorrect by @BernieWhite.
    [#2608](https://github.com/Azure/PSRule.Rules.Azure/issues/2608)

## v1.33.0

What's changed since v1.32.1:

- New features:
  - Exporting policy as rules also generates a baseline by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - A baseline is automatically generated that includes for all rules exported.
      If a policy rule has been replaced by a built-in rule, the baseline will include the built-in rule instead.
    - The baseline is named `<Prefix>.PolicyBaseline.All`. i.e. `Azure.PolicyBaseline.All` by default.
    - For details see [Policy as rules](./concepts/policy-as-rules.md#generated-baseline).
- New rules:
  - Databricks:
    - Check that Databricks workspaces use a non-trial SKU by @batemansogq.
      [#2646](https://github.com/Azure/PSRule.Rules.Azure/issues/2646)
    - Check that Databricks workspaces require use of private endpoints by @batemansogq.
      [#2646](https://github.com/Azure/PSRule.Rules.Azure/issues/2646)
  - Dev Box:
    - Check that projects limit the number of Dev Boxes per user by @BernieWhite.
      [#2654](https://github.com/Azure/PSRule.Rules.Azure/issues/2654)
- Updated rules:
  - Application Gateway:
    - Updated `Azure.AppGwWAF.RuleGroups` to use the rule sets by @BenjaminEngeset.
      [#2629](https://github.com/Azure/PSRule.Rules.Azure/issues/2629)
      - The latest Bot Manager rule set is now `1.0`.
      - The latest OWASP rule set is now `3.2`.
  - Cognitive Services:
    - Relaxed `Azure.Cognitive.ManagedIdentity` to configurations that require managed identities by @BernieWhite.
      [#2559](https://github.com/Azure/PSRule.Rules.Azure/issues/2559)
  - Virtual Machine:
    - Checks for Azure Hybrid Benefit `Azure.VM.UseHybridUseBenefit` are not enabled by default by @BernieWhite.
      [#2493](https://github.com/Azure/PSRule.Rules.Azure/issues/2493)
      - To enable, set the `AZURE_VM_USE_HYBRID_USE_BENEFIT` option to `true`.
  - Virtual Network:
    - Added option for excluding subnets to `Azure.VNET.UseNSGs` by @BernieWhite.
      [#2572](https://github.com/Azure/PSRule.Rules.Azure/issues/2572)
      - To add a subnet exclusion, set the `AZURE_VNET_SUBNET_EXCLUDED_FROM_NSG` option.
- General improvements:
  - Rules that are ignored during exporting policy as rules are now generate a verbose logs by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - This is to improve transparency of why rules are not exported.
    - To see details on why a rule is ignored, enable verbose logging with `-Verbose`.
  - Policies that duplicate built-in rules can now be exported by using the `-KeepDuplicates` parameter by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - For details see [Policy as rules](./concepts/policy-as-rules.md#duplicate-policies).
  - Quality updates to rules and documentation by @BernieWhite.
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Engineering:
  - Bump xunit to v2.6.6.
    [#2645](https://github.com/Azure/PSRule.Rules.Azure/pull/2645)
  - Bump xunit.runner.visualstudio to v2.5.6.
    [#2619](https://github.com/Azure/PSRule.Rules.Azure/pull/2619)
  - Bump BenchmarkDotNet to v0.13.12.
    [#2636](https://github.com/Azure/PSRule.Rules.Azure/pull/2636)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.12.
    [#2636](https://github.com/Azure/PSRule.Rules.Azure/pull/2636)
- Bug fixes:
  - Fixed `dateTimeAdd` may fail with different localization by @BernieWhite.
    [#2631](https://github.com/Azure/PSRule.Rules.Azure/issues/2631)
  - Fixed inconclusive result reported for `Azure.ACR.Usage` by @BernieWhite.
    [#2494](https://github.com/Azure/PSRule.Rules.Azure/issues/2494)
  - Fixed export of Front Door resource data is incomplete by @BernieWhite.
    [#2668](https://github.com/Azure/PSRule.Rules.Azure/issues/2668)
  - Fixed `Azure.Template.TemplateFile` to support with `languageVersion` 2.0 template properties by @MrRoundRobin.
    [#2660](https://github.com/Azure/PSRule.Rules.Azure/issues/2660)
  - Fixed `Azure.VM.DiskSizeAlignment` does not handle smaller sizes and ultra disks by @BernieWhite.
    [#2656](https://github.com/Azure/PSRule.Rules.Azure/issues/2656)

What's changed since pre-release v1.33.0-B0169:

- No additional changes.

## v1.33.0-B0169 (pre-release)

What's changed since pre-release v1.33.0-B0126:

- New features:
  - Exporting policy as rules also generates a baseline by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - A baseline is automatically generated that includes for all rules exported.
      If a policy rule has been replaced by a built-in rule, the baseline will include the built-in rule instead.
    - The baseline is named `<Prefix>.PolicyBaseline.All`. i.e. `Azure.PolicyBaseline.All` by default.
    - For details see [Policy as rules](./concepts/policy-as-rules.md#generated-baseline).
- General improvements:
  - Rules that are ignored during exporting policy as rules are now generate a verbose logs by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - This is to improve transparency of why rules are not exported.
    - To see details on why a rule is ignored, enable verbose logging with `-Verbose`.
  - Policies that duplicate built-in rules can now be exported by using the `-KeepDuplicates` parameter by @BernieWhite.
    [#2482](https://github.com/Azure/PSRule.Rules.Azure/issues/2482)
    - For details see [Policy as rules](./concepts/policy-as-rules.md#duplicate-policies).
- Bug fixes:
  - Fixed inconclusive result reported for `Azure.ACR.Usage` by @BernieWhite.
    [#2494](https://github.com/Azure/PSRule.Rules.Azure/issues/2494)
  - Fixed export of Front Door resource data is incomplete by @BernieWhite.
    [#2668](https://github.com/Azure/PSRule.Rules.Azure/issues/2668)

## v1.33.0-B0126 (pre-release)

What's changed since pre-release v1.33.0-B0088:

- Bug fixes:
  - Fixed `Azure.Template.TemplateFile` to support with `languageVersion` 2.0 template properties by @MrRoundRobin.
    [#2660](https://github.com/Azure/PSRule.Rules.Azure/issues/2660)

## v1.33.0-B0088 (pre-release)

What's changed since pre-release v1.33.0-B0053:

- New rules:
  - Dev Box:
    - Check that projects limit the number of Dev Boxes per user by @BernieWhite.
      [#2654](https://github.com/Azure/PSRule.Rules.Azure/issues/2654)
- Bug fixes:
  - Fixed `Azure.VM.DiskSizeAlignment` does not handle smaller sizes and ultra disks by @BernieWhite.
    [#2656](https://github.com/Azure/PSRule.Rules.Azure/issues/2656)

## v1.33.0-B0053 (pre-release)

What's changed since pre-release v1.33.0-B0023:

- New rules:
  - Databricks:
    - Check that Databricks workspaces use a non-trial SKU by @batemansogq.
      [#2646](https://github.com/Azure/PSRule.Rules.Azure/issues/2646)
    - Check that Databricks workspaces require use of private endpoints by @batemansogq.
      [#2646](https://github.com/Azure/PSRule.Rules.Azure/issues/2646)
- Engineering:
  - Bump xunit to v2.6.6.
    [#2645](https://github.com/Azure/PSRule.Rules.Azure/pull/2645)
  - Bump BenchmarkDotNet to v0.13.12.
    [#2636](https://github.com/Azure/PSRule.Rules.Azure/pull/2636)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.12.
    [#2636](https://github.com/Azure/PSRule.Rules.Azure/pull/2636)

## v1.33.0-B0023 (pre-release)

What's changed since v1.32.1:

- Updated rules:
  - Application Gateway:
    - Updated `Azure.AppGwWAF.RuleGroups` to use the rule sets by @BenjaminEngeset.
      [#2629](https://github.com/Azure/PSRule.Rules.Azure/issues/2629)
      - The latest Bot Manager rule set is now `1.0`.
      - The latest OWASP rule set is now `3.2`.
  - Cognitive Services:
    - Relaxed `Azure.Cognitive.ManagedIdentity` to configurations that require managed identities by @BernieWhite.
      [#2559](https://github.com/Azure/PSRule.Rules.Azure/issues/2559)
  - Virtual Machine:
    - Checks for Azure Hybrid Benefit `Azure.VM.UseHybridUseBenefit` are not enabled by default by @BernieWhite.
      [#2493](https://github.com/Azure/PSRule.Rules.Azure/issues/2493)
      - To enable, set the `AZURE_VM_USE_HYBRID_USE_BENEFIT` option to `true`.
  - Virtual Network:
    - Added option for excluding subnets to `Azure.VNET.UseNSGs` by @BernieWhite.
      [#2572](https://github.com/Azure/PSRule.Rules.Azure/issues/2572)
      - To add a subnet exclusion, set the `AZURE_VNET_SUBNET_EXCLUDED_FROM_NSG` option.
- General improvements:
  - Quality updates to rules and documentation by @BernieWhite.
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
- Engineering:
  - Bump xunit to v2.6.4.
    [#2618](https://github.com/Azure/PSRule.Rules.Azure/pull/2618)
  - Bump xunit.runner.visualstudio to v2.5.6.
    [#2619](https://github.com/Azure/PSRule.Rules.Azure/pull/2619)
- Bug fixes:
  - Fixed `dateTimeAdd` may fail with different localization by @BernieWhite.
    [#2631](https://github.com/Azure/PSRule.Rules.Azure/issues/2631)

## v1.32.1

What's changed since v1.32.0:

- Bug fixes:
  - Fixed quotes get incorrectly duplicated by @BernieWhite.
    [#2593](https://github.com/Azure/PSRule.Rules.Azure/issues/2593)
  - Fixed failure to expand copy loop in a Azure Policy deployment by @BernieWhite.
    [#2605](https://github.com/Azure/PSRule.Rules.Azure/issues/2605)
  - Fixed cast exception when expanding the union of an array and mock by @BernieWhite.
    [#2614](https://github.com/Azure/PSRule.Rules.Azure/issues/2614)

## v1.32.0

What's changed since v1.31.3:

- New features:
  - Added December 2023 baselines `Azure.GA_2023_12` and `Azure.Preview_2023_12` by @BernieWhite.
    [#2580](https://github.com/Azure/PSRule.Rules.Azure/issues/2580)
    - Includes rules released before or during December 2023.
    - Marked `Azure.GA_2023_09` and `Azure.Preview_2023_09` baselines as obsolete.
- Updated rules:
  - App Configuration:
    - Promoted `Azure.AppConfig.GeoReplica` to GA rule set by @BernieWhite.
      [#2592](https://github.com/Azure/PSRule.Rules.Azure/issues/2592)
  - API Management:
    - Promoted `Azure.APIM.DefenderCloud` to GA rule set by @BernieWhite.
      [#2591](https://github.com/Azure/PSRule.Rules.Azure/issues/2591)
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.27.7` by @BernieWhite.
      [#2581](https://github.com/Azure/PSRule.Rules.Azure/issues/2581)
  - Defender for Cloud:
    - Promoted `Azure.Defender.Api` to GA rule set by @BernieWhite.
      [#2591](https://github.com/Azure/PSRule.Rules.Azure/issues/2591)
  - Network Interface:
    - Renamed NIC rules to reflect current usage by @BernieWhite.
      [#2574](https://github.com/Azure/PSRule.Rules.Azure/issues/2574)
      - Rename `Azure.VM.NICAttached` to `Azure.NIC.Attached`.
      - Rename `Azure.VM.NICName` to `Azure.NIC.Name`.
      - Rename `Azure.VM.UniqueDns` to `Azure.NIC.UniqueDns`.
      - Added aliases to reference the old names for suppression and exclusion.
    - Added support for private link services to `Azure.VM.NICAttached` by @BernieWhite.
      [#2563](https://github.com/Azure/PSRule.Rules.Azure/issues/2563)
- General improvements:
  - Improved reporting of null argument in length function by @BernieWhite.
    [#2597](https://github.com/Azure/PSRule.Rules.Azure/issues/2597)
  - Quality updates to documentation by @BernieWhite.
    [#2557](https://github.com/Azure/PSRule.Rules.Azure/issues/2557)
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2579](https://github.com/Azure/PSRule.Rules.Azure/pull/2579)
  - Bump xunit to v2.6.2.
    [#2544](https://github.com/Azure/PSRule.Rules.Azure/pull/2544)
  - Bump xunit.runner.visualstudio to v2.5.4.
    [#2567](https://github.com/Azure/PSRule.Rules.Azure/pull/2567)
  - Bump Microsoft.SourceLink.GitHub to v8.0.0.
    [#2538](https://github.com/Azure/PSRule.Rules.Azure/pull/2538)
  - Bump BenchmarkDotNet.Diagnostics.Windows and BenchmarkDotNet to v0.13.11.
    [#2575](https://github.com/Azure/PSRule.Rules.Azure/pull/2575)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v8.0.0.
    [#2568](https://github.com/Azure/PSRule.Rules.Azure/pull/2568)
  - Bump Microsoft.NET.Test.Sdk to v17.8.0.
    [#2527](https://github.com/Azure/PSRule.Rules.Azure/pull/2527)
- Bug fixes:
  - Fixed additional false positives of `Azure.Deployment.SecureParameter` by @BernieWhite.
    [#2556](https://github.com/Azure/PSRule.Rules.Azure/issues/2556)
  - Fixed expansion with sub-resource handling of deployments with duplicate resources by @BernieWhite.
    [#2564](https://github.com/Azure/PSRule.Rules.Azure/issues/2564)
  - Fixed dependency ordered is incorrect by @BernieWhite.
    [#2578](https://github.com/Azure/PSRule.Rules.Azure/issues/2578)

What's changed since pre-release v1.32.0-B0099:

- No additional changes.

## v1.32.0-B0099 (pre-release)

What's changed since pre-release v1.32.0-B0053:

- New features:
  - Added December 2023 baselines `Azure.GA_2023_12` and `Azure.Preview_2023_12` by @BernieWhite.
    [#2580](https://github.com/Azure/PSRule.Rules.Azure/issues/2580)
    - Includes rules released before or during December 2023.
    - Marked `Azure.GA_2023_09` and `Azure.Preview_2023_09` baselines as obsolete.
- Updated rules:
  - App Configuration:
    - Promoted `Azure.AppConfig.GeoReplica` to GA rule set by @BernieWhite.
      [#2592](https://github.com/Azure/PSRule.Rules.Azure/issues/2592)
  - API Management:
    - Promoted `Azure.APIM.DefenderCloud` to GA rule set by @BernieWhite.
      [#2591](https://github.com/Azure/PSRule.Rules.Azure/issues/2591)
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.27.7` by @BernieWhite.
      [#2581](https://github.com/Azure/PSRule.Rules.Azure/issues/2581)
  - Defender for Cloud:
    - Promoted `Azure.Defender.Api` to GA rule set by @BernieWhite.
      [#2591](https://github.com/Azure/PSRule.Rules.Azure/issues/2591)
- General improvements:
  - Improved reporting of null argument in length function by @BernieWhite.
    [#2597](https://github.com/Azure/PSRule.Rules.Azure/issues/2597)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2579](https://github.com/Azure/PSRule.Rules.Azure/pull/2579)
  - Bump Microsoft.SourceLink.GitHub to v8.0.0.
    [#2538](https://github.com/Azure/PSRule.Rules.Azure/pull/2538)
  - Bump BenchmarkDotNet.Diagnostics.Windows and BenchmarkDotNet to v0.13.11.
    [#2575](https://github.com/Azure/PSRule.Rules.Azure/pull/2575)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v8.0.0.
    [#2568](https://github.com/Azure/PSRule.Rules.Azure/pull/2568)

## v1.32.0-B0053 (pre-release)

What's changed since pre-release v1.32.0-B0021:

- Updated rules:
  - Network Interface:
    - Renamed NIC rules to reflect current usage by @BernieWhite.
      [#2574](https://github.com/Azure/PSRule.Rules.Azure/issues/2574)
      - Rename `Azure.VM.NICAttached` to `Azure.NIC.Attached`.
      - Rename `Azure.VM.NICName` to `Azure.NIC.Name`.
      - Rename `Azure.VM.UniqueDns` to `Azure.NIC.UniqueDns`.
      - Added aliases to reference the old names for suppression and exclusion.
    - Added support for private link services to `Azure.VM.NICAttached` by @BernieWhite.
      [#2563](https://github.com/Azure/PSRule.Rules.Azure/issues/2563)
- General improvements:
  - Quality updates to documentation by @BernieWhite.
    [#2570](https://github.com/Azure/PSRule.Rules.Azure/issues/2570)
    [#1772](https://github.com/Azure/PSRule.Rules.Azure/issues/1772)
- Engineering:
  - Bump xunit.runner.visualstudio to v2.5.4.
    [#2567](https://github.com/Azure/PSRule.Rules.Azure/pull/2567)
- Bug fixes:
  - Fixed dependency ordered is incorrect by @BernieWhite.
    [#2578](https://github.com/Azure/PSRule.Rules.Azure/issues/2578)

## v1.32.0-B0021 (pre-release)

What's changed since v1.31.3:

- General improvements:
  - Quality updates to documentation by @BernieWhite.
    [#2557](https://github.com/Azure/PSRule.Rules.Azure/issues/2557)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.8.0.
    [#2527](https://github.com/Azure/PSRule.Rules.Azure/pull/2527)
  - Bump xunit to v2.6.2.
    [#2544](https://github.com/Azure/PSRule.Rules.Azure/pull/2544)
- Bug fixes:
  - Fixed additional false positives of `Azure.Deployment.SecureParameter` by @BernieWhite.
    [#2556](https://github.com/Azure/PSRule.Rules.Azure/issues/2556)
  - Fixed expansion with sub-resource handling of deployments with duplicate resources by @BernieWhite.
    [#2564](https://github.com/Azure/PSRule.Rules.Azure/issues/2564)

## v1.31.3

What's changed since v1.31.2:

- Bug fixes:
  - Fixed incorrect scope generated for subscription aliases by @BernieWhite.
    [#2545](https://github.com/Azure/PSRule.Rules.Azure/issues/2545)
  - Fixed null dereferenced properties in map lambda by @BernieWhite.
    [#2535](https://github.com/Azure/PSRule.Rules.Azure/issues/2535)
  - Fixed handling of for array index symbols by @BernieWhite.
    [#2548](https://github.com/Azure/PSRule.Rules.Azure/issues/2548)

## v1.31.2

What's changed since v1.31.1:

- Bug fixes:
  - Fixed nullable parameters with JValue null by @BernieWhite.
    [#2535](https://github.com/Azure/PSRule.Rules.Azure/issues/2535)

## v1.31.1

What's changed since v1.31.0:

- Bug fixes:
  - Fixed additional non-sensitive parameter name patterns by `Azure.Deployment.SecureParameter` by @BernieWhite.
    [#2528](https://github.com/Azure/PSRule.Rules.Azure/issues/2528)
    - Added support for configuration of the rule by setting `AZURE_DEPLOYMENT_NONSENSITIVE_PARAMETER_NAMES`.
  - Fixed incorrect handling of expressions with contains with JValue string by @BernieWhite.
    [#2531](https://github.com/Azure/PSRule.Rules.Azure/issues/2531)

## v1.31.0

What's changed since v1.30.3:

- New rules:
  - Deployment:
    - Check parameters potentially containing secure values by @BernieWhite.
      [#1476](https://github.com/Azure/PSRule.Rules.Azure/issues/1476)
  - Machine Learning:
    - Check compute instances are configured for an idle shutdown by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspace compute has local authentication disabled by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspace compute is connected to a VNET by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check public access to a workspace is disabled by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspaces use a user-assigned identity by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
- Engineering:
  - Bump development tools to .NET 7.0 SDK by @BernieWhite.
    [#1870](https://github.com/Azure/PSRule.Rules.Azure/issues/1870)
  - Bump BenchmarkDotNet to v0.13.10.
    [#2518](https://github.com/Azure/PSRule.Rules.Azure/pull/2518)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.10.
    [#2508](https://github.com/Azure/PSRule.Rules.Azure/pull/2508)
  - Bump xunit to v2.6.1.
    [#2514](https://github.com/Azure/PSRule.Rules.Azure/pull/2514)
  - Bump xunit.runner.visualstudio to v2.5.3.
    [#2486](https://github.com/Azure/PSRule.Rules.Azure/pull/2486)
- Bug fixes:
  - Fixed dependency ordering with symbolic name by @BernieWhite.
    [#2505](https://github.com/Azure/PSRule.Rules.Azure/issues/2505)
  - Fixed nullable parameters for custom types by @BernieWhite.
    [#2489](https://github.com/Azure/PSRule.Rules.Azure/issues/2489)
  - Fixed API Connection might be missing dynamic properties by @BernieWhite.
    [#2424](https://github.com/Azure/PSRule.Rules.Azure/issues/2424)

What's changed since pre-release v1.31.0-B0048:

- No additional changes.

## v1.31.0-B0048 (pre-release)

What's changed since pre-release v1.31.0-B0020:

- Engineering:
  - Bump BenchmarkDotNet to v0.13.10.
    [#2518](https://github.com/Azure/PSRule.Rules.Azure/pull/2518)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.10.
    [#2508](https://github.com/Azure/PSRule.Rules.Azure/pull/2508)
  - Bump xunit to v2.6.1.
    [#2514](https://github.com/Azure/PSRule.Rules.Azure/pull/2514)
  - Bump xunit.runner.visualstudio to v2.5.3.
    [#2486](https://github.com/Azure/PSRule.Rules.Azure/pull/2486)
- Bug fixes:
  - Fixed dependency ordering with symbolic name by @BernieWhite.
    [#2505](https://github.com/Azure/PSRule.Rules.Azure/issues/2505)
  - Fixed nullable parameters for custom types by @BernieWhite.
    [#2489](https://github.com/Azure/PSRule.Rules.Azure/issues/2489)
  - Fixed API Connection might be missing dynamic properties by @BernieWhite.
    [#2424](https://github.com/Azure/PSRule.Rules.Azure/issues/2424)

## v1.31.0-B0020 (pre-release)

What's changed since v1.30.3:

- New rules:
  - Deployment:
    - Check parameters potentially containing secure values by @BernieWhite.
      [#1476](https://github.com/Azure/PSRule.Rules.Azure/issues/1476)
  - Machine Learning:
    - Check compute instances are configured for an idle shutdown by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspace compute has local authentication disabled by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspace compute is connected to a VNET by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check public access to a workspace is disabled by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
    - Check workspaces use a user-assigned identity by @batemansogq.
      [#2484](https://github.com/Azure/PSRule.Rules.Azure/issues/2484)
- Engineering:
  - Bump development tools to .NET 7.0 SDK by @BernieWhite.
    [#1870](https://github.com/Azure/PSRule.Rules.Azure/issues/1870)
  - Bump BenchmarkDotNet to v0.13.9.
    [#2469](https://github.com/Azure/PSRule.Rules.Azure/pull/2469)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.9.
    [#2470](https://github.com/Azure/PSRule.Rules.Azure/pull/2470)

## v1.30.3

What's changed since v1.30.2:

- Bug fixes:
  - Fixed nullable parameters for built-in types by @BernieWhite.
    [#2488](https://github.com/Azure/PSRule.Rules.Azure/issues/2488)

## v1.30.2

What's changed since v1.30.1:

- Bug fixes:
  - Fixed binding of results resourceId and resourceGroupName by @BernieWhite.
    [#2460](https://github.com/Azure/PSRule.Rules.Azure/issues/2460)

## v1.30.1

What's changed since v1.30.0:

- Bug fixes:
  - Fixed `Azure.Resource.AllowedRegions` which was failing when no allowed regions were configured by @BernieWhite.
    [#2461](https://github.com/Azure/PSRule.Rules.Azure/issues/2461)

## v1.30.0

What's changed since v1.29.0:

- New features:
  - Added September 2023 baselines `Azure.GA_2023_09` and `Azure.Preview_2023_09` by @BernieWhite.
    [#2451](https://github.com/Azure/PSRule.Rules.Azure/issues/2451)
    - Includes rules released before or during September 2023.
    - Marked `Azure.GA_2023_06` and `Azure.Preview_2023_06` baselines as obsolete.
- New rules:
  - Azure Database for MySQL:
    - Check that Azure AD-only authentication is configured for Azure Database for MySQL databases by @BenjaminEngeset.
      [#2227](https://github.com/Azure/PSRule.Rules.Azure/issues/2227)
  - Azure Firewall:
    - Check that Azure Firewall polices has configured threat intelligence-based filtering in `alert and deny` mode by @BenjaminEngeset.
      [#2354](https://github.com/Azure/PSRule.Rules.Azure/issues/2354)
  - Backup vault:
    - Check that immutability is configured for Backup vaults by @BenjaminEngeset.
      [#2387](https://github.com/Azure/PSRule.Rules.Azure/issues/2387)
  - Container App:
    - Check that Container Apps uses a supported API version by @BenjaminEngeset.
      [#2398](https://github.com/Azure/PSRule.Rules.Azure/issues/2398)
  - Container Registry:
    - Check that Container Registries restricts network access by @BenjaminEngeset.
      [#2423](https://github.com/Azure/PSRule.Rules.Azure/issues/2423)
    - Check that Container Registries disables anonymous pull access by @BenjaminEngeset.
      [#2422](https://github.com/Azure/PSRule.Rules.Azure/issues/2422)
  - Front Door:
    - Check that managed identity for Azure Front Door instances are configured by @BenjaminEngeset.
      [#2378](https://github.com/Azure/PSRule.Rules.Azure/issues/2378)
  - Public IP address:
    - Check that Public IP addresses uses Standard SKU by @BenjaminEngeset.
      [#2376](https://github.com/Azure/PSRule.Rules.Azure/issues/2376)
  - Recovery Services vault:
    - Check that immutability is configured for Recovery Services vaults by @BenjaminEngeset.
      [#2386](https://github.com/Azure/PSRule.Rules.Azure/issues/2386)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.26.6` by @BernieWhite.
      [#2404](https://github.com/Azure/PSRule.Rules.Azure/issues/2404)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
    - Promoted `Azure.AKS.LocalAccounts` to GA rule set by @BernieWhite.
      [#2448](https://github.com/Azure/PSRule.Rules.Azure/issues/2448)
  - Container App:
    - Promoted `Azure.ContainerApp.DisableAffinity` to GA rule set by @BernieWhite.
      [#2455](https://github.com/Azure/PSRule.Rules.Azure/issues/2455)
- General improvements:
  - **Important change:** Replaced the `Azure_AllowedRegions` option with `AZURE_RESOURCE_ALLOWED_LOCATIONS` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AllowedRegions` is set it will be used instead of `AZURE_RESOURCE_ALLOWED_LOCATIONS`.
    - If only `AZURE_RESOURCE_ALLOWED_LOCATIONS` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AllowedRegions` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AllowedRegions` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
  - Add source link for rule in docs by @BernieWhite.
    [#2115](https://github.com/Azure/PSRule.Rules.Azure/issues/2115)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2442](https://github.com/Azure/PSRule.Rules.Azure/pull/2442)
  - Bump xunit to v2.5.1.
    [#2436](https://github.com/Azure/PSRule.Rules.Azure/pull/2436)
  - Bump xunit.runner.visualstudio to v2.5.1.
    [#2435](https://github.com/Azure/PSRule.Rules.Azure/pull/2435)
  - Bump Microsoft.NET.Test.Sdk to v17.7.2.
    [#2407](https://github.com/Azure/PSRule.Rules.Azure/pull/2407)
  - Bump BenchmarkDotNet to v0.13.8.
    [#2425](https://github.com/Azure/PSRule.Rules.Azure/pull/2425)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.8.
    [#2425](https://github.com/Azure/PSRule.Rules.Azure/pull/2425)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.4.
    [#2405](https://github.com/Azure/PSRule.Rules.Azure/pull/2405)
- Bug fixes:
  - Fixed false positive with `Azure.Storage.SecureTransfer` on new API versions by @BernieWhite.
    [#2414](https://github.com/Azure/PSRule.Rules.Azure/issues/2414)
  - Fixed false positive with `Azure.VNET.LocalDNS` for DNS server addresses out of local scope by @BernieWhite.
    [#2370](https://github.com/Azure/PSRule.Rules.Azure/issues/2370)
    - This bug fix introduces a configuration option to flag when DNS from an Identity subscription is used.
    - Set `AZURE_VNET_DNS_WITH_IDENTITY` to `true` when using an Identity subscription for DNS.
  - Fixed non-resource group rule triggering for a resource group by @BernieWhite.
    [#2401](https://github.com/Azure/PSRule.Rules.Azure/issues/2401)
  - Fixed lambda map in map variable by @BernieWhite.
    [#2410](https://github.com/Azure/PSRule.Rules.Azure/issues/2410)
  - Fixed `Azure.AKS.Version` by excluding `node-image` channel by @BernieWhite.
    [#2446](https://github.com/Azure/PSRule.Rules.Azure/issues/2446)

What's changed since pre-release v1.30.0-B0127:

- No additional changes.

## v1.30.0-B0127 (pre-release)

What's changed since pre-release v1.30.0-B0080:

- New features:
  - Added September 2023 baselines `Azure.GA_2023_09` and `Azure.Preview_2023_09` by @BernieWhite.
    [#2451](https://github.com/Azure/PSRule.Rules.Azure/issues/2451)
    - Includes rules released before or during September 2023.
    - Marked `Azure.GA_2023_06` and `Azure.Preview_2023_06` baselines as obsolete.
- New rules:
  - Azure Container Registry:
    - Check that Container Registries restricts network access by @BenjaminEngeset.
      [#2423](https://github.com/Azure/PSRule.Rules.Azure/issues/2423)
    - Check that Container Registries disables anonymous pull access by @BenjaminEngeset.
      [#2422](https://github.com/Azure/PSRule.Rules.Azure/issues/2422)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.26.6` by @BernieWhite.
      [#2404](https://github.com/Azure/PSRule.Rules.Azure/issues/2404)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
    - Promoted `Azure.AKS.LocalAccounts` to GA rule set by @BernieWhite.
      [#2448](https://github.com/Azure/PSRule.Rules.Azure/issues/2448)
  - Container App:
    - Promoted `Azure.ContainerApp.DisableAffinity` to GA rule set by @BernieWhite.
      [#2455](https://github.com/Azure/PSRule.Rules.Azure/issues/2455)
- General improvements:
  - Add source link for rule in docs by @BernieWhite.
    [#2115](https://github.com/Azure/PSRule.Rules.Azure/issues/2115)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2442](https://github.com/Azure/PSRule.Rules.Azure/pull/2442)
  - Bump xunit to v2.5.1.
    [#2436](https://github.com/Azure/PSRule.Rules.Azure/pull/2436)
  - Bump xunit.runner.visualstudio to v2.5.1.
    [#2435](https://github.com/Azure/PSRule.Rules.Azure/pull/2435)
- Bug fixes:
  - Fixed `Azure.AKS.Version` by excluding `node-image` channel by @BernieWhite.
    [#2446](https://github.com/Azure/PSRule.Rules.Azure/issues/2446)

## v1.30.0-B0080 (pre-release)

What's changed since pre-release v1.30.0-B0047:

- General improvements:
  - **Important change:** Replaced the `Azure_AllowedRegions` option with `AZURE_RESOURCE_ALLOWED_LOCATIONS` by @BernieWhite.
    [#941](https://github.com/Azure/PSRule.Rules.Azure/issues/941)
    - For compatibility, if `Azure_AllowedRegions` is set it will be used instead of `AZURE_RESOURCE_ALLOWED_LOCATIONS`.
    - If only `AZURE_RESOURCE_ALLOWED_LOCATIONS` is set, this value will be used.
    - The default will be used neither options are configured.
    - If `Azure_AllowedRegions` is set a warning will be generated until the configuration is removed.
    - Support for `Azure_AllowedRegions` is deprecated and will be removed in v2.
    - See [upgrade notes][1] for details.
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.7.2.
    [#2407](https://github.com/Azure/PSRule.Rules.Azure/pull/2407)
  - Bump BenchmarkDotNet to v0.13.8.
    [#2425](https://github.com/Azure/PSRule.Rules.Azure/pull/2425)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.8.
    [#2425](https://github.com/Azure/PSRule.Rules.Azure/pull/2425)
- Bug fixes:
  - Fixed false positive with `Azure.Storage.SecureTransfer` on new API versions by @BernieWhite.
    [#2414](https://github.com/Azure/PSRule.Rules.Azure/issues/2414)
  - Fixed false positive with `Azure.VNET.LocalDNS` for DNS server addresses out of local scope by @BernieWhite.
    [#2370](https://github.com/Azure/PSRule.Rules.Azure/issues/2370)
    - This bug fix introduces a configuration option to flag when DNS from an Identity subscription is used.
    - Set `AZURE_VNET_DNS_WITH_IDENTITY` to `true` when using an Identity subscription for DNS.

## v1.30.0-B0047 (pre-release)

What's changed since pre-release v1.30.0-B0026:

- Engineering:
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.4.
    [#2405](https://github.com/Azure/PSRule.Rules.Azure/pull/2405)
- Bug fixes:
  - Fixed lambda map in map variable by @BernieWhite.
    [#2410](https://github.com/Azure/PSRule.Rules.Azure/issues/2410)

## v1.30.0-B0026 (pre-release)

What's changed since pre-release v1.30.0-B0011:

- New rules:
  - Container App:
    - Check that Container Apps uses a supported API version by @BenjaminEngeset.
      [#2398](https://github.com/Azure/PSRule.Rules.Azure/issues/2398)
- Bug fixes:
  - Fixed non-resource group rule triggering for a resource group by @BernieWhite.
    [#2401](https://github.com/Azure/PSRule.Rules.Azure/issues/2401)

## v1.30.0-B0011 (pre-release)

What's changed since v1.29.0:

- New rules:
  - Azure Database for MySQL:
    - Check that Azure AD-only authentication is configured for Azure Database for MySQL databases by @BenjaminEngeset.
      [#2227](https://github.com/Azure/PSRule.Rules.Azure/issues/2227)
  - Azure Firewall:
    - Check that Azure Firewall polices has configured threat intelligence-based filtering in `alert and deny` mode by @BenjaminEngeset.
      [#2354](https://github.com/Azure/PSRule.Rules.Azure/issues/2354)
  - Backup vault:
    - Check that immutability is configured for Backup vaults by @BenjaminEngeset.
      [#2387](https://github.com/Azure/PSRule.Rules.Azure/issues/2387)
  - Front Door:
    - Check that managed identity for Azure Front Door instances are configured by @BenjaminEngeset.
      [#2378](https://github.com/Azure/PSRule.Rules.Azure/issues/2378)
  - Public IP address:
    - Check that Public IP addresses uses Standard SKU by @BenjaminEngeset.
      [#2376](https://github.com/Azure/PSRule.Rules.Azure/issues/2376)
  - Recovery Services vault:
    - Check that immutability is configured for Recovery Services vaults by @BenjaminEngeset.
      [#2386](https://github.com/Azure/PSRule.Rules.Azure/issues/2386)
- Engineering:
  - Bump BenchmarkDotNet to v0.13.7.
    [#2385](https://github.com/Azure/PSRule.Rules.Azure/pull/2385)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.7.
    [#2382](https://github.com/Azure/PSRule.Rules.Azure/pull/2382)
  - Bump Microsoft.NET.Test.Sdk to v17.7.1.
    [#2393](https://github.com/Azure/PSRule.Rules.Azure/pull/2393)

## v1.29.0

What's changed since v1.28.2:

- New rules:
  - Databricks:
    - Check that workspaces use secure cluster connectivity by @BernieWhite.
      [#2334](https://github.com/Azure/PSRule.Rules.Azure/issues/2334)
- General improvements:
  - Use policy definition name when generating a rule from it by @BernieWhite.
    [#1959](https://github.com/Azure/PSRule.Rules.Azure/issues/1959)
  - Added export in-flight data for Defender for Storage from Storage Accounts by @BernieWhite.
    [#2248](https://github.com/Azure/PSRule.Rules.Azure/issues/2248)
  - Added export in-flight data for Defender for APIs from API Management by @BernieWhite.
    [#2247](https://github.com/Azure/PSRule.Rules.Azure/issues/2247)
- Bug fixes:
  - Fixed policy expansion with unquoted field property by @BernieWhite.
    [#2352](https://github.com/Azure/PSRule.Rules.Azure/issues/2352)
  - Fixed array contains with JArray by @BernieWhite.
    [#2368](https://github.com/Azure/PSRule.Rules.Azure/issues/2368)
  - Fixed index out of bounds of array with first function on empty array by @BernieWhite.
    [#2372](https://github.com/Azure/PSRule.Rules.Azure/issues/2372)

What's changed since pre-release v1.29.0-B0062:

- No additional changes.

## v1.29.0-B0062 (pre-release)

What's changed since pre-release v1.29.0-B0036:

- Bug fixes:
  - Fixed array contains with JArray by @BernieWhite.
    [#2368](https://github.com/Azure/PSRule.Rules.Azure/issues/2368)
  - Fixed index out of bounds of array with first function on empty array by @BernieWhite.
    [#2372](https://github.com/Azure/PSRule.Rules.Azure/issues/2372)

## v1.29.0-B0036 (pre-release)

What's changed since pre-release v1.29.0-B0015:

- General improvements:
  - Added export in-flight data for Defender for Storage from Storage Accounts by @BernieWhite.
    [#2248](https://github.com/Azure/PSRule.Rules.Azure/issues/2248)
  - Added export in-flight data for Defender for APIs from API Management by @BernieWhite.
    [#2247](https://github.com/Azure/PSRule.Rules.Azure/issues/2247)

## v1.29.0-B0015 (pre-release)

What's changed since v1.28.2:

- New rules:
  - Databricks:
    - Check that workspaces use secure cluster connectivity by @BernieWhite.
      [#2334](https://github.com/Azure/PSRule.Rules.Azure/issues/2334)
- General improvements:
  - Use policy definition name when generating a rule from it by @BernieWhite.
    [#1959](https://github.com/Azure/PSRule.Rules.Azure/issues/1959)
- Bug fixes:
  - Fixed policy expansion with unquoted field property by @BernieWhite.
    [#2352](https://github.com/Azure/PSRule.Rules.Azure/issues/2352)

## v1.28.2

What's changed since v1.28.1:

- Bug fixes:
  - Fixed policy rules with no effect conditions are evaluated incorrectly by @BernieWhite.
    [#2346](https://github.com/Azure/PSRule.Rules.Azure/issues/2346)

## v1.28.1

What's changed since v1.28.0:

- Bug fixes:
  - Fixed `parseCidr` with `/32` is not valid by @BernieWhite.
    [#2336](https://github.com/Azure/PSRule.Rules.Azure/issues/2336)
  - Fixed mismatch of resource group type on policy as code rules by @BernieWhite.
    [#2338](https://github.com/Azure/PSRule.Rules.Azure/issues/2338)
  - Fixed length cannot be less than zero when converting policy to rules by @BernieWhite.
    [#1802](https://github.com/Azure/PSRule.Rules.Azure/issues/1802)
  - Fixed naming rules for MariaDB by @BernieWhite.
    [#2335](https://github.com/Azure/PSRule.Rules.Azure/issues/2335)
    - Updated `Azure.MariaDB.VNETRuleName` to allow for parent resources.
    - Updated `Azure.MariaDB.FirewallRuleName` to allow for parent resources.
  - Fixed network watcher existence check by @BernieWhite.
    [#2342](https://github.com/Azure/PSRule.Rules.Azure/issues/2342)

## v1.28.0

What's changed since v1.27.3:

- New features:
  - Added June 2023 baselines `Azure.GA_2023_06` and `Azure.Preview_2023_06` by @BernieWhite.
    [#2310](https://github.com/Azure/PSRule.Rules.Azure/issues/2310)
    - Includes rules released before or during June 2023.
    - Marked `Azure.GA_2023_03` and `Azure.Preview_2023_03` baselines as obsolete.
- New rules:
  - Azure Database for MySQL:
    - Check that Azure AD authentication is configured for Azure Database for MySQL databases by @BenjaminEngeset.
      [#2226](https://github.com/Azure/PSRule.Rules.Azure/issues/2226)
  - Azure Database for PostgreSQL:
    - Check that Azure AD-only authentication is configured for Azure Database for PostgreSQL databases by @BenjaminEngeset.
      [#2250](https://github.com/Azure/PSRule.Rules.Azure/issues/2250)
    - Check that Azure AD authentication is configured for Azure Database for PostgreSQL databases by @BenjaminEngeset.
      [#2249](https://github.com/Azure/PSRule.Rules.Azure/issues/2249)
- Removed rules:
  - Azure Kubernetes Service:
    - Removed `Azure.AKS.PodIdentity` as pod identities has been replaced by workload identities by @BernieWhite.
      [#2273](https://github.com/Azure/PSRule.Rules.Azure/issues/2273)
- General improvements:
  - Added support for safe dereference operator by @BernieWhite.
    [#2322](https://github.com/Azure/PSRule.Rules.Azure/issues/2322)
    - Added support for `tryGet` Bicep function.
  - Added support for Bicep CIDR functions by @BernieWhite.
    [#2279](https://github.com/Azure/PSRule.Rules.Azure/issues/2279)
    - Added support for `parseCidr`, `cidrSubnet`, and `cidrHost`.
  - Added support for `managementGroupResourceId` Bicep function by @BernieWhite.
    [#2294](https://github.com/Azure/PSRule.Rules.Azure/issues/2294)
- Engineering:
  - Bump PSRule to v2.9.0.
    [#2293](https://github.com/Azure/PSRule.Rules.Azure/pull/2293)
  - Updated resource providers and policy aliases.
    [#2261](https://github.com/Azure/PSRule.Rules.Azure/pull/2261)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.3.
    [#2281](https://github.com/Azure/PSRule.Rules.Azure/pull/2281)
  - Bump Microsoft.NET.Test.Sdk to v17.6.3.
    [#2290](https://github.com/Azure/PSRule.Rules.Azure/pull/2290)
  - Bump coverlet.collector to v6.0.0.
    [#2232](https://github.com/Azure/PSRule.Rules.Azure/pull/2232)
  - Bump Az.Resources to v6.7.0.
    [#2274](https://github.com/Azure/PSRule.Rules.Azure/pull/2274)
  - Bump xunit to v2.5.0.
    [#2306](https://github.com/Azure/PSRule.Rules.Azure/pull/2306)
  - Bump xunit.runner.visualstudio to v2.5.0.
    [#2307](https://github.com/Azure/PSRule.Rules.Azure/pull/2307)
  - Bump BenchmarkDotNet to v0.13.6.
    [#2317](https://github.com/Azure/PSRule.Rules.Azure/pull/2317)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.6.
    [#2318](https://github.com/Azure/PSRule.Rules.Azure/pull/2318)
- Bug fixes:
  - Fixed Redis firewall rules can not bind to start by @BernieWhite.
    [#2303](https://github.com/Azure/PSRule.Rules.Azure/issues/2303)
  - Fixed null condition handling by @BernieWhite.
    [#2316](https://github.com/Azure/PSRule.Rules.Azure/issues/2316)
  - Fixed reference expression in property name by @BernieWhite.
    [#2321](https://github.com/Azure/PSRule.Rules.Azure/issues/2321)
  - Fixed handling of nested mock objects by @BernieWhite.
    [#2325](https://github.com/Azure/PSRule.Rules.Azure/issues/2325)
  - Fixed late binding of `coalesce` function by @BernieWhite.
    [#2328](https://github.com/Azure/PSRule.Rules.Azure/issues/2328)
  - Fixed handling of JArray outputs with runtime values by @BernieWhite.
    [#2159](https://github.com/Azure/PSRule.Rules.Azure/issues/2159)

What's changed since pre-release v1.28.0-B0213:

- No additional changes.

## v1.28.0-B0213 (pre-release)

What's changed since pre-release v1.28.0-B0159:

- General improvements:
  - Added support for safe dereference operator by @BernieWhite.
    [#2322](https://github.com/Azure/PSRule.Rules.Azure/issues/2322)
    - Added support for `tryGet` Bicep function.
- Engineering:
  - Bump BenchmarkDotNet to v0.13.6.
    [#2317](https://github.com/Azure/PSRule.Rules.Azure/pull/2317)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.6.
    [#2318](https://github.com/Azure/PSRule.Rules.Azure/pull/2318)
- Bug fixes:
  - Fixed null condition handling by @BernieWhite.
    [#2316](https://github.com/Azure/PSRule.Rules.Azure/issues/2316)
  - Fixed reference expression in property name by @BernieWhite.
    [#2321](https://github.com/Azure/PSRule.Rules.Azure/issues/2321)
  - Fixed handling of nested mock objects by @BernieWhite.
    [#2325](https://github.com/Azure/PSRule.Rules.Azure/issues/2325)
  - Fixed late binding of `coalesce` function by @BernieWhite.
    [#2328](https://github.com/Azure/PSRule.Rules.Azure/issues/2328)

## v1.28.0-B0159 (pre-release)

What's changed since pre-release v1.28.0-B0115:

- New features:
  - Added June 2023 baselines `Azure.GA_2023_06` and `Azure.Preview_2023_06` by @BernieWhite.
    [#2310](https://github.com/Azure/PSRule.Rules.Azure/issues/2310)
    - Includes rules released before or during June 2023.
    - Marked `Azure.GA_2023_03` and `Azure.Preview_2023_03` baselines as obsolete.
- Engineering:
  - Bump xunit to v2.5.0.
    [#2306](https://github.com/Azure/PSRule.Rules.Azure/pull/2306)
  - Bump xunit.runner.visualstudio to v2.5.0.
    [#2307](https://github.com/Azure/PSRule.Rules.Azure/pull/2307)
- Bug fixes:
  - Fixed Redis firewall rules can not bind to start by @BernieWhite.
    [#2303](https://github.com/Azure/PSRule.Rules.Azure/issues/2303)

## v1.28.0-B0115 (pre-release)

What's changed since pre-release v1.28.0-B0079:

- General improvements:
  - Added support for Bicep CIDR functions by @BernieWhite.
    [#2279](https://github.com/Azure/PSRule.Rules.Azure/issues/2279)
    - Added support for `parseCidr`, `cidrSubnet`, and `cidrHost`.

## v1.28.0-B0079 (pre-release)

What's changed since pre-release v1.28.0-B0045:

- General improvements:
  - Added support for `managementGroupResourceId` Bicep function by @BernieWhite.
    [#2294](https://github.com/Azure/PSRule.Rules.Azure/issues/2294)
- Engineering:
  - Bump PSRule to v2.9.0.
    [#2293](https://github.com/Azure/PSRule.Rules.Azure/pull/2293)
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.3.
    [#2281](https://github.com/Azure/PSRule.Rules.Azure/pull/2281)
  - Bump Microsoft.NET.Test.Sdk to v17.6.3.
    [#2290](https://github.com/Azure/PSRule.Rules.Azure/pull/2290)
  - Bump coverlet.collector to v6.0.0.
    [#2232](https://github.com/Azure/PSRule.Rules.Azure/pull/2232)
- Bug fixes:
  - Fixed handling of JArray outputs with runtime values by @BernieWhite.
    [#2159](https://github.com/Azure/PSRule.Rules.Azure/issues/2159)

## v1.28.0-B0045 (pre-release)

What's changed since pre-release v1.28.0-B0024:

- Removed rules:
  - Azure Kubernetes Service:
    - Removed `Azure.AKS.PodIdentity` as pod identities has been replaced by workload identities by @BernieWhite.
      [#2273](https://github.com/Azure/PSRule.Rules.Azure/issues/2273)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.6.2.
    [#2266](https://github.com/Azure/PSRule.Rules.Azure/pull/2266)
  - Bump Az.Resources to v6.7.0.
    [#2274](https://github.com/Azure/PSRule.Rules.Azure/pull/2274)
- Bug fixes:
  - Fixed false positive of `IsolatedV2` with `Azure.AppService.MinPlan` by @BernieWhite.
    [#2277](https://github.com/Azure/PSRule.Rules.Azure/issues/2277)

## v1.28.0-B0024 (pre-release)

What's changed since pre-release v1.28.0-B0010:

- Bug fixes:
  - Fixed union function for merge of object properties by @BernieWhite.
    [#2264](https://github.com/Azure/PSRule.Rules.Azure/issues/2264)
  - Fixed length function counting properties in object by @BernieWhite.
    [#2263](https://github.com/Azure/PSRule.Rules.Azure/issues/2263)

## v1.28.0-B0010 (pre-release)

What's changed since v1.27.1:

- New rules:
  - Azure Database for MySQL:
    - Check that Azure AD authentication is configured for Azure Database for MySQL databases by @BenjaminEngeset.
      [#2226](https://github.com/Azure/PSRule.Rules.Azure/issues/2226)
  - Azure Database for PostgreSQL:
    - Check that Azure AD-only authentication is configured for Azure Database for PostgreSQL databases by @BenjaminEngeset.
      [#2250](https://github.com/Azure/PSRule.Rules.Azure/issues/2250)
    - Check that Azure AD authentication is configured for Azure Database for PostgreSQL databases by @BenjaminEngeset.
      [#2249](https://github.com/Azure/PSRule.Rules.Azure/issues/2249)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2261](https://github.com/Azure/PSRule.Rules.Azure/pull/2261)
  - Bump Microsoft.NET.Test.Sdk to v17.6.1.
    [#2256](https://github.com/Azure/PSRule.Rules.Azure/pull/2256)

## v1.27.3

What's changed since v1.27.2:

- Bug fixes:
  - Fixed false positive of `IsolatedV2` with `Azure.AppService.MinPlan` by @BernieWhite.
    [#2277](https://github.com/Azure/PSRule.Rules.Azure/issues/2277)

## v1.27.2

What's changed since v1.27.1:

- Bug fixes:
  - Fixed union function for merge of object properties by @BernieWhite.
    [#2264](https://github.com/Azure/PSRule.Rules.Azure/issues/2264)
  - Fixed length function counting properties in object by @BernieWhite.
    [#2263](https://github.com/Azure/PSRule.Rules.Azure/issues/2263)

## v1.27.1

What's changed since v1.27.0:

- Bug fixes:
  - Fixed depends on ordering fails to expand deployment by @BernieWhite.
    [#2255](https://github.com/Azure/PSRule.Rules.Azure/issues/2255)

## v1.27.0

What's changed since v1.26.1:

- New features:
  - **Experimental:** Added support for expanding deployments from `.bicepparam` files by @BernieWhite.
    [#2132](https://github.com/Azure/PSRule.Rules.Azure/issues/2132)
    - See [Using Bicep source](https://aka.ms/ps-rule-azure/bicep) for details.
- New rules:
  - Application Gateway:
    - Check that Application Gateways uses a v2 SKU by @BenjaminEngeset.
      [#2185](https://github.com/Azure/PSRule.Rules.Azure/issues/2185)
  - API Management:
    - Check that APIs published in Azure API Management are on-boarded to Microsoft Defender for APIs by @BenjaminEngeset.
      [#2187](https://github.com/Azure/PSRule.Rules.Azure/issues/2187)
    - Check that base element for any policy element in a section is configured by @BenjaminEngeset.
      [#2072](https://github.com/Azure/PSRule.Rules.Azure/issues/2072)
  - Arc-enabled Kubernetes cluster:
    - Check that Microsoft Defender for Containers extension for Arc-enabled Kubernetes clusters is configured by @BenjaminEngeset.
      [#2124](https://github.com/Azure/PSRule.Rules.Azure/issues/2124)
  - Arc-enabled server:
    - Check that a maintenance configuration for Arc-enabled servers is associated by @BenjaminEngeset.
      [#2122](https://github.com/Azure/PSRule.Rules.Azure/issues/2122)
  - Container App:
    - Check that container apps has disabled session affinity to prevent unbalanced distribution by @BenjaminEngeset.
      [#2188](https://github.com/Azure/PSRule.Rules.Azure/issues/2188)
    - Check that container apps with IP ingress restrictions mode configured is set to allow for all rules defined by @BenjaminEngeset.
      [#2189](https://github.com/Azure/PSRule.Rules.Azure/issues/2189)
  - Cosmos DB:
    - Check that Cosmos DB accounts has enabled Microsoft Defender by @BenjaminEngeset.
      [#2203](https://github.com/Azure/PSRule.Rules.Azure/issues/2203)
  - Defender for Cloud:
    - Check that sensitive data threat detection in Microsoft Defender for Storage is enabled by @BenjaminEngeset.
      [#2207](https://github.com/Azure/PSRule.Rules.Azure/issues/2207)
    - Check that Malware Scanning in Microsoft Defender for Storage is enabled by @BenjaminEngeset.
      [#2206](https://github.com/Azure/PSRule.Rules.Azure/issues/2206)
    - Check that Microsoft Defender for APIs is enabled by @BenjaminEngeset.
      [#2186](https://github.com/Azure/PSRule.Rules.Azure/issues/2186)
    - Check that Microsoft Defender for Azure Cosmos DB is enabled by @BenjaminEngeset.
      [#2204](https://github.com/Azure/PSRule.Rules.Azure/issues/2204)
    - Check that Microsoft Defender for open-source relational databases is enabled by @BenjaminEngeset.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check that Microsoft Defender Cloud Security Posture Management is using `Standard` plan by @BenjaminEngeset.
      [#2151](https://github.com/Azure/PSRule.Rules.Azure/issues/2151)
  - Key Vault:
    - Check that key vaults uses Azure RBAC as the authorization system for the data plane by @BenjaminEngeset.
      [#1916](https://github.com/Azure/PSRule.Rules.Azure/issues/1916)
  - Storage Account:
    - Check that Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
      [#2225](https://github.com/Azure/PSRule.Rules.Azure/issues/2225)
    - Check that sensitive data threat detection in Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
      [#2207](https://github.com/Azure/PSRule.Rules.Azure/issues/2207)
    - Check that Malware Scanning in Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
      [#2206](https://github.com/Azure/PSRule.Rules.Azure/issues/2206)
  - Virtual Machine:
    - Check that a maintenance configuration for virtual machines is associated by @BenjaminEngeset.
      [#2121](https://github.com/Azure/PSRule.Rules.Azure/issues/2121)
- General improvements:
  - Added support for Bicep symbolic names by @BernieWhite.
    [#2238](https://github.com/Azure/PSRule.Rules.Azure/issues/2238)
- Updated rules:
  - API Management:
    - Updated `Azure.APIM.EncryptValues` to check all API Management named values are encrypted with Key Vault secrets @BenjaminEngeset.
      [#2146](https://github.com/Azure/PSRule.Rules.Azure/issues/2146)
  - Container App:
    - Promoted `Azure.ContainerApp.Insecure` to GA rule set by @BernieWhite.
      [#2174](https://github.com/Azure/PSRule.Rules.Azure/issues/2174)
  - Defender for Cloud:
    - Check that Microsoft Defender for Storage v2 is enabled by @BenjaminEngeset.
      [#2205](https://github.com/Azure/PSRule.Rules.Azure/issues/2205)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.6.0.
    [#2216](https://github.com/Azure/PSRule.Rules.Azure/pull/2216)
- Bug fixes:
  - Fixed ignoring Redis firewall rules when Redis is configured to allow private connectivity by @BenjaminEngeset.
    [#2171](https://github.com/Azure/PSRule.Rules.Azure/issues/2171)
  - Fixed left-side `or` function evaluation by @BernieWhite.
    [#2220](https://github.com/Azure/PSRule.Rules.Azure/issues/2220)
  - Fixed interdependent variable copy loop count by @BernieWhite.
    [#2221](https://github.com/Azure/PSRule.Rules.Azure/issues/2221)
  - Fixed handling of database name in `Azure.MariaDB.Database` by @BernieWhite.
    [#2191](https://github.com/Azure/PSRule.Rules.Azure/issues/2191)
  - Fixed typing error in `Azure.Defender.Api` documentation by @BenjaminEngeset.
    [#2209](https://github.com/Azure/PSRule.Rules.Azure/issues/2209)
  - Fixed `Azure.AKS.UptimeSLA` with new pricing by @BenjaminEngeset.
    [#2065](https://github.com/Azure/PSRule.Rules.Azure/issues/2065)
    [#2202](https://github.com/Azure/PSRule.Rules.Azure/issues/2202)
  - Fixed false positive on managed identity without space by @BernieWhite.
    [#2235](https://github.com/Azure/PSRule.Rules.Azure/issues/2235)
  - Fixed reference for runtime subnet ID property by @BernieWhite.
    [#2159](https://github.com/Azure/PSRule.Rules.Azure/issues/2159)

What's changed since pre-release v1.27.0-B0186:

- No additional changes.

## v1.27.0-B0186 (pre-release)

What's changed since pre-release v1.27.0-B0136:

- New rules:
  - API Management:
    - Check that APIs published in Azure API Management are on-boarded to Microsoft Defender for APIs by @BenjaminEngeset.
      [#2187](https://github.com/Azure/PSRule.Rules.Azure/issues/2187)
  - Key Vault:
    - Check that key vaults uses Azure RBAC as the authorization system for the data plane by @BenjaminEngeset.
      [#1916](https://github.com/Azure/PSRule.Rules.Azure/issues/1916)
  - Storage Account:
    - Check that Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
      [#2225](https://github.com/Azure/PSRule.Rules.Azure/issues/2225)
    - Check that sensitive data threat detection in Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
      [#2207](https://github.com/Azure/PSRule.Rules.Azure/issues/2207)

## v1.27.0-B0136 (pre-release)

What's changed since pre-release v1.27.0-B0091:

- New rules:
  - Defender for Cloud:
    - Check that sensitive data threat detection in Microsoft Defender for Storage is enabled by @BenjaminEngeset.
      [#2207](https://github.com/Azure/PSRule.Rules.Azure/issues/2207)
- General improvements:
  - Added support for Bicep symbolic names by @BernieWhite.
    [#2238](https://github.com/Azure/PSRule.Rules.Azure/issues/2238)
- Bug fixes:
  - Fixed false positive on managed identity without space by @BernieWhite.
    [#2235](https://github.com/Azure/PSRule.Rules.Azure/issues/2235)

## v1.27.0-B0091 (pre-release)

What's changed since pre-release v1.27.0-B0050:

- New features:
  - **Experimental:** Added support for expanding deployments from `.bicepparam` files by @BernieWhite.
    [#2132](https://github.com/Azure/PSRule.Rules.Azure/issues/2132)
    - See [Using Bicep source](https://aka.ms/ps-rule-azure/bicep) for details.
- New rules:
  - Storage Account:
    - Check that Malware Scanning in Microsoft Defender for Storage is enabled for storage accounts by @BenjaminEngeset.
  - Defender for Cloud:
    - Check that Malware Scanning in Microsoft Defender for Storage is enabled by @BenjaminEngeset.
      [#2206](https://github.com/Azure/PSRule.Rules.Azure/issues/2206)
- Bug fixes:
  - Fixed left-side `or` function evaluation by @BernieWhite.
    [#2220](https://github.com/Azure/PSRule.Rules.Azure/issues/2220)
  - Fixed interdependent variable copy loop count by @BernieWhite.
    [#2221](https://github.com/Azure/PSRule.Rules.Azure/issues/2221)

## v1.27.0-B0050 (pre-release)

What's changed since pre-release v1.27.0-B0015:

- New rules:
  - Application Gateway:
    - Check that Application Gateways uses a v2 SKU by @BenjaminEngeset.
      [#2185](https://github.com/Azure/PSRule.Rules.Azure/issues/2185)
  - Arc-enabled Kubernetes cluster:
    - Check that Microsoft Defender for Containers extension for Arc-enabled Kubernetes clusters is configured by @BenjaminEngeset.
      [#2124](https://github.com/Azure/PSRule.Rules.Azure/issues/2124)
  - Arc-enabled server:
    - Check that a maintenance configuration for Arc-enabled servers is associated by @BenjaminEngeset.
      [#2122](https://github.com/Azure/PSRule.Rules.Azure/issues/2122)
  - Container App:
    - Check that container apps has disabled session affinity to prevent unbalanced distribution by @BenjaminEngeset.
      [#2188](https://github.com/Azure/PSRule.Rules.Azure/issues/2188)
    - Check that container apps with IP ingress restrictions mode configured is set to allow for all rules defined by @BenjaminEngeset.
      [#2189](https://github.com/Azure/PSRule.Rules.Azure/issues/2189)
  - Cosmos DB:
    - Check that Cosmos DB accounts has enabled Microsoft Defender by @BenjaminEngeset.
      [#2203](https://github.com/Azure/PSRule.Rules.Azure/issues/2203)
  - Defender for Cloud:
    - Check that Microsoft Defender for APIs is enabled by @BenjaminEngeset.
      [#2186](https://github.com/Azure/PSRule.Rules.Azure/issues/2186)
    - Check that Microsoft Defender for Azure Cosmos DB is enabled by @BenjaminEngeset.
      [#2204](https://github.com/Azure/PSRule.Rules.Azure/issues/2204)
    - Check that Microsoft Defender for open-source relational databases is enabled by @BenjaminEngeset.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
  - Virtual Machine:
    - Check that a maintenance configuration for virtual machines is associated by @BenjaminEngeset.
      [#2121](https://github.com/Azure/PSRule.Rules.Azure/issues/2121)
- Updated rules:
  - Defender for Cloud:
    - Check that Microsoft Defender for Storage v2 is enabled by @BenjaminEngeset.
      [#2205](https://github.com/Azure/PSRule.Rules.Azure/issues/2205)
- Engineering:
  - Bump Microsoft.NET.Test.Sdk to v17.6.0.
    [#2216](https://github.com/Azure/PSRule.Rules.Azure/pull/2216)
- Bug fixes:
  - Fixed handling of database name in `Azure.MariaDB.Database` by @BernieWhite.
    [#2191](https://github.com/Azure/PSRule.Rules.Azure/issues/2191)
  - Fixed typing error in `Azure.Defender.Api` documentation by @BenjaminEngeset.
    [#2209](https://github.com/Azure/PSRule.Rules.Azure/issues/2209)
  - Fixed `Azure.AKS.UptimeSLA` with new pricing by @BenjaminEngeset.
    [#2065](https://github.com/Azure/PSRule.Rules.Azure/issues/2065)
    [#2202](https://github.com/Azure/PSRule.Rules.Azure/issues/2202)

## v1.27.0-B0015 (pre-release)

What's changed since pre-release v1.27.0-B0003:

- New rules:
  - API Management:
    - Check that base element for any policy element in a section is configured by @BenjaminEngeset.
      [#2072](https://github.com/Azure/PSRule.Rules.Azure/issues/2072)
  - Defender for Cloud:
    - Check that Microsoft Defender Cloud Security Posture Management is using `Standard` plan by @BenjaminEngeset.
      [#2151](https://github.com/Azure/PSRule.Rules.Azure/issues/2151)
- Updated rules:
  - Container App:
    - Promoted `Azure.ContainerApp.Insecure` to GA rule set by @BernieWhite.
      [#2174](https://github.com/Azure/PSRule.Rules.Azure/issues/2174)
- Bug fixes:
  - Fixed ignoring Redis firewall rules when Redis is configured to allow private connectivity by @BenjaminEngeset.
    [#2171](https://github.com/Azure/PSRule.Rules.Azure/issues/2171)

## v1.27.0-B0003 (pre-release)

What's changed since v1.26.1:

- Updated rules:
  - API Management:
    - Updated `Azure.APIM.EncryptValues` to check all API Management named values are encrypted with Key Vault secrets @BenjaminEngeset.
      [#2146](https://github.com/Azure/PSRule.Rules.Azure/issues/2146)
- Bug fixes:
  - Fixed reference for runtime subnet ID property by @BernieWhite.
    [#2159](https://github.com/Azure/PSRule.Rules.Azure/issues/2159)

## v1.26.1

What's changed since v1.26.0:

- Bug fixes:
  - Fixed null union with first value being null by @BernieWhite.
    [#2075](https://github.com/Azure/PSRule.Rules.Azure/issues/2075)
  - Fixed `Azure.Resource.UseTags` for additional resources that don't support tags by @BernieWhite.
    [#2129](https://github.com/Azure/PSRule.Rules.Azure/issues/2129)

## v1.26.0

What's changed since v1.25.0:

- New features:
  - Added March 2023 baselines `Azure.GA_2023_03` and `Azure.Preview_2023_03` by @BernieWhite.
    [#2138](https://github.com/Azure/PSRule.Rules.Azure/issues/2138)
    - Includes rules released before or during March 2023.
    - Marked `Azure.GA_2022_12` and `Azure.Preview_2022_12` baselines as obsolete.
- New rules:
  - API Management:
    - Check that wildcard `*` for any configuration option in CORS policies settings is not in use by @BenjaminEngeset.
      [#2073](https://github.com/Azure/PSRule.Rules.Azure/issues/2073)
  - Azure Kubernetes Service:
    - Check that the Defender profile with Azure Kubernetes Service clusters are enabled by @BenjaminEngeset.
      [#2123](https://github.com/Azure/PSRule.Rules.Azure/issues/2123)
  - Container App:
    - Check that internal-only ingress for container apps are configured by @BenjaminEngeset.
      [#2098](https://github.com/Azure/PSRule.Rules.Azure/issues/2098)
    - Check that Azure File volumes for container apps are configured by @BenjaminEngeset.
      [#2101](https://github.com/Azure/PSRule.Rules.Azure/issues/2101)
    - Check that the names of container apps meets the naming requirements by @BenjaminEngeset.
      [#2094](https://github.com/Azure/PSRule.Rules.Azure/issues/2094)
    - Check that managed identity for container apps are configured by @BenjaminEngeset.
      [#2096](https://github.com/Azure/PSRule.Rules.Azure/issues/2096)
    - Check that public network access for container apps environments are disabled by @BenjaminEngeset.
      [#2098](https://github.com/Azure/PSRule.Rules.Azure/issues/2098)
  - Deployment:
    - Check that the names of nested deployments meets the naming requirements of deployments by @BenjaminEngeset.
      [#1915](https://github.com/Azure/PSRule.Rules.Azure/issues/1915)
  - IoT Hub:
    - Check IoT Hubs in supported regions only uses TLS 1.2 version by @BenjaminEngeset.
      [#1996](https://github.com/Azure/PSRule.Rules.Azure/issues/1996)
  - Service Bus:
    - Check namespaces audit diagnostic logs are enabled by @BenjaminEngeset.
      [#1862](https://github.com/Azure/PSRule.Rules.Azure/issues/1862)
  - SQL Database:
    - Check that Azure AD-only authentication is enabled by @BenjaminEngeset.
      [#2119](https://github.com/Azure/PSRule.Rules.Azure/issues/2119)
    - Check that Azure AD authentication is configured for SQL Managed Instances by @BenjaminEngeset.
      [#2117](https://github.com/Azure/PSRule.Rules.Azure/issues/2117)
  - SQL Managed Instance:
    - Check that managed identity for SQL Managed Instances are configured by @BenjaminEngeset.
      [#2120](https://github.com/Azure/PSRule.Rules.Azure/issues/2120)
    - Check that Azure AD-only authentication is enabled by @BenjaminEngeset.
      [#2118](https://github.com/Azure/PSRule.Rules.Azure/issues/2118)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.25.6` by @BernieWhite.
      [#2136](https://github.com/Azure/PSRule.Rules.Azure/issues/2136)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- General improvements:
  - Added a selector for premium Service Bus namespaces by @BernieWhite.
    [#2091](https://github.com/Azure/PSRule.Rules.Azure/issues/2091)
  - Improved export of in-flight deeply nested API Management policies by @BernieWhite.
    [#2153](https://github.com/Azure/PSRule.Rules.Azure/issues/2153)
- Engineering:
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.1.
    [#2082](https://github.com/Azure/PSRule.Rules.Azure/pull/2082)
  - Bump Newtonsoft.Json to v13.0.3.
    [#2080](https://github.com/Azure/PSRule.Rules.Azure/pull/2080)
  - Updated resource providers and policy aliases.
    [#2144](https://github.com/Azure/PSRule.Rules.Azure/pull/2144)
  - Bump PSRule to v2.8.1.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
  - Bump Az.Resources to v6.6.0.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
  - Bump Pester to v5.4.1.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
- Bug fixes:
  - Fixed dependency issue of deployments across resource group scopes by @BernieWhite.
    [#2111](https://github.com/Azure/PSRule.Rules.Azure/issues/2111)
  - Fixed false positive with `Azure.Deployment.Name` by @BernieWhite.
    [#2109](https://github.com/Azure/PSRule.Rules.Azure/issues/2109)
  - Fixed false positives for `Azure.AppService.AlwaysOn` with Functions and Workflows by @BernieWhite.
    [#943](https://github.com/Azure/PSRule.Rules.Azure/issues/943)

What's changed since pre-release v1.26.0-B0078:

- No additional changes.

## v1.26.0-B0078 (pre-release)

What's changed since pre-release v1.26.0-B0040:

- General improvements:
  - Improved export of in-flight deeply nested API Management policies by @BernieWhite.
    [#2153](https://github.com/Azure/PSRule.Rules.Azure/issues/2153)
- Engineering:
  - Updated resource providers and policy aliases.
    [#2144](https://github.com/Azure/PSRule.Rules.Azure/pull/2144)
  - Bump PSRule to v2.8.1.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
  - Bump Az.Resources to v6.6.0.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
  - Bump Pester to v5.4.1.
    [#2155](https://github.com/Azure/PSRule.Rules.Azure/pull/2155)
- Bug fixes:
  - Fixed false positives for `Azure.AppService.AlwaysOn` with Functions and Workflows by @BernieWhite.
    [#943](https://github.com/Azure/PSRule.Rules.Azure/issues/943)

## v1.26.0-B0040 (pre-release)

What's changed since pre-release v1.26.0-B0011:

- New features:
  - Added March 2023 baselines `Azure.GA_2023_03` and `Azure.Preview_2023_03` by @BernieWhite.
    [#2138](https://github.com/Azure/PSRule.Rules.Azure/issues/2138)
    - Includes rules released before or during March 2023.
    - Marked `Azure.GA_2022_12` and `Azure.Preview_2022_12` baselines as obsolete.
- New rules:
  - API Management:
    - Check that wildcard `*` for any configuration option in CORS policies settings is not in use by @BenjaminEngeset.
      [#2073](https://github.com/Azure/PSRule.Rules.Azure/issues/2073)
  - Azure Kubernetes Service:
    - Check that the Defender profile with Azure Kubernetes Service clusters are enabled by @BenjaminEngeset.
      [#2123](https://github.com/Azure/PSRule.Rules.Azure/issues/2123)
  - Container App:
    - Check that internal-only ingress for container apps are configured by @BenjaminEngeset.
      [#2098](https://github.com/Azure/PSRule.Rules.Azure/issues/2098)
    - Check that Azure File volumes for container apps are configured by @BenjaminEngeset.
      [#2101](https://github.com/Azure/PSRule.Rules.Azure/issues/2101)
  - SQL Database:
    - Check that Azure AD-only authentication is enabled by @BenjaminEngeset.
      [#2119](https://github.com/Azure/PSRule.Rules.Azure/issues/2119)
    - Check that Azure AD authentication is configured for SQL Managed Instances by @BenjaminEngeset.
      [#2117](https://github.com/Azure/PSRule.Rules.Azure/issues/2117)
  - SQL Managed Instance:
    - Check that managed identity for SQL Managed Instances are configured by @BenjaminEngeset.
      [#2120](https://github.com/Azure/PSRule.Rules.Azure/issues/2120)
    - Check that Azure AD-only authentication is enabled by @BenjaminEngeset.
      [#2118](https://github.com/Azure/PSRule.Rules.Azure/issues/2118)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.25.6` by @BernieWhite.
      [#2136](https://github.com/Azure/PSRule.Rules.Azure/issues/2136)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- Bug fixes:
  - Fixed dependency issue of deployments across resource group scopes by @BernieWhite.
    [#2111](https://github.com/Azure/PSRule.Rules.Azure/issues/2111)
  - Fixed false positive with `Azure.Deployment.Name` by @BernieWhite.
    [#2109](https://github.com/Azure/PSRule.Rules.Azure/issues/2109)

## v1.26.0-B0011 (pre-release)

What's changed since v1.25.0:

- New rules:
  - Container App:
    - Check that the names of container apps meets the naming requirements by @BenjaminEngeset.
      [#2094](https://github.com/Azure/PSRule.Rules.Azure/issues/2094)
    - Check that managed identity for container apps are configured by @BenjaminEngeset.
      [#2096](https://github.com/Azure/PSRule.Rules.Azure/issues/2096)
    - Check that public network access for container apps environments are disabled by @BenjaminEngeset.
      [#2098](https://github.com/Azure/PSRule.Rules.Azure/issues/2098)
  - Deployment:
    - Check that the names of nested deployments meets the naming requirements of deployments by @BenjaminEngeset.
      [#1915](https://github.com/Azure/PSRule.Rules.Azure/issues/1915)
  - IoT Hub:
    - Check IoT Hubs in supported regions only uses TLS 1.2 version by @BenjaminEngeset.
      [#1996](https://github.com/Azure/PSRule.Rules.Azure/issues/1996)
  - Service Bus:
    - Check namespaces audit diagnostic logs are enabled by @BenjaminEngeset.
      [#1862](https://github.com/Azure/PSRule.Rules.Azure/issues/1862)
- General improvements:
  - Added a selector for premium Service Bus namespaces by @BernieWhite.
    [#2091](https://github.com/Azure/PSRule.Rules.Azure/issues/2091)
- Engineering:
  - Bump Microsoft.CodeAnalysis.NetAnalyzers to v7.0.1.
    [#2082](https://github.com/Azure/PSRule.Rules.Azure/pull/2082)
  - Bump Newtonsoft.Json to v13.0.3.
    [#2080](https://github.com/Azure/PSRule.Rules.Azure/pull/2080)

## v1.25.1

What's changed since v1.25.0:

- Bug fixes:
  - Fixed dependency issue of deployments across resource group scopes by @BernieWhite.
    [#2111](https://github.com/Azure/PSRule.Rules.Azure/issues/2111)

## v1.25.0

What's changed since v1.24.2:

- New features:
  - **Experimental:** Added `Azure.MCSB.v1` which include rules aligned to the Microsoft Cloud Security Benchmark by @BernieWhite.
    [#1634](https://github.com/Azure/PSRule.Rules.Azure/issues/1634)
- New rules:
  - Defender for Cloud:
    - Check Microsoft Defender for Key Vault is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for DNS is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for ARM is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
  - Event Hub:
    - Check Event Hub namespaces only uses TLS 1.2 version by @BenjaminEngeset.
      [#1995](https://github.com/Azure/PSRule.Rules.Azure/issues/1995)
  - Key Vault:
    - Check if firewall is set to deny by @zilberd.
      [#2067](https://github.com/Azure/PSRule.Rules.Azure/issues/2067)
  - Virtual Machine:
    - Virtual machines should be fully deallocated and not stopped by @dcrreynolds.
      [#88](https://github.com/Azure/PSRule.Rules.Azure/issues/88)
- General improvements:
  - Added support for Bicep `toObject` function by @BernieWhite.
    [#2014](https://github.com/Azure/PSRule.Rules.Azure/issues/2014)
  - Added support for configuring a minimum version of Bicep by @BernieWhite.
    [#1935](https://github.com/Azure/PSRule.Rules.Azure/issues/1935)
    - Configure this option to increase the visibility of the version of the Bicep CLI used by PSRule for Azure.
    - Set `AZURE_BICEP_CHECK_TOOL` to `true` to check the Bicep CLI.
    - Set `AZURE_BICEP_MINIMUM_VERSION` to configure the minimum version.
    - If the Bicep CLI is not installed or the version is less than the minimum version an error will be reported.
    - By default, the minimum Bicep version defaults to `0.4.451`.
  - Added support for Bicep custom types by @BernieWhite.
    [#2026](https://github.com/Azure/PSRule.Rules.Azure/issues/2026)
- Engineering:
  - Bump BenchmarkDotNet to v0.13.5.
    [#2052](https://github.com/Azure/PSRule.Rules.Azure/pull/2052)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.5.
    [#2052](https://github.com/Azure/PSRule.Rules.Azure/pull/2052)
  - Bump Microsoft.NET.Test.Sdk to v17.5.0.
    [#2055](https://github.com/Azure/PSRule.Rules.Azure/pull/2055)
  - Bump Az.Resources to v6.5.2.
    [#2037](https://github.com/Azure/PSRule.Rules.Azure/pull/2037)
  - Updated build to use GitHub Actions by @BernieWhite.
    [#1696](https://github.com/Azure/PSRule.Rules.Azure/issues/1696)
- Bug fixes:
  - Fixed SQL transparent data Encryption (TDE) works properly on all resources including exported resources by @zilberd.
    [#2059](https://github.com/Azure/PSRule.Rules.Azure/issues/2059)
  - Fixed cases of exit code 5 with path probing by @BernieWhite.
    [#1901](https://github.com/Azure/PSRule.Rules.Azure/issues/1901)

What's changed since pre-release v1.25.0-B0100:

- No additional changes.

## v1.25.0-B0138 (pre-release)

What's changed since pre-release v1.25.0-B0100:

- New rules:
  - Event Hub:
    - Check Event Hub namespaces only uses TLS 1.2 version by @BenjaminEngeset.
      [#1995](https://github.com/Azure/PSRule.Rules.Azure/issues/1995)

## v1.25.0-B0100 (pre-release)

What's changed since pre-release v1.25.0-B0065:

- New rules:
  - Key Vault:
    - Check if firewall is set to deny by @zilberd.
      [#2067](https://github.com/Azure/PSRule.Rules.Azure/issues/2067)

## v1.25.0-B0065 (pre-release)

What's changed since pre-release v1.25.0-B0035:

- General improvements:
  - Added support for Bicep `toObject` function by @BernieWhite.
    [#2014](https://github.com/Azure/PSRule.Rules.Azure/issues/2014)
- Engineering:
  - Bump BenchmarkDotNet to v0.13.5.
    [#2052](https://github.com/Azure/PSRule.Rules.Azure/pull/2052)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.5.
    [#2052](https://github.com/Azure/PSRule.Rules.Azure/pull/2052)
  - Bump Microsoft.NET.Test.Sdk to v17.5.0.
    [#2055](https://github.com/Azure/PSRule.Rules.Azure/pull/2055)
- Bug fixes:
  - Fixed SQL transparent data Encryption (TDE) works properly on all resources including exported resources by @zilberd.
    [#2059](https://github.com/Azure/PSRule.Rules.Azure/issues/2059)

## v1.25.0-B0035 (pre-release)

What's changed since pre-release v1.25.0-B0013:

- New rules:
  - Defender for Cloud:
    - Check Microsoft Defender for Key Vault is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for DNS is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for ARM is enabled by @BernieWhite.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
- General improvements:
  - Added support for configuring a minimum version of Bicep by @BernieWhite.
    [#1935](https://github.com/Azure/PSRule.Rules.Azure/issues/1935)
    - Configure this option to increase the visibility of the version of the Bicep CLI used by PSRule for Azure.
    - Set `AZURE_BICEP_CHECK_TOOL` to `true` to check the Bicep CLI.
    - Set `AZURE_BICEP_MINIMUM_VERSION` to configure the minimum version.
    - If the Bicep CLI is not installed or the version is less than the minimum version an error will be reported.
    - By default, the minimum Bicep version defaults to `0.4.451`.
- Engineering:
  - Bump Az.Resources to v6.5.2.
    [#2037](https://github.com/Azure/PSRule.Rules.Azure/pull/2037)
- Bug fixes:
  - Fixed cases of exit code 5 with path probing by @BernieWhite.
    [#1901](https://github.com/Azure/PSRule.Rules.Azure/issues/1901)

## v1.25.0-B0013 (pre-release)

What's changed since v1.24.2:

- New features:
  - **Experimental:** Added `Azure.MCSB.v1` which include rules aligned to the Microsoft Cloud Security Benchmark by @BernieWhite.
    [#1634](https://github.com/Azure/PSRule.Rules.Azure/issues/1634)
- New rules:
  - Virtual Machine:
    - Virtual machines should be fully deallocated and not stopped by @dcrreynolds.
      [#88](https://github.com/Azure/PSRule.Rules.Azure/issues/88)
- General improvements:
  - Added support for Bicep custom types by @BernieWhite.
    [#2026](https://github.com/Azure/PSRule.Rules.Azure/issues/2026)
- Engineering:
  - Updated build to use GitHub Actions by @BernieWhite.
    [#1696](https://github.com/Azure/PSRule.Rules.Azure/issues/1696)
  - Bump BenchmarkDotNet to v0.13.4.
    [#1992](https://github.com/Azure/PSRule.Rules.Azure/pull/1992)
  - Bump BenchmarkDotNet.Diagnostics.Windows to v0.13.4.
    [#1992](https://github.com/Azure/PSRule.Rules.Azure/pull/1992)

## v1.24.2

This is a republish of v1.24.1 to fix a release issue.
What's changed since v1.24.0:

- Bug fixes:
  - Fixed Bicep expand object or null by @BernieWhite.
    [#2021](https://github.com/Azure/PSRule.Rules.Azure/issues/2021)

## v1.24.1

What's changed since v1.24.0:

- Bug fixes:
  - Fixed Bicep expand object or null by @BernieWhite.
    [#2021](https://github.com/Azure/PSRule.Rules.Azure/issues/2021)

## v1.24.0

What's changed since v1.23.0:

- General improvements:
  - Updated `Export-AzRuleData` to improve export performance by @BernieWhite.
    [#1341](https://github.com/Azure/PSRule.Rules.Azure/issues/1341)
    - Removed `Az.Resources` dependency.
    - Added async threading for export concurrency.
    - Improved performance by using automatic look up of API versions by using provider cache.
  - Added support for Bicep lambda functions by @BernieWhite.
    [#1536](https://github.com/Azure/PSRule.Rules.Azure/issues/1536)
    - Bicep `filter`, `map`, `reduce`, and `sort` are supported.
    - Support for `flatten` was previously added in v1.23.0.
  - Added optimization for policy type conditions by @BernieWhite.
    [#1966](https://github.com/Azure/PSRule.Rules.Azure/issues/1966)
- Engineering:
  - Bump PSRule to v2.7.0.
    [#1973](https://github.com/Azure/PSRule.Rules.Azure/pull/1973)
  - Updated resource providers and policy aliases.
    [#1736](https://github.com/Azure/PSRule.Rules.Azure/pull/1736)
  - Bump Az.Resources to v6.5.1.
    [#1973](https://github.com/Azure/PSRule.Rules.Azure/pull/1973)
  - Bump Newtonsoft.Json to v13.0.2.
    [#1903](https://github.com/Azure/PSRule.Rules.Azure/pull/1903)
  - Bump Pester to v5.4.0.
    [#1994](https://github.com/Azure/PSRule.Rules.Azure/pull/1994)
- Bug fixes:
  - Fixed `Export-AzRuleData` may not export all data if throttled by @BernieWhite.
    [#1341](https://github.com/Azure/PSRule.Rules.Azure/issues/1341)
  - Fixed failed to expand nested deployment with runtime shallow parameter by @BernieWhite.
    [#2004](https://github.com/Azure/PSRule.Rules.Azure/issues/2004)
  - Fixed `apiVersion` comparison of `requestContext` by @BernieWhite.
    [#1654](https://github.com/Azure/PSRule.Rules.Azure/issues/1654)
  - Fixed simple cases for field type expressions by @BernieWhite.
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)

What's changed since pre-release v1.24.0-B0035:

- No additional changes.

## v1.24.0-B0035 (pre-release)

What's changed since pre-release v1.24.0-B0013:

- General improvements:
  - Added support for Bicep lambda functions by @BernieWhite.
    [#1536](https://github.com/Azure/PSRule.Rules.Azure/issues/1536)
    - Bicep `filter`, `map`, `reduce`, and `sort` are supported.
    - Support for `flatten` was previously added in v1.23.0.
  - Added optimization for policy type conditions by @BernieWhite.
    [#1966](https://github.com/Azure/PSRule.Rules.Azure/issues/1966)
- Engineering:
  - Updated resource providers and policy aliases.
    [#1736](https://github.com/Azure/PSRule.Rules.Azure/pull/1736)
- Bug fixes:
  - Fixed failed to expand nested deployment with runtime shallow parameter by @BernieWhite.
    [#2004](https://github.com/Azure/PSRule.Rules.Azure/issues/2004)
  - Fixed `apiVersion` comparison of `requestContext` by @BernieWhite.
    [#1654](https://github.com/Azure/PSRule.Rules.Azure/issues/1654)
  - Fixed simple cases for field type expressions by @BernieWhite.
    [#1323](https://github.com/Azure/PSRule.Rules.Azure/issues/1323)

## v1.24.0-B0013 (pre-release)

What's changed since v1.23.0:

- General improvements:
  - Updated `Export-AzRuleData` to improve export performance by @BernieWhite.
    [#1341](https://github.com/Azure/PSRule.Rules.Azure/issues/1341)
    - Removed `Az.Resources` dependency.
    - Added async threading for export concurrency.
    - Improved performance by using automatic look up of API versions by using provider cache.
- Engineering:
  - Bump PSRule to v2.7.0.
    [#1973](https://github.com/Azure/PSRule.Rules.Azure/pull/1973)
  - Bump Az.Resources to v6.5.1.
    [#1973](https://github.com/Azure/PSRule.Rules.Azure/pull/1973)
  - Bump Newtonsoft.Json to v13.0.2.
    [#1903](https://github.com/Azure/PSRule.Rules.Azure/pull/1903)
  - Bump Pester to v5.4.0.
    [#1994](https://github.com/Azure/PSRule.Rules.Azure/pull/1994)
- Bug fixes:
  - Fixed `Export-AzRuleData` may not export all data if throttled by @BernieWhite.
    [#1341](https://github.com/Azure/PSRule.Rules.Azure/issues/1341)

## v1.23.0

What's changed since v1.22.2:

- New features:
  - Added December 2022 baselines `Azure.GA_2022_12` and `Azure.Preview_2022_12` by @BernieWhite.
    [#1961](https://github.com/Azure/PSRule.Rules.Azure/issues/1961)
    - Includes rules released before or during December 2022.
    - Marked `Azure.GA_2022_09` and `Azure.Preview_2022_09` baselines as obsolete.
- New rules:
  - API Management:
    - Check API management instances has multi-region deployment gateways enabled by @BenjaminEngeset.
      [#1910](https://github.com/Azure/PSRule.Rules.Azure/issues/1910)
  - Application Gateway:
    - Check Application Gateways names meet naming requirements by @BenjaminEngeset.
      [#1943](https://github.com/Azure/PSRule.Rules.Azure/issues/1943)
  - Azure Cache for Redis:
    - Check Azure Cache for Redis instances uses Redis 6 by @BenjaminEngeset.
      [#1077](https://github.com/Azure/PSRule.Rules.Azure/issues/1077)
  - Azure Database for MariaDB:
    - Check Azure Database for MariaDB servers limits the amount of firewall permitted IP addresses by @BenjaminEngeset.
      [#1856](https://github.com/Azure/PSRule.Rules.Azure/issues/1856)
    - Check Azure Database for MariaDB servers limits the amount of firewall rules allowed by @BenjaminEngeset.
      [#1855](https://github.com/Azure/PSRule.Rules.Azure/issues/1855)
    - Check Azure Database for MariaDB servers does not have Azure services bypassed on firewall by @BenjaminEngeset.
      [#1857](https://github.com/Azure/PSRule.Rules.Azure/issues/1857)
  - Bastion:
    - Check Bastion hosts names meet naming requirements by @BenjaminEngeset.
      [#1950](https://github.com/Azure/PSRule.Rules.Azure/issues/1950)
  - Recovery Services Vault:
    - Check Recovery Services vaults names meet naming requirements by @BenjaminEngeset.
      [#1953](https://github.com/Azure/PSRule.Rules.Azure/issues/1953)
  - Virtual Machine:
    - Check virtual machines has Azure Monitor Agent installed by @BenjaminEngeset.
      [#1868](https://github.com/Azure/PSRule.Rules.Azure/issues/1868)
  - Virtual Machine Scale Sets:
    - Check virtual machine scale sets has Azure Monitor Agent installed by @BenjaminEngeset.
      [#1867](https://github.com/Azure/PSRule.Rules.Azure/issues/1867)
- Updated rules:
  - Azure Kubernetes Service:
    - Updated `Azure.AKS.Version` to use latest stable version `1.25.4` by @BernieWhite.
      [#1960](https://github.com/Azure/PSRule.Rules.Azure/issues/1960)
      - Use `AZURE_AKS_CLUSTER_MINIMUM_VERSION` to configure the minimum version of the cluster.
- General improvements:
  - Improves handling for policy definition modes by using support tags selector by @BernieWhite.
    [#1946](https://github.com/Azure/PSRule.Rules.Azure/issues/1946)
  - Added support to export exemptions related to policy assignments by @BernieWhite.
    [#1888](https://github.com/Azure/PSRule.Rules.Azure/issues/1888)
  - Added support for Bicep `flatten` function by @BernieWhite.
    [#1536](https://github.com/Azure/PSRule.Rules.Azure/issues/1536)
- Engineering:
  - Bump Az.Resources to v6.5.0.
    [#1945](https://github.com/Azure/PSRule.Rules.Azure/pull/1945)
  - Bump Microsoft.NET.Test.Sdk v17.4.1.
    [#1964](https://github.com/Azure/PSRule.Rules.Azure/pull/1964)
- Bug fixes:
  - Fixed Azure.AKS.Version ignore clusters with auto-upgrade enabled by @BenjaminEngeset.
    [#1926](https://github.com/Azure/PSRule.Rules.Azure/issues/1926)

What's changed since pre-release v1.23.0-B0072:

- No additional changes.

## v1.23.0-B0072 (pre-release)

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
- General improvements:
  - Improves handling for policy definition modes by using support tags selector by @BernieWhite.
    [#1946](https://github.com/Azure/PSRule.Rules.Azure/issues/1946)
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
    - Check Microsoft Defender for Containers is enable by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Servers is enabled by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for SQL is enabled by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for App Services is enabled by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Storage is enabled by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for SQL Servers on VMs is enabled by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
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
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Virtual Machines by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for App Services by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for Storage Accounts by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
    - Check Microsoft Defender for Cloud is enabled for SQL Servers on machines by @jdewisscher.
      [#1632](https://github.com/Azure/PSRule.Rules.Azure/issues/1632)
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
  - **Experimental:** Cmdlets to validate objects with Azure policy conditions:
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
  - **Experimental:** Cmdlets to validate objects with Azure policy conditions:
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
  - Added `Azure.GA_2021_09` baseline.
    [#961](https://github.com/Azure/PSRule.Rules.Azure/issues/961)
    - Includes rules released before or during September 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_06` as obsolete.
- New rules:
  - Application Gateway:
    - Check App Gateways should use availability zones when available by @ArmaanMcleod.
      [#928](https://github.com/Azure/PSRule.Rules.Azure/issues/928)
  - Azure Kubernetes Service:
    - Check clusters have control plane audit logs enabled by @ArmaanMcleod.
      [#882](https://github.com/Azure/PSRule.Rules.Azure/issues/882)
    - Check clusters have control plane diagnostics enabled by @ArmaanMcleod.
      [#922](https://github.com/Azure/PSRule.Rules.Azure/issues/922)
    - Check clusters use Container Insights for monitoring workloads by @ArmaanMcleod.
      [#881](https://github.com/Azure/PSRule.Rules.Azure/issues/881)
    - Check clusters use availability zones when available by @ArmaanMcleod.
      [#880](https://github.com/Azure/PSRule.Rules.Azure/issues/880)
  - Cosmos DB:
    - Check DB account names meet naming requirements.
      [#954](https://github.com/Azure/PSRule.Rules.Azure/issues/954)
    - Check DB accounts use Azure AD identities for resource management operations.
      [#953](https://github.com/Azure/PSRule.Rules.Azure/issues/953)
  - Load Balancer:
    - Check Load balancers are using Standard SKU by @ArmaanMcleod.
      [#957](https://github.com/Azure/PSRule.Rules.Azure/issues/957)
    - Check Load Balancers are configured with zone-redundancy by @ArmaanMcleod.
      [#927](https://github.com/Azure/PSRule.Rules.Azure/issues/927)
- Engineering:
  - Bump PSRule dependency to v1.7.2.
    [#951](https://github.com/Azure/PSRule.Rules.Azure/issues/951)
  - Automated update of availability zone information in providers.json.
    [#907](https://github.com/Azure/PSRule.Rules.Azure/issues/907)
  - Increased test coverage of rule reasons by @ArmaanMcleod.
    [#960](https://github.com/Azure/PSRule.Rules.Azure/issues/960)
- Bug fixes:
  - Fixed export of in-flight AKS related subnets for kubenet clusters by @ArmaanMcleod.
    [#920](https://github.com/Azure/PSRule.Rules.Azure/issues/920)
  - Fixed plan instance count is not applicable to Elastic Premium plans.
    [#946](https://github.com/Azure/PSRule.Rules.Azure/issues/946)
  - Fixed minimum App Service Plan fails Elastic Premium plans.
    [#945](https://github.com/Azure/PSRule.Rules.Azure/issues/945)
  - Fixed App Service Plan should include PremiumV3 plan.
    [#944](https://github.com/Azure/PSRule.Rules.Azure/issues/944)
  - Fixed Azure.VM.NICAttached with private endpoints.
    [#932](https://github.com/Azure/PSRule.Rules.Azure/issues/932)
  - Fixed Bicep CLI fails with unexpected end of content.
    [#889](https://github.com/Azure/PSRule.Rules.Azure/issues/889)
  - Fixed incomplete reason message for `Azure.Storage.MinTLS`.
    [#971](https://github.com/Azure/PSRule.Rules.Azure/issues/971)
  - Fixed false positive of `Azure.Storage.UseReplication` with large file storage.
    [#965](https://github.com/Azure/PSRule.Rules.Azure/issues/965)

What's changed since pre-release v1.8.0-B2109060:

- No additional changes.

## v1.8.0-B2109086 (pre-release)

What's changed since pre-release v1.8.0-B2109060:

- New rules:
  - Load Balancer:
    - Check Load balancers are using Standard SKU. by @ArmaanMcleod.
      [#957](https://github.com/Azure/PSRule.Rules.Azure/issues/957)
- Engineering:
  - Increased test coverage of rule reasons. by @ArmaanMcleod.
    [#960](https://github.com/Azure/PSRule.Rules.Azure/issues/960)
- Bug fixes:
  - Fixed Bicep CLI fails with unexpected end of content.
    [#889](https://github.com/Azure/PSRule.Rules.Azure/issues/889)
  - Fixed incomplete reason message for `Azure.Storage.MinTLS`.
    [#971](https://github.com/Azure/PSRule.Rules.Azure/issues/971)
  - Fixed false positive of `Azure.Storage.UseReplication` with large file storage.
    [#965](https://github.com/Azure/PSRule.Rules.Azure/issues/965)

## v1.8.0-B2109060 (pre-release)

What's changed since pre-release v1.8.0-B2109046:

- New features:
  - Added `Azure.GA_2021_09` baseline.
    [#961](https://github.com/Azure/PSRule.Rules.Azure/issues/961)
    - Includes rules released before or during September 2021 for Azure GA features.
    - Marked baseline `Azure.GA_2021_06` as obsolete.
- New rules:
  - Load Balancer:
    - Check Load Balancers are configured with zone-redundancy by @ArmaanMcleod.
      [#927](https://github.com/Azure/PSRule.Rules.Azure/issues/927)

## v1.8.0-B2109046 (pre-release)

What's changed since pre-release v1.8.0-B2109020:

- New rules:
  - Application Gateway:
    - Check App Gateways should use availability zones when available by @ArmaanMcleod
      [#928](https://github.com/Azure/PSRule.Rules.Azure/issues/928)
  - Cosmos DB:
    - Check DB account names meet naming requirements.
      [#954](https://github.com/Azure/PSRule.Rules.Azure/issues/954)
    - Check DB accounts use Azure AD identities for resource management operations.
      [#953](https://github.com/Azure/PSRule.Rules.Azure/issues/953)
- Bug fixes:
  - Fixed plan instance count is not applicable to Elastic Premium plans.
    [#946](https://github.com/Azure/PSRule.Rules.Azure/issues/946)
  - Fixed minimum App Service Plan fails Elastic Premium plans.
    [#945](https://github.com/Azure/PSRule.Rules.Azure/issues/945)
  - Fixed App Service Plan should include PremiumV3 plan.
    [#944](https://github.com/Azure/PSRule.Rules.Azure/issues/944)
  - Fixed Azure.VM.NICAttached with private endpoints.
    [#932](https://github.com/Azure/PSRule.Rules.Azure/issues/932)
- Engineering:
  - Bump PSRule dependency to v1.7.2.
    [#951](https://github.com/Azure/PSRule.Rules.Azure/issues/951)

## v1.8.0-B2109020 (pre-release)

What's changed since pre-release v1.8.0-B2108026:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters have control plane audit logs enabled by @ArmaanMcleod.
      [#882](https://github.com/Azure/PSRule.Rules.Azure/issues/882)
    - Check clusters have control plane diagnostics enabled by @ArmaanMcleod.
      [#922](https://github.com/Azure/PSRule.Rules.Azure/issues/922)
- Engineering:
  - Bump PSRule dependency to v1.7.0.
    [#938](https://github.com/Azure/PSRule.Rules.Azure/issues/938)

## v1.8.0-B2108026 (pre-release)

What's changed since pre-release v1.8.0-B2108013:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use Container Insights for monitoring workloads by @ArmaanMcleod.
      [#881](https://github.com/Azure/PSRule.Rules.Azure/issues/881)
- Bug fixes:
  - Fixed export of in-flight AKS related subnets for kubenet clusters by @ArmaanMcleod.
    [#920](https://github.com/Azure/PSRule.Rules.Azure/issues/920)

## v1.8.0-B2108013 (pre-release)

What's changed since v1.7.0:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use availability zones when available by @ArmaanMcleod.
      [#880](https://github.com/Azure/PSRule.Rules.Azure/issues/880)
- Engineering:
  - Bump PSRule dependency to v1.6.1.
    [#913](https://github.com/Azure/PSRule.Rules.Azure/issues/913)
  - Automated update of availability zone information in providers.json.
    [#907](https://github.com/Azure/PSRule.Rules.Azure/issues/907)

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
    - Check clusters using Azure CNI should use large subnets by @ArmaanMcleod. [#273](https://github.com/Azure/PSRule.Rules.Azure/issues/273)
    - Check clusters use auto-scale node pools by @ArmaanMcleod. [#218](https://github.com/Azure/PSRule.Rules.Azure/issues/218)
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
    - Check clusters using Azure CNI should use large subnets by @ArmaanMcleod. [#273](https://github.com/Azure/PSRule.Rules.Azure/issues/273)
      - By default, a minimum of a `/23` subnet is required.
      - Configure `AZURE_AKS_CNI_MINIMUM_CLUSTER_SUBNET_SIZE` to change the default minimum subnet size.
  - Storage Account:
    - Check Storage Accounts only accept explicitly allowed network traffic. [#884](https://github.com/Azure/PSRule.Rules.Azure/issues/884)

## v1.7.0-B2108020 (pre-release)

What's changed since v1.6.0:

- New rules:
  - Azure Kubernetes Service:
    - Check clusters use auto-scale node pools by @ArmaanMcleod. [#218](https://github.com/Azure/PSRule.Rules.Azure/issues/218)
- Updated rules:
  - Virtual Network:
    - Excluded `AzureFirewallManagementSubnet` from `Azure.VNET.UseNSGs`. [#869](https://github.com/Azure/PSRule.Rules.Azure/issues/869)
- Engineering:
  - Bump PSRule dependency to v1.6.0. [#871](https://github.com/Azure/PSRule.Rules.Azure/issues/871)

## v1.6.0

What's changed since v1.5.1:

- New features:
  - **Experimental:** Added support for expansion from Bicep source files.
    [#848](https://github.com/Azure/PSRule.Rules.Azure/issues/848)
    [#670](https://github.com/Azure/PSRule.Rules.Azure/issues/670)
    [#858](https://github.com/Azure/PSRule.Rules.Azure/issues/858)
    - Bicep support is currently experimental.
    - To opt-in set the `AZURE_BICEP_FILE_EXPANSION` configuration to `true`.
    - For more information see [Using Bicep](https://azure.github.io/PSRule.Rules.Azure/using-bicep/).
- New rules:
  - Application Gateways:
    - Check Application Gateways publish endpoints by HTTPS.
      [#841](https://github.com/Azure/PSRule.Rules.Azure/issues/841)
- Engineering:
  - Bump PSRule dependency to v1.5.0.
    [#832](https://github.com/Azure/PSRule.Rules.Azure/issues/832)
  - Migration of Pester v4 tests to Pester v5 by @ArmaanMcleod.
    [#395](https://github.com/Azure/PSRule.Rules.Azure/issues/395)

What's changed since pre-release v1.6.0-B2108038:

- Bug fixes:
  - Fixed Bicep expand creates deadlock and times out.
    [#863](https://github.com/Azure/PSRule.Rules.Azure/issues/863)

## v1.6.0-B2108038 (pre-release)

What's changed since pre-release v1.6.0-B2108023:

- Bug fixes:
  - Fixed Bicep expand hangs analysis.
    [#858](https://github.com/Azure/PSRule.Rules.Azure/issues/858)

## v1.6.0-B2108023 (pre-release)

What's changed since pre-release v1.6.0-B2107028:

- New features:
  - **Experimental:** Added support for expansion from Bicep source files.
    [#848](https://github.com/Azure/PSRule.Rules.Azure/issues/848)
    [#670](https://github.com/Azure/PSRule.Rules.Azure/issues/670)
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
