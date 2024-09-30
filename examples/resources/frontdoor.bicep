// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string = 'frontdoor'

@description('A resource ID that specifies the Log Analytics workspace to send logs.')
param workspaceId string

@description('Define a WAF policy for Front Door Premium.')
resource waf 'Microsoft.Network/FrontDoorWebApplicationFirewallPolicies@2022-05-01' = {
  name: name
  location: 'Global'
  sku: {
    name: 'Premium_AzureFrontDoor'
  }
  properties: {
    managedRules: {
      managedRuleSets: [
        {
          ruleSetType: 'Microsoft_DefaultRuleSet'
          ruleSetVersion: '2.0'
          ruleSetAction: 'Block'
          exclusions: []
          ruleGroupOverrides: []
        }
        {
          ruleSetType: 'Microsoft_BotManagerRuleSet'
          ruleSetVersion: '1.0'
          ruleSetAction: 'Block'
          exclusions: []
          ruleGroupOverrides: []
        }
      ]
    }
    policySettings: {
      enabledState: 'Enabled'
      mode: 'Prevention'
    }
  }
}

@description('The hostname of the backend. Must be an IP address or FQDN.')
param backendAddress string

var frontEndEndpointName = 'frontEndEndpoint'
var loadBalancingSettingsName = 'loadBalancingSettings'
var healthProbeSettingsName = 'healthProbeSettings'
var routingRuleName = 'routingRule'
var backendPoolName = 'backendPool'

var frontendEndpoints = [
  {
    name: frontEndEndpointName
    properties: {
      hostName: '${name}.azurefd.net'
      sessionAffinityEnabledState: 'Disabled'
    }
  }
]
var loadBalancingSettings = [
  {
    name: loadBalancingSettingsName
    properties: {
      sampleSize: 4
      successfulSamplesRequired: 2
    }
  }
]
var backendPools = [
  {
    name: backendPoolName
    properties: {
      backends: [
        {
          address: backendAddress
          backendHostHeader: backendAddress
          httpPort: 80
          httpsPort: 443
          weight: 50
          priority: 1
          enabledState: 'Enabled'
        }
      ]
      loadBalancingSettings: {
        id: resourceId('Microsoft.Network/frontDoors/loadBalancingSettings', name, loadBalancingSettingsName)
      }
      healthProbeSettings: {
        id: resourceId('Microsoft.Network/frontDoors/healthProbeSettings', name, healthProbeSettingsName)
      }
    }
  }
]
var routingRules = [
  {
    name: routingRuleName
    properties: {
      frontendEndpoints: [
        {
          id: resourceId('Microsoft.Network/frontDoors/frontEndEndpoints', name, frontEndEndpointName)
        }
      ]
      acceptedProtocols: [
        'Http'
        'Https'
      ]
      patternsToMatch: [
        '/*'
      ]
      routeConfiguration: {
        '@odata.type': '#Microsoft.Azure.FrontDoor.Models.FrontdoorForwardingConfiguration'
        cacheConfiguration: {
          cacheDuration: 'P12DT1H'
          dynamicCompression: 'Disabled'
          queryParameters: 'customerId'
          queryParameterStripDirective: 'StripAll'
        }
        forwardingProtocol: 'MatchRequest'
        backendPool: {
          id: resourceId('Microsoft.Network/frontDoors/backEndPools', name, backendPoolName)
        }
      }
      enabledState: 'Enabled'
    }
  }
]
var healthProbeSettings = [
  {
    name: healthProbeSettingsName
    properties: {
      enabledState: 'Enabled'
      path: '/healthz'
      protocol: 'Http'
      intervalInSeconds: 120
      healthProbeMethod: 'HEAD'
    }
  }
]

@description('Define a Front Door Classic.')
resource afd_classic 'Microsoft.Network/frontDoors@2021-06-01' = {
  name: name
  location: 'global'
  properties: {
    enabledState: 'Enabled'
    frontendEndpoints: [
      {
        name: frontEndEndpointName
        properties: {
          hostName: '${name}.azurefd.net'
          sessionAffinityEnabledState: 'Disabled'

          #disable-next-line BCP073
          customHttpsConfiguration: {
            minimumTlsVersion: '1.2'
          }
        }
      }
    ]
    loadBalancingSettings: loadBalancingSettings
    backendPools: backendPools
    healthProbeSettings: healthProbeSettings
    routingRules: routingRules
  }
}

// Configure settings to send audit logs to a Log Analytics workspace.
resource audit_classic 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'audit'
  scope: afd_classic
  properties: {
    workspaceId: workspaceId
    logs: [
      {
        category: 'FrontdoorAccessLog'
        enabled: true
      }
      {
        category: 'FrontdoorWebApplicationFirewallLog'
        enabled: true
      }
    ]
  }
}

// Define an Azure Front Door Premium profile.
resource afd_profile 'Microsoft.Cdn/profiles@2023-05-01' = {
  name: name
  location: 'Global'
  sku: {
    name: 'Premium_AzureFrontDoor'
  }
}

// Defines an endpoint for Azure Front Door Standard/ Premium profile.
resource adf_endpoint 'Microsoft.Cdn/profiles/afdEndpoints@2023-05-01' = {
  parent: afd_profile
  name: name
  location: 'Global'
  properties: {
    enabledState: 'Enabled'
  }
}

// Define an origin group for a Front Door Standard/ Premium profile.
resource adf_origin_group 'Microsoft.Cdn/profiles/originGroups@2023-05-01' = {
  name: name
  parent: afd_profile
  properties: {
    loadBalancingSettings: {
      sampleSize: 4
      successfulSamplesRequired: 3
    }
    healthProbeSettings: {
      probePath: '/healthz'
      probeRequestType: 'HEAD'
      probeProtocol: 'Http'
      probeIntervalInSeconds: 100
    }
  }
}

// Configure settings to send audit logs to a Log Analytics workspace.
resource audit 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'audit'
  scope: afd_profile
  properties: {
    workspaceId: workspaceId
    logs: [
      {
        category: 'FrontdoorAccessLog'
        enabled: true
      }
      {
        category: 'FrontdoorWebApplicationFirewallLog'
        enabled: true
      }
    ]
  }
}
