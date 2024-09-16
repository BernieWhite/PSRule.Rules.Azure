// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

// Define parameters

@description('The name of the AKS cluster.')
param name string

@metadata({
  description: 'Optional. The Azure region to deploy to.'
  strongType: 'location'
  example: 'EastUS'
  ignore: true
})
param location string = resourceGroup().location

@description('The name of the user assigned identity to used for cluster control plane.')
param identityName string

@description('A DNS prefix to use with hosted Kubernetes API server FQDN.')
param dnsPrefix string

@description('Disk size (in GiB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 will apply the default disk size for that agentVMSize.')
@minValue(0)
param osDiskSizeGB int = 32

@description('The size of cluster VM instances.')
param systemVMSize string = 'Standard_D2s_v3'

@metadata({
  description: 'The minimum number of agent nodes for the system pool.'
  example: 3
})
@minValue(1)
@maxValue(50)
param systemPoolMin int

@metadata({
  description: 'The maximum number of agent nodes for the system pool.'
  example: 3
})
@minValue(1)
@maxValue(50)
param systemPoolMax int = 3

@description('The version of Kubernetes.')
param kubernetesVersion string = '1.29.7'

@description('Maximum number of pods that can run on nodes in the system pool.')
@minValue(30)
param systemPoolMaxPods int = 50

@metadata({
  description: 'Specify the resource id of the OMS workspace.'
  strongType: 'Microsoft.OperationalInsights/workspaces'
})
param workspaceId string

@description('A reference to the subnet to deploy the cluster into.')
param clusterSubnetId string

@description('The object Ids of groups that will be added with the cluster admin role.')
param clusterAdmins array = []

@metadata({
  description: 'User cluster pools.'
  example: [
    {
      name: ''
      priority: 'Regular'
      osType: 'Linux'
      minCount: 0
      maxCount: 2
      vmSize: 'Standard_D2s_v3'
    }
  ]
})
param pools array = []

// Define variables

var serviceCidr = '192.168.0.0/16'
var dnsServiceIP = '192.168.0.4'

// Define pools
var allPools = union(systemPools, userPools)
var systemPools = [
  {
    name: 'system'
    osDiskSizeGB: osDiskSizeGB
    count: systemPoolMin
    minCount: systemPoolMin
    maxCount: systemPoolMax
    enableAutoScaling: true
    maxPods: systemPoolMaxPods
    vmSize: systemVMSize
    osType: 'Linux'
    type: 'VirtualMachineScaleSets'
    vnetSubnetID: clusterSubnetId
    mode: 'System'
    osDiskType: 'Ephemeral'
    scaleSetPriority: 'Regular'
  }
]
var userPools = [
  for i in range(0, length(pools)): {
    name: pools[i].name
    osDiskSizeGB: osDiskSizeGB
    count: pools[i].minCount
    minCount: pools[i].minCount
    maxCount: pools[i].maxCount
    enableAutoScaling: true
    maxPods: pools[i].maxPods
    vmSize: pools[i].vmSize
    osType: pools[i].osType
    type: 'VirtualMachineScaleSets'
    vnetSubnetID: clusterSubnetId
    mode: 'User'
    osDiskType: 'Ephemeral'
    scaleSetPriority: pools[i].priority
  }
]

// Define resources

// Cluster managed identity
resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: identityName
  location: location
}

// An example AKS cluster
resource cluster 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  location: location
  name: name
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identity.id}': {}
    }
  }
  properties: {
    kubernetesVersion: kubernetesVersion
    disableLocalAccounts: true
    enableRBAC: true
    dnsPrefix: dnsPrefix
    agentPoolProfiles: allPools
    aadProfile: {
      managed: true
      enableAzureRBAC: true
      adminGroupObjectIDs: clusterAdmins
      tenantID: subscription().tenantId
    }
    networkProfile: {
      networkPlugin: 'azure'
      networkPolicy: 'azure'
      loadBalancerSku: 'standard'
      serviceCidr: serviceCidr
      dnsServiceIP: dnsServiceIP
    }
    apiServerAccessProfile: {
      authorizedIPRanges: [
        '0.0.0.0/32'
      ]
    }
    autoUpgradeProfile: {
      upgradeChannel: 'stable'
    }
    oidcIssuerProfile: {
      enabled: true
    }
    addonProfiles: {
      azurepolicy: {
        enabled: true
      }
      omsagent: {
        enabled: true
        config: {
          logAnalyticsWorkspaceResourceID: workspaceId
        }
      }
      azureKeyvaultSecretsProvider: {
        enabled: true
        config: {
          enableSecretRotation: 'true'
        }
      }
    }
  }
}

resource auditLogs 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'audit'
  scope: cluster
  properties: {
    logs: [
      {
        category: 'kube-audit-admin'
        enabled: true
        retentionPolicy: {
          days: 0
          enabled: false
        }
      }
      {
        category: 'guard'
        enabled: true
        retentionPolicy: {
          days: 0
          enabled: false
        }
      }
    ]
    workspaceId: workspaceId
    logAnalyticsDestinationType: 'Dedicated'
  }
}

// An example AKS cluster with pools defined.
resource clusterWithPools 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  location: location
  name: name
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identity.id}': {}
    }
  }
  properties: {
    kubernetesVersion: kubernetesVersion
    disableLocalAccounts: true
    enableRBAC: true
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'system'
        osDiskSizeGB: 0
        minCount: 3
        maxCount: 5
        enableAutoScaling: true
        maxPods: 50
        vmSize: 'Standard_D4s_v5'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: clusterSubnetId
        mode: 'System'
        osDiskType: 'Ephemeral'
      }
      {
        name: 'user'
        osDiskSizeGB: 0
        minCount: 3
        maxCount: 20
        enableAutoScaling: true
        maxPods: 50
        vmSize: 'Standard_D4s_v5'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: clusterSubnetId
        mode: 'User'
        osDiskType: 'Ephemeral'
      }
    ]
    aadProfile: {
      managed: true
      enableAzureRBAC: true
      adminGroupObjectIDs: clusterAdmins
      tenantID: subscription().tenantId
    }
    networkProfile: {
      networkPlugin: 'azure'
      networkPolicy: 'azure'
      loadBalancerSku: 'standard'
      serviceCidr: serviceCidr
      dnsServiceIP: dnsServiceIP
    }
    apiServerAccessProfile: {
      authorizedIPRanges: [
        '0.0.0.0/32'
      ]
    }
    autoUpgradeProfile: {
      upgradeChannel: 'stable'
    }
    oidcIssuerProfile: {
      enabled: true
    }
    addonProfiles: {
      azurepolicy: {
        enabled: true
      }
      omsagent: {
        enabled: true
        config: {
          logAnalyticsWorkspaceResourceID: workspaceId
        }
      }
      azureKeyvaultSecretsProvider: {
        enabled: true
        config: {
          enableSecretRotation: 'true'
        }
      }
    }
  }
}

// An example private AKS cluster with pools defined.
resource privateCluster 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  location: location
  name: name
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identity.id}': {}
    }
  }
  properties: {
    kubernetesVersion: kubernetesVersion
    disableLocalAccounts: true
    enableRBAC: true
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'system'
        osDiskSizeGB: 0
        minCount: 3
        maxCount: 5
        enableAutoScaling: true
        maxPods: 50
        vmSize: 'Standard_D4s_v5'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: clusterSubnetId
        mode: 'System'
        osDiskType: 'Ephemeral'
      }
      {
        name: 'user'
        osDiskSizeGB: 0
        minCount: 3
        maxCount: 20
        enableAutoScaling: true
        maxPods: 50
        vmSize: 'Standard_D4s_v5'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: clusterSubnetId
        mode: 'User'
        osDiskType: 'Ephemeral'
      }
    ]
    aadProfile: {
      managed: true
      enableAzureRBAC: true
      adminGroupObjectIDs: clusterAdmins
      tenantID: subscription().tenantId
    }
    networkProfile: {
      networkPlugin: 'azure'
      networkPolicy: 'azure'
      loadBalancerSku: 'standard'
      serviceCidr: serviceCidr
      dnsServiceIP: dnsServiceIP
    }
    apiServerAccessProfile: {
      enablePrivateCluster: true
      enablePrivateClusterPublicFQDN: false
    }
    autoUpgradeProfile: {
      upgradeChannel: 'stable'
    }
    oidcIssuerProfile: {
      enabled: true
    }
    addonProfiles: {
      azurepolicy: {
        enabled: true
      }
      omsagent: {
        enabled: true
        config: {
          logAnalyticsWorkspaceResourceID: workspaceId
        }
      }
      azureKeyvaultSecretsProvider: {
        enabled: true
        config: {
          enableSecretRotation: 'true'
        }
      }
    }
  }
}
