# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for Virtual Network Gateway rules
#

[CmdletBinding()]
param ()

BeforeAll {
    # Setup error handling
    $ErrorActionPreference = 'Stop';
    Set-StrictMode -Version latest;

    if ($Env:SYSTEM_DEBUG -eq 'true') {
        $VerbosePreference = 'Continue';
    }

    # Setup tests paths
    $rootPath = $PWD;
    Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.Azure) -Force;
    $here = (Resolve-Path $PSScriptRoot).Path;
}

Describe 'Azure.VNG' -Tag 'Network', 'VNG', 'VPN', 'ExpressRoute' {
    Context 'Conditions' {
        BeforeAll {
            $invokeParams = @{
                Baseline = 'Azure.All'
                Module = 'PSRule.Rules.Azure'
                WarningAction = 'Ignore'
                ErrorAction = 'Stop'
            }
            $dataPath = Join-Path -Path $here -ChildPath 'Resources.VirtualNetwork.json';
            $result = Invoke-PSRule @invokeParams -InputPath $dataPath -Outcome All;
        }

        It 'Azure.VNG.VPNLegacySKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.VPNLegacySKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-A';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'gateway-B', 'gateway-E', 'gateway-F';
        }

        It 'Azure.VNG.VPNActiveActive' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.VPNActiveActive' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'gateway-A', 'gateway-E', 'gateway-F';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-B';
        }

        It 'Azure.VNG.ERLegacySKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.ERLegacySKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-D';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'gateway-C', 'gateway-G', 'gateway-H';
        }

        It 'Azure.VNG.VPNAvailabilityZoneSKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.VPNAvailabilityZoneSKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'gateway-A', 'gateway-B';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly 'The VPN gateway (gateway-A) should be using one of the following AZ SKUs (VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ, VpnGw5AZ).';
            $ruleResult[1].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[1].Reason | Should -BeExactly 'The VPN gateway (gateway-B) should be using one of the following AZ SKUs (VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ, VpnGw5AZ).';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'gateway-E', 'gateway-F';
        }

        It 'Azure.VNG.ERAvailabilityZoneSKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.ERAvailabilityZoneSKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'gateway-C', 'gateway-D';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly 'The ExpressRoute gateway (gateway-C) should be using one of the following AZ SKUs (ErGw1AZ, ErGw2AZ, ErGw3AZ).';
            $ruleResult[1].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[1].Reason | Should -BeExactly 'The ExpressRoute gateway (gateway-D) should be using one of the following AZ SKUs (ErGw1AZ, ErGw2AZ, ErGw3AZ).';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'gateway-G', 'gateway-H';
        }

        It 'Azure.VNG.MaintenanceConfig' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.MaintenanceConfig' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'gateway-A', 'gateway-B', 'gateway-C';

            $ruleResult[0].Reason | Should -BeExactly "The virtual network gateway 'gateway-A' should have a customer-controlled maintenance configuration associated.";
            $ruleResult[1].Reason | Should -BeExactly "The virtual network gateway 'gateway-B' should have a customer-controlled maintenance configuration associated.";
            $ruleResult[2].Reason | Should -BeExactly "The virtual network gateway 'gateway-C' should have a customer-controlled maintenance configuration associated.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'gateway-D', 'gateway-E', 'gateway-F', 'gateway-G', 'gateway-H';
        }
    }

    Context 'Resource name' {
        BeforeAll {
            $invokeParams = @{
                Baseline      = 'Azure.All'
                Module        = 'PSRule.Rules.Azure'
                WarningAction = 'Ignore'
                ErrorAction   = 'Stop'
            }

            $option = New-PSRuleOption -Configuration @{ 'AZURE_VIRTUAL_NETWORK_GATEWAY_NAME_FORMAT' = '^vgw-' };

            $names = @(
                'vng-001'
                'vng-001_'
                'VNG.001'
                'v'
                '_vng-001'
                '-vng-001'
                'vng-001-'
                'vng-001.'
                'vgw-001'
                'VGW-001'
            )

            $items = @($names | ForEach-Object {
                [PSCustomObject]@{
                    Name         = $_
                    Type = 'Microsoft.Network/virtualNetworkGateways'
                }
            })

            $result = $items | Invoke-PSRule @invokeParams -Option $option -Name 'Azure.VNG.Name','Azure.VNG.Naming'
        }

        It 'Azure.VNG.Name' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.Name' };
            $validNames = @(
                'vng-001'
                'vng-001_'
                'VNG.001'
                'v'
                'vgw-001'
                'VGW-001'
            )

            $invalidNames = @(
                '_vng-001'
                '-vng-001'
                'vng-001-'
                'vng-001.'
            )

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $invalidNames;
            $ruleResult | Should -HaveCount $invalidNames.Length;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $validNames;
            $ruleResult | Should -HaveCount $validNames.Length;
        }

        It 'Azure.VNG.Naming' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.Naming' };
            $validNames = @(
                'vgw-001'
            )

            $invalidNames = @(
                '_vng-001'
                '-vng-001'
                'vng-001-'
                'vng-001.'
                'vng-001'
                'vng-001_'
                'VNG.001'
                'v'
                'VGW-001'
            )

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $invalidNames;
            $ruleResult | Should -HaveCount $invalidNames.Length;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $validNames;
            $ruleResult | Should -HaveCount $validNames.Length;
        }
    }

    Context 'Resource name - Connection Name' {
        BeforeAll {
            $invokeParams = @{
                Baseline      = 'Azure.All'
                Module        = 'PSRule.Rules.Azure'
                WarningAction = 'Ignore'
                ErrorAction   = 'Stop'
            }

            $option = New-PSRuleOption -Configuration @{ 'AZURE_GATEWAY_CONNECTION_NAME_FORMAT' = '^cn-' };

            $names = @(
                'cn-001'
                'cn-001_'
                'CN.001'
                'c'
                '_cn-001'
                '-cn-001'
                'cn-001-'
                'cn-001.'
            )

            $items = @($names | ForEach-Object {
                [PSCustomObject]@{
                    Name         = $_
                    Type = 'Microsoft.Network/connections'
                }
            })

            $result = $items | Invoke-PSRule @invokeParams -Option $option -Name 'Azure.VNG.ConnectionName','Azure.VNG.ConnectionNaming'
        }

        It 'Azure.VNG.ConnectionName' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.ConnectionName' };
            $validNames = @(
                'cn-001'
                'cn-001_'
                'CN.001'
                'c'
            )

            $invalidNames = @(
                '_cn-001'
                '-cn-001'
                'cn-001-'
                'cn-001.'
            )

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $invalidNames;
            $ruleResult | Should -HaveCount $invalidNames.Length;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $validNames;
            $ruleResult | Should -HaveCount $validNames.Length;
        }

        It 'Azure.VNG.ConnectionNaming' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.ConnectionNaming' };
            $validNames = @(
                'cn-001'
                'cn-001_'
                'cn-001-'
                'cn-001.'
            )

            $invalidNames = @(
                'CN.001'
                'c'
                '_cn-001'
                '-cn-001'
            )

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $invalidNames;
            $ruleResult | Should -HaveCount $invalidNames.Length;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn $validNames;
            $ruleResult | Should -HaveCount $validNames.Length;
        }
    }

    Context 'With template - VPN' {
        BeforeAll {
            $outputFile = Join-Path -Path $rootPath -ChildPath out/tests/Resources.VPN.json;
            Get-AzRuleTemplateLink -Path $here -InputPath 'Resources.VPN.Parameters.json' | Export-AzRuleTemplateData -OutputPath $outputFile;
            $result = Invoke-PSRule -Module PSRule.Rules.Azure -InputPath $outputFile -Outcome All -WarningAction Ignore -ErrorAction Stop;
        }

        It 'Azure.VNG.VPNLegacySKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.VPNLegacySKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-A';
        }

        It 'Azure.VNG.VPNActiveActive' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.VPNActiveActive' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-A';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -BeNullOrEmpty;
        }
    }

    Context 'With template - ExpressRoute' {
        BeforeAll {
            $outputFile = Join-Path -Path $rootPath -ChildPath out/tests/Resources.ExpressRoute.json;
            Get-AzRuleTemplateLink -Path $here -InputPath 'Resources.ExpressRoute.Parameters.json' | Export-AzRuleTemplateData -OutputPath $outputFile;
            $result = Invoke-PSRule -Module PSRule.Rules.Azure -InputPath $outputFile -Outcome All -WarningAction Ignore -ErrorAction Stop;
        }

        It 'Azure.VNG.ERLegacySKU' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.VNG.ERLegacySKU' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'gateway-A';
        }
    }
}
