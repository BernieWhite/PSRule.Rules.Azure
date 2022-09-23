// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

targetScope = 'subscription'

// Bicep documentation examples

// Configures Azure Defender for Container Registry.
resource defenderForContainerRegistry 'Microsoft.Security/pricings@2018-06-01' = {
  name: 'ContainerRegistry'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for Containers.
resource defenderForContainers 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'Containers'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for Servers.
resource defenderForServers 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'VirtualMachines'
  properties: {
    pricingTier: 'Standard'
    subPlan: 'P2'
  }
}

// Configures Azure Defender for SQL.
resource defenderForSQL 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'SqlServers'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for App Service.
resource defenderForAppServices 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'AppServices'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for Storage.
resource defenderForStorage 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'StorageAccounts'
  properties: {
    pricingTier: 'Standard'
  }
}

// Configures Azure Defender for SQL Servers on machines.
resource defenderForSQLOnVM 'Microsoft.Security/pricings@2022-03-01' = {
  name: 'SqlServerVirtualMachines'
  properties: {
    pricingTier: 'Standard'
  }
}
