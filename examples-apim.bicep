// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@minLength(1)
@maxLength(50)
@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The reply email of the publisher.')
param publisherEmail string = 'noreply@contoso.com'

@description('The display name of the publisher.')
param publisherName string = 'Contoso'

@description('A global policy to use with the service.')
param globalPolicy string = loadTextContent('examples-apim-policy.xml')

var portalUri = 'https://${toLower(name)}.developer.azure-api.net'
var actualGlobalPolicy = replace(globalPolicy, '__APIM__', portalUri)

@description('An example API Management service.')
resource service 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: name
  location: location
  sku: {
    name: 'Premium'
    capacity: 1
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
    customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'True'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA256': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA256': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_GCM_SHA256': 'False'
    }
    apiVersionConstraint: {
      minApiVersion: '2021-08-01'
    }
  }
}

@description('Configure the API Management Service global policy.')
resource serviceName_policy 'Microsoft.ApiManagement/service/policies@2022-08-01' = {
  parent: service
  name: 'policy'
  properties: {
    value: actualGlobalPolicy
    format: 'xml'
  }
}

@description('An example product.')
resource product 'Microsoft.ApiManagement/service/products@2022-08-01' = {
  parent: service
  name: 'echo'
  properties: {
    displayName: 'Echo'
    description: 'Echo API services for Contoso.'
    approvalRequired: true
    subscriptionRequired: true
  }
}

@description('An example API Version.')
resource version 'Microsoft.ApiManagement/service/apiVersionSets@2022-08-01' = {
  parent: service
  name: 'echo'
  properties: {
    displayName: 'Echo API'
    description: 'An echo API service.'
    versioningScheme: 'Segment'
  }
}

@description('An example API.')
resource api 'Microsoft.ApiManagement/service/apis@2022-08-01' = {
  parent: service
  name: 'echo-v1'
  properties: {
    displayName: 'Echo API'
    description: 'An echo API service.'
    type: 'http'
    path: 'echo'
    serviceUrl: 'https://echo.contoso.com'
    protocols: [
      'https'
    ]
    apiVersion: 'v1'
    apiVersionSetId: version.id
    subscriptionRequired: true
  }
}

@description('An example API backend.')
resource backend 'Microsoft.ApiManagement/service/backends@2022-08-01' = {
  parent: service
  name: 'echo'
  properties: {
    title: 'echo'
    description: 'A backend service for the Each API.'
    protocol: 'http'
    url: 'https://echo.contoso.com'
  }
}
