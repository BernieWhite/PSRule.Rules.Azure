// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example pooled desktop host pool using depth first load balancing.
resource pool 'Microsoft.DesktopVirtualization/hostPools@2024-04-03' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hostPoolType: 'Pooled'
    loadBalancerType: 'DepthFirst'
    preferredAppGroupType: 'Desktop'
    maxSessionLimit: 10
    agentUpdate: {
      type: 'Scheduled'
      maintenanceWindowTimeZone: 'AUS Eastern Standard Time'
      maintenanceWindows: [
        {
          dayOfWeek: 'Sunday'
          hour: 1
        }
      ]
    }
  }
}

// An example scaling plan for a host pool.
resource scaling 'Microsoft.DesktopVirtualization/scalingPlans@2024-04-03' = {
  name: name
  location: location
  properties: {
    timeZone: 'E. Australia Standard Time'
    hostPoolType: 'Pooled'
    hostPoolReferences: [
      {
        hostPoolArmPath: pool.id
        scalingPlanEnabled: true
      }
    ]
    schedules: [
      {
        rampUpStartTime: {
          hour: 8
          minute: 0
        }
        peakStartTime: {
          hour: 9
          minute: 0
        }
        rampDownStartTime: {
          hour: 18
          minute: 0
        }
        offPeakStartTime: {
          hour: 22
          minute: 0
        }
        name: 'weekdays_schedule'
        daysOfWeek: [
          'Monday'
          'Tuesday'
          'Wednesday'
          'Thursday'
          'Friday'
        ]
        rampUpLoadBalancingAlgorithm: 'BreadthFirst'
        rampUpMinimumHostsPct: 20
        rampUpCapacityThresholdPct: 60
        peakLoadBalancingAlgorithm: 'DepthFirst'
        rampDownLoadBalancingAlgorithm: 'DepthFirst'
        rampDownMinimumHostsPct: 10
        rampDownCapacityThresholdPct: 90
        rampDownForceLogoffUsers: true
        rampDownWaitTimeMinutes: 30
        rampDownNotificationMessage: 'You will be logged off in 30 min. Make sure to save your work.'
        rampDownStopHostsWhen: 'ZeroSessions'
        offPeakLoadBalancingAlgorithm: 'DepthFirst'
      }
    ]
  }
}
