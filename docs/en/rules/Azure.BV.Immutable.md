---
severity: Important
pillar: Security
category: Security design principles
resource:  Backup Vault
resourceType: Microsoft.DataProtection/backupVaults
online version: https://azure.github.io/PSRule.Rules.Azure/en/rules/Azure.BV.Immutable/
---

# Immutability

## SYNOPSIS

Ensure immutability is configured to protect backup data.

## DESCRIPTION

Immutability is supported for Backup vaults by configuring the Immutable vault setting.

Immutable vault helps protecting backup data by blocking any operations that could lead to loss of recovery points.
Additionally, locking the Immutable vault setting makes it irreversible to prevent any malicious actors from disabling immutability and deleting backups.

For example, an malicious attack may attempt to remove data or delete vaults to prevent recovery to a known good state.

The Immutable vault setting is not enabled per default.

## RECOMMENDATION

Consider configuring immutability to protect backup data from accidental or malicious deletion.

## EXAMPLES

### Configure with Azure template

To deploy Backup vaults that pass this rule:

- Set `properties.securitySettings.immutabilitySettings.state` to `Unlocked` or `Locked`.

For example:

```json
{
  "type": "Microsoft.DataProtection/backupVaults",
  "apiVersion": "2022-11-01-preview",
  "name": "[parameters('vaultName')]",
  "location": "[parameters('location')]",
  "properties": {
    "securitySettings": {
      "immutabilitySettings": {
        "state": "Locked"
      }
    }
  }
}
```

### Configure with Bicep

To deploy Backup vaults that pass this rule:

- Set `properties.securitySettings.immutabilitySettings.state` to `Unlocked` or `Locked`.

For example:

```bicep
resource backupVault 'Microsoft.DataProtection/backupVaults@2022-11-01-preview' = {
  name: vaultName
  location: location
  properties: {
    securitySettings: {
      immutabilitySettings: {
        state: 'Locked'
      }
    }
  }
}
```

## NOTES

Note that immutability locking `Locked` is irreversible, so ensure to take a well-informed decision when opting to lock.
For example, for vaults containing production workloads consider using `Locked`.
For cases where you are creating and destroying backups and vaults on a regulary basis such as temporary environments consider `Unlocked`.

## LINKS

- [Security design principles](https://learn.microsoft.com/azure/well-architected/security/security-principles)
- [Immutable vault for Azure Backup](https://learn.microsoft.com/azure/backup/backup-azure-immutable-vault-concept?tabs=backup-vault)
- [Restricted operations](https://learn.microsoft.com/azure/backup/backup-azure-immutable-vault-concept?tabs=backup-vault#restricted-operations)
- [Manage Azure Backup Immutable vault operations](https://learn.microsoft.com/azure/backup/backup-azure-immutable-vault-how-to-manage?tabs=backup-vault)
- [Azure security baseline for Azure Backup](https://learn.microsoft.com/security/benchmark/azure/baselines/backup-security-baseline)
- [Backup and restore plan to protect against ransomware](https://learn.microsoft.com/azure/security/fundamentals/backup-plan-to-protect-against-ransomware)
- [BR-2: Protect backup and recovery data](https://learn.microsoft.com/security/benchmark/azure/mcsb-backup-recovery#br-2-protect-backup-and-recovery-data)
- [Azure deployment reference](https://learn.microsoft.com/azure/templates/microsoft.dataprotection/backupvaults#immutabilitysettings)
