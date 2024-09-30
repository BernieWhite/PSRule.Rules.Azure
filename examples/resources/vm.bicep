// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@secure()
@description('The name of the local administrator account.')
param adminUsername string

@secure()
@description('A password for the local administrator account.')
param adminPassword string

@description('The VM sku to use.')
param sku string

@description('A reference to the VNET subnet where the VM will be deployed.')
param subnetId string

@description('A reference to a user-assigned managed identity used for monitoring.')
param amaIdentityId string

// An example virtual machine running Windows Server and one data disk attached.
resource vm 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: name
  location: location
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    osProfile: {
      computerName: name
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: sku
        version: 'latest'
      }
      osDisk: {
        name: '${name}-disk0'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      dataDisks: [
        {
          createOption: 'Attach'
          lun: 0
          managedDisk: {
            id: dataDisk.id
          }
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

// An example of a VM managed disk.
resource dataDisk 'Microsoft.Compute/disks@2023-10-02' = {
  name: name
  location: location
  sku: {
    name: 'Premium_ZRS'
  }
  properties: {
    creationData: {
      createOption: 'Empty'
    }
    diskSizeGB: 32
  }
}

// An example of configuring a VM extension for the Azure Monitor Agent.
resource windowsAgent 'Microsoft.Compute/virtualMachines/extensions@2024-03-01' = {
  parent: vm
  name: 'AzureMonitorWindowsAgent'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Monitor'
    type: 'AzureMonitorWindowsAgent'
    typeHandlerVersion: '1.0'
    autoUpgradeMinorVersion: true
    enableAutomaticUpgrade: true
    settings: {
      authentication: {
        managedIdentity: {
          'identifier-name': 'mi_res_id'
          'identifier-value': amaIdentityId
        }
      }
    }
  }
}

// An example maintenance configuration for specifying a in-guest patch maintenance window.
resource maintenanceConfiguration 'Microsoft.Maintenance/maintenanceConfigurations@2023-04-01' = {
  name: name
  location: location
  properties: {
    maintenanceScope: 'InGuestPatch'
    maintenanceWindow: {
      startDateTime: '2021-08-21 01:18'
      expirationDateTime: '2221-05-19 03:30'
      duration: '01:30'
      recurEvery: 'Day'
    }
  }
}

// An example of an assignment of a maintenance configuration to a virtual machine.
resource config 'Microsoft.Maintenance/configurationAssignments@2023-04-01' = {
  name: name
  location: location
  scope: vm
  properties: {
    maintenanceConfigurationId: maintenanceConfiguration.id
  }
}

// An example virtual machine with Azure Hybrid Benefit.
resource vm_with_benefit 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: name
  location: location
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    osProfile: {
      computerName: name
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: sku
        version: 'latest'
      }
      osDisk: {
        name: '${name}-disk0'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    }
    licenseType: 'Windows_Server'
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

@minLength(1)
@maxLength(80)
@sys.description('The name of the resource.')
param nicName string

// An example network interface
resource nic 'Microsoft.Network/networkInterfaces@2023-06-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig-1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}
