// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('Endpoints to resolve for.')
param endpoints object[]

// An example Traffic Manager Profile using the Performance routing method.
resource profile 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: name
  location: 'global'
  properties: {
    endpoints: endpoints
    trafficRoutingMethod: 'Performance'
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      intervalInSeconds: 30
      timeoutInSeconds: 5
      toleratedNumberOfFailures: 3
      path: '/healthz'
    }
  }
}
