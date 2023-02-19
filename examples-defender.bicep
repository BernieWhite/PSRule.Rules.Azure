// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

targetScope = 'subscription'

// Bicep documentation examples

// Configures Microsoft Defender for Containers.
resource defenderForContainers 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'Containers'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Virtual Machines.
resource defenderForVirtualMachines 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'VirtualMachines'
  properties: {
    pricingTier: 'Standard'
    subPlan: 'P2'
  }
}

// Configures Microsoft Defender for Sql Servers.
resource defenderForSqlServers 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'SqlServers'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for App Services.
resource defenderForAppServices 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'AppServices'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Storage Accounts.
resource defenderForStorageAccounts 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'StorageAccounts'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for Sql Server Virtual Machines.
resource defenderForSqlServerVirtualMachines 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'SqlServerVirtualMachines'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Key Vaults.
resource defenderForKeyVaults 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'KeyVaults'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Dns.
resource defenderForDns 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'Dns'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Arm.
resource defenderForArm 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'Arm'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Open Source Relational Databases.
resource defenderForOpenSourceRelationalDatabases 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'OpenSourceRelationalDatabases'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for Cosmos Dbs.
resource defenderForCosmosDbs 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'CosmosDbs'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Microsoft Defender for CSPM.
resource defenderForCloudPosture 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'CloudPosture'
  properties: {
    pricingTier: 'Standard'
  }
}
