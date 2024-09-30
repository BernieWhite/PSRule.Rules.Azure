// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@minLength(5)
@maxLength(50)
@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example container registry deployed with Premium SKU.
module registry 'br/public:avm/res/container-registry/registry:0.5.1' = {
  params: {
    name: name
    location: location
    acrSku: 'Premium'
  }
}
