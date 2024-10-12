// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@description('The name of the Application Gateway.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example of an Application Gateway with a WAF_v2 SKU.
resource appgw 'Microsoft.Network/applicationGateways@2024-01-01' = {
  name: name
  location: location
  zones: [
    '1'
    '2'
    '3'
  ]
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
    }
    sslPolicy: {
      policyType: 'Custom'
      minProtocolVersion: 'TLSv1_2'
      cipherSuites: [
        'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384'
        'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256'
        'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384'
        'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256'
      ]
    }
    autoscaleConfiguration: {
      minCapacity: 2
      maxCapacity: 3
    }
    firewallPolicy: {
      id: waf.id
    }
  }
}

// An example of an Web Application Firewall policy configure with OWASP and Microsoft_BotManagerRuleSet rule sets.
resource waf 'Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies@2024-01-01' = {
  name: 'agwwaf'
  location: location
  properties: {
    managedRules: {
      managedRuleSets: [
        {
          ruleSetType: 'OWASP'
          ruleSetVersion: '3.2'
        }
        {
          ruleSetType: 'Microsoft_BotManagerRuleSet'
          ruleSetVersion: '0.1'
        }
      ]
    }
    policySettings: {
      state: 'Enabled'
      mode: 'Prevention'
    }
  }
}
