# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for Azure Storage Account rules
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

Describe 'Azure.Storage' -Tag 'Storage' {
    Context 'Conditions' {
        BeforeAll {
            $invokeParams = @{
                Baseline      = 'Azure.All'
                Module        = 'PSRule.Rules.Azure'
                WarningAction = 'Ignore'
                ErrorAction   = 'Stop'
            }
            $dataPath = Join-Path -Path $here -ChildPath 'Resources.Storage.json';
            $result = Invoke-PSRule @invokeParams -InputPath $dataPath -Outcome All;
        }

        It 'Azure.Storage.UseReplication' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.UseReplication' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-B';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly 'Path sku.name: The field value ''Standard_LRS'' was not included in the set.';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-E';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'storage-D', 'storage-C', 'storage-F', 'storage-G', 'storage-H';
        }

        It 'Azure.Storage.SecureTransfer' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.SecureTransfer' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn 'storage-B', 'storage-C', 'storage-D';
            $ruleResult.Length | Should -Be 3;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-E', 'storage-F', 'storage-G', 'storage-H';
            $ruleResult.Length | Should -Be 5;
        }

        It 'Azure.Storage.SoftDelete' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.SoftDelete' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'storage-B', 'storage-C';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly 'Path properties.deleteRetentionPolicy.enabled: Is set to ''False''.';
            $ruleResult[1].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[1].Reason | Should -BeExactly 'A sub-resource of type ''Microsoft.Storage/storageAccounts/blobServices'' has not been specified.';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-G';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'storage-D', 'storage-E', 'storage-F', 'storage-H';
        }

        It 'Azure.Storage.ContainerSoftDelete' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.ContainerSoftDelete' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'storage-B', 'storage-C', 'storage-A';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            #$ruleResult[0].Reason | Should -BeExactly 'Path properties.containerDeleteRetentionPolicy.enabled: Does not exist.';
            $ruleResult[0].Reason | Should -BeIn @('Path properties.containerDeleteRetentionPolicy.enabled: Does not exist.', 'Path properties.containerDeleteRetentionPolicy.days: Does not exist.');
            $ruleResult[1].Reason | Should -Not -BeNullOrEmpty;
            #$ruleResult[1].Reason | Should -BeExactly 'Path properties.containerDeleteRetentionPolicy.enabled: Does not exist.';
            $ruleResult[1].Reason | Should -BeIn @('Path properties.containerDeleteRetentionPolicy.enabled: Does not exist.', 'Path properties.containerDeleteRetentionPolicy.days: Does not exist.');
            $ruleResult[2].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[2].Reason | Should -BeExactly 'A sub-resource of type ''Microsoft.Storage/storageAccounts/blobServices'' has not been specified.';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-G';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'storage-D', 'storage-F', 'storage-E', 'storage-H';
        }

        It 'Azure.Storage.BlobPublicAccess' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.BlobPublicAccess' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'storage-B', 'storage-C', 'storage-D', 'storage-E', 'storage-G';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'storage-A';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'storage-F', 'storage-H';
        }

        It 'Azure.Storage.BlobAccessType' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.BlobAccessType' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-B';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly "The container 'container1' is configured with access type 'Blob'.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-C', 'storage-D', 'storage-E', 'storage-G';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'storage-F', 'storage-H';
        }

        It 'Azure.Storage.MinTLS' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.MinTLS' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'storage-B', 'storage-C', 'storage-D', 'storage-F';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly "Path properties.minimumTlsVersion: Is set to 'TLS1_0'.";
            $ruleResult[1].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[1].Reason | Should -BeExactly "Path properties.minimumTlsVersion: The field 'properties.minimumTlsVersion' does not exist.";
            $ruleResult[2].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[2].Reason | Should -BeExactly "Path properties.minimumTlsVersion: The field 'properties.minimumTlsVersion' does not exist.";
            $ruleResult[3].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[3].Reason | Should -BeExactly "Path properties.minimumTlsVersion: The field 'properties.minimumTlsVersion' does not exist.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-E', 'storage-G', 'storage-H';
        }

        It 'Azure.Storage.Firewall' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Firewall' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 6;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-B', 'storage-C', 'storage-E', 'storage-G', 'storage-H';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-F';

            # None, skip Azure Cloud Shell storage accounts
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-D';
        }

        It 'Azure.Storage.FileShareSoftDelete' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.FileShareSoftDelete' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-F';

            $ruleResult[0].Reason | Should -Not -BeNullOrEmpty;
            $ruleResult[0].Reason | Should -BeExactly 'A sub-resource of type ''Microsoft.Storage/storageAccounts/fileServices'' has not been specified.';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-H';


            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 6;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-B', 'storage-C', 'storage-D', 'storage-E', 'storage-G';
        }

        It 'Azure.Storage.Defender.MalwareScan' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Defender.MalwareScan' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-B';

            $ruleResult[0].Reason | Should -BeExactly "The storage account 'storage-B' should have malware scanning in Microsoft Defender for Storage configured.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult.Length | Should -Be 7;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-C', 'storage-D', 'storage-E', 'storage-F', 'storage-G', 'storage-H';
        }

        It 'Azure.Storage.Defender.DataScan' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Defender.DataScan' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-B';

            $ruleResult[0].Reason | Should -BeExactly "The storage account 'storage-B' should have sensitive data threat detection in Microsoft Defender for Storage configured.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult.Length | Should -Be 7;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-C', 'storage-D', 'storage-E', 'storage-F', 'storage-G', 'storage-H';
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

            $option = New-PSRuleOption -Configuration @{ 'AZURE_STORAGE_ACCOUNT_NAME_FORMAT' = '^(st|stvm|dls)' };

            $names = @(
                'storage1'
                '1storage'
                'Storage1'
                'storage-001'
                'storage_001'
                's'
                'storage.1'
                'dls001'
                'stvm001'
            )

            $items = @($names | ForEach-Object {
                [PSCustomObject]@{
                    Name         = $_
                    Type = 'Microsoft.Storage/storageAccounts'
                }
            })

            $result = $items | Invoke-PSRule @invokeParams -Option $option -Name 'Azure.Storage.Name','Azure.Storage.Naming'
        }

        It 'Azure.Storage.Name' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Name' };
            $validNames = @(
                'storage1'
                '1storage'
                'dls001'
                'stvm001'
            )

            $invalidNames = @(
                'Storage1'
                'storage-001'
                'storage_001'
                's'
                'storage.1'
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

        It 'Azure.Storage.Naming' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Naming' };
            $validNames = @(
                'storage1'
                'dls001'
                'stvm001'
                'storage-001'
                'storage_001'
                'storage.1'
            )

            $invalidNames = @(
                '1storage'
                'Storage1'
                's'
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

    Context 'With Template' {
        BeforeAll {
            $templatePath = Join-Path -Path $here -ChildPath 'Resources.Storage.Template.json';
            $parameterPath = Join-Path -Path $here -ChildPath 'Resources.Storage.Parameters.json';
            $outputFile = Join-Path -Path $rootPath -ChildPath out/tests/Resources.Storage.json;
            Export-AzRuleTemplateData -TemplateFile $templatePath -ParameterFile $parameterPath -OutputPath $outputFile;
            $result = Invoke-PSRule -Module PSRule.Rules.Azure -InputPath $outputFile -Outcome All -WarningAction Ignore -ErrorAction Stop -Culture 'en-US';
        }

        It 'Azure.Storage.UseReplication' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.UseReplication' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'storage1';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -BeNullOrEmpty;
        }

        It 'Azure.Storage.SecureTransfer' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.SecureTransfer' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'storage1';
        }

        It 'Azure.Storage.SoftDelete' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.SoftDelete' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage1';
        }

        It 'Azure.Storage.ContainerSoftDelete' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.ContainerSoftDelete' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage1';
        }

        It 'Azure.Storage.BlobAccessType' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.BlobAccessType' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            @($ruleResult[0].TargetObject.resources | Where-Object {
                    $_.type -eq 'Microsoft.Storage/storageAccounts/blobServices/containers' -and
                    $_.name -eq 'storage1/default/arm'
                }).Length | Should -Be 1
            # $ruleResult.TargetName | Should -BeIn 'storage1', 'storage1/default/arm';
        }

        It 'Azure.Storage.Firewall' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.Firewall' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage1';
        }
    }

    Context 'With Configuration Option' {
        BeforeAll {
            $invokeParams = @{
                Baseline      = 'Azure.All'
                Module        = 'PSRule.Rules.Azure'
                WarningAction = 'Ignore'
                ErrorAction   = 'Stop'
            }
            $dataPath = Join-Path -Path $here -ChildPath 'Resources.Storage.json';
            $configPath = Join-Path -Path $here -ChildPath 'ps-rule-options.yaml';
        }
        
        It 'Azure.Storage.DefenderCloud -  YAML file option' {
            # With AZURE_STORAGEACCOUNT_DEFENDER_PER_ACCOUNT
            $result = Invoke-PSRule @invokeParams -InputPath $dataPath -Option $configPath
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Azure.Storage.DefenderCloud' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult.Length | Should -Be 7;
            $ruleResult.TargetName | Should -BeIn 'storage-A', 'storage-B', 'storage-D', 'storage-E', 'storage-F', 'storage-G', 'storage-H';

            $ruleResult[0].Reason | Should -BeExactly "A sub-resource of type 'Microsoft.Security/DefenderForStorageSettings' has not been specified.";
            $ruleResult[1].Reason | Should -BeExactly "A sub-resource of type 'Microsoft.Security/DefenderForStorageSettings' has not been specified.";

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'storage-C';
        }
    }
}
