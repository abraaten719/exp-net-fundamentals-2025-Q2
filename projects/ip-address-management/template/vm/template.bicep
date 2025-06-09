@description('Azure region for deployment')
param location string

@description('Network Interface Name')
param networkInterfaceName string

@description('Network Security Group Name')
param networkSecurityGroupName string

@description('Array of NSG Rules')
param networkSecurityGroupRules array

@description('Subnet Name')
param subnetName string

@description('Virtual Network Name')
param virtualNetworkName string

@description('Address prefixes for the VNet')
param addressPrefixes array

@description('Subnets for the VNet')
param subnets array

@description('Public IP Name')
param publicIpAddressName string

@description('Public IP Allocation Type (Static or Dynamic)')
param publicIpAddressType string

@description('Public IP SKU (e.g., Standard)')
param publicIpAddressSku string

@description('Delete option for the Public IP')
param pipDeleteOption string

@description('Virtual Machine Name')
param virtualMachineName string

@description('Computer Name for the VM')
param virtualMachineComputerName string

@description('OS Disk Type (e.g., Premium_LRS)')
param osDiskType string

@description('Delete option for the OS Disk')
param osDiskDeleteOption string

@description('VM Size')
param virtualMachineSize string

@description('NIC Delete Option')
param nicDeleteOption string

@description('Enable hibernation')
param hibernationEnabled bool

@description('Admin username')
param adminUsername string

@secure()
@description('Admin password')
param adminPassword string

@description('Patch mode')
param patchMode string

@description('Periodic assessment setting')
param enablePeriodicAssessment string

@description('Enable Hotpatching')
param enableHotpatching bool

@description('Reboot Setting')
param rebootSetting string

// Variables
var nsgId = resourceId(resourceGroup().name, 'Microsoft.Network/networkSecurityGroups', networkSecurityGroupName)
var vnetId = resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks', virtualNetworkName)
var subnetRef = '${vnetId}/subnets/${subnetName}'

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: networkSecurityGroupRules
  }
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
    subnets: subnets
  }
}

resource publicIpAddress 'Microsoft.Network/publicIpAddresses@2020-08-01' = {
  name: publicIpAddressName
  location: location
  sku: {
    name: publicIpAddressSku
  }
  properties: {
    publicIPAllocationMethod: publicIpAddressType
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaceName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetRef
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIpAddress.id
            properties: {
              deleteOption: pipDeleteOption
            }
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgId
    }
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: virtualMachineName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: virtualMachineSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
        deleteOption: osDiskDeleteOption
      }
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2025-datacenter-g2'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
          properties: {
            deleteOption: nicDeleteOption
          }
        }
      ]
    }
    additionalCapabilities: {
      hibernationEnabled: hibernationEnabled
    }
    osProfile: {
      computerName: virtualMachineComputerName
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: true
        provisionVMAgent: true
        patchSettings: {
          patchMode: patchMode
          assessmentMode: enablePeriodicAssessment
          enableHotpatching: enableHotpatching
          automaticByPlatformSettings: {
            rebootSetting: rebootSetting
          }
        }
      }
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output username string = adminUsername
