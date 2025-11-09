// infra/storage.bicep (resourceGroup scoped)
targetScope = 'resourceGroup'

@description('Storage account name (must be globally unique)')
param storageName string

@description('Location (defaults to resource group location)')
param location string = resourceGroup().location

@description('SKU')
@allowed([ 'Standard_LRS', 'Standard_GRS', 'Standard_ZRS', 'Premium_LRS' ])
param skuName string = 'Standard_LRS'

@description('Kind')
param kind string = 'StorageV2'

resource st 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  sku: { name: skuName }
  kind: kind
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

output storageNameOut string = st.name
output storageId string = st.id
