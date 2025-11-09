// infra/resourceGroup.bicep (subscription scope)
targetScope = 'subscription'

@description('Name of resource group to create')
param rgName string

@description('Location for the resource group')
param location string = 'southeastasia'

@description('Optional tags to apply')
param tags object = {}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: tags
}

output name string = rg.name
output id string = rg.id
