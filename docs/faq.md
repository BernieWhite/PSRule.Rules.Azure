---
author: BernieWhite
description: Frequently asked questions (FAQ) for PSRule for Azure.
---

# Frequently Asked Questions (FAQ)

Continue reading for FAQ relating to _PSRule for Azure_.
For general FAQ see [PSRule - Frequently Asked Questions (FAQ)][ps-rule-faq], including:

- [How is PSRule different to Pester?][11]
- [How do I configure PSRule?][ps-rule-configure]
- [How do I ignore a rule?][ignore-rule]
- [How do exclude or ignore files from being processed?][13]
- [How do I disable or suppress the not processed warning?][14]
- [How do I layer on custom rules on top of an existing module?][add-custom-rule]

!!! Note
    If you have a question that is not answered here, please [join or start a discussion][discussion].
    For common issues and workarounds, please see [troubleshooting][19].

  [discussion]: https://github.com/Azure/PSRule.Rules.Azure/discussions
  [13]: https://microsoft.github.io/PSRule/v2/faq/#how-do-exclude-or-ignore-files-from-being-processed
  [14]: https://microsoft.github.io/PSRule/v2/faq/#how-do-i-disable-or-suppress-the-not-processed-warning
  [19]: troubleshooting.md

## What is a rule?

A rule is a named set of checks and documentation.
Each rule is tests a specific aspect of an Azure resource or deployment to determine if
it is aligned with the [Microsoft Azure Well-Architected Framework][AWAF].
You can find the documentation for each rule under [reference][1].

  [1]: en/rules/module.md
  [AWAF]: https://learn.microsoft.com/azure/architecture/framework/

## What is a baseline?

A baseline combines rules and configuration.
PSRule for Azure provides several baselines that can be referenced when running PSRule.
Quarterly baselines provide a stable checkpoint of rules when you need to stagger adoption of new rules.

Continue reading [working with baselines][2] for a detailed breakdown.

  [2]: working-with-baselines.md

## What is expansion?

Expansion is a feature of PSRule for Azure that converts Azure Infrastructure as Code (IaC) to a testable Azure resource.
IaC format such as Bicep and ARM templates, support dynamic capabilities such parameters, variables, and conditions...
These dynamic capabilities allow customers to create modular reusable code that can scale across an organization.
However, to determine if a specific Azure resource meets the requirements of an organization the final state must be known.

Expansion resolves these dynamic capabilities so that a final state for each resource can be tested by rules.
Noting the final expanded state provided by PSRule for Azure is a close approximation.
This close approximation allows testing of Azure resources offline directly from code before deployment to Azure.

Continue reading [Expanding source files](expanding-source-files.md).

## Is Terraform supported?

Currently PSRule for Azure supports testing Azure resources from IaC with:

- Azure Resource Manager (ARM) templates.
- Azure Bicep deployments.

Checking Terraform from HashiCorp Configuration Language (HCL) is not supported at this time.
If this feature is important to you, please upvote 👍 the [issue][3] on GitHub.

What is supported?
After resources are deployed to Azure, PSRule for Azure can be used to check the Azure resources **in-flight**.

This methods works for Azure resources regardless of how they are deployed.
Use this method for analyzing resources deployed via the Azure Portal, Terraform, Pulumi, or other tools.

For instructions on how to do this see [Exporting rule data][4].

  [3]: https://github.com/Azure/PSRule.Rules.Azure/issues/1193
  [4]: export-rule-data.md

## What methods are supported for checking resources?

PSRule for Azure supports two methods for analyzing Azure resources:

- **Pre-flight** &mdash; Before resources are deployed from an ARM template or Bicep.
  Use _pre-flight_ analysis to:
  - Implement checks within Pull Requests (PRs).
  - Improve alignment of resources to WAF recommendations.
  - Identify issues that prevent successful resource deployments on Azure.
  - Integrate continual improvement and standardization of Azure resource configurations.
  - Implement release gates between environments.
  - For more information see [Creating your pipeline][5].
- **In-flight** &mdash; After resources are deployed to an Azure subscription.
  Use _in-flight_ analysis to:
  - Implement release gates between environments for non-native tools such as Terraform.
  - Performing offline analysis in split-environments.
  - For more information see [Exporting rule data][4].

  [5]: creating-your-pipeline.md

## How do I create a custom rule to enforce resource group tagging?

PSRule for Azure covers common use cases that align to the [Microsoft Azure Well-Architected Framework][AWAF].
Use of resource and resource group tags is recommended in the WAF, however implementation may vary.
You may want to use PSRule to enforce tagging or something similar early in a DevOps pipeline.

We have a walk through scenario [Enforcing custom tags][9] to get you started.

## How do I create a custom rule to enforce code ownership?

GitHub, Azure DevOps, and other DevOps platforms may implement code ownership.
This process involves assigning a team or an individual review and approval responsibility.
In GitHub or Azure DevOps implementation, ownership is linked to the file path.

When a repository contains resources that different teams would approve how do you:

- Ensure resources are created in a path that triggers the correct approval?

We have a walk through scenario [Enforcing code ownership][10] to get you started.

  [10]: customization/enforce-codeowners.md

## Do you have sample code?

In addition to the walk through scenarios, we have a quick start template [here][6].
The repository contains sample ARM templates, Bicep, and pipeline code to get you started.

In GitHub you can simply use the repository as a template for your own project.

  [6]: https://github.com/Azure/PSRule.Rules.Azure-quickstart

## Do I need PowerShell experience to start using PSRule for Azure?

No. You can start using built-in rules and CI with Azure Pipelines or GitHub Actions.
If we didn't tell you, you might not even know that PowerShell runs under the covers.

To perform local validation, some PowerShell setup is required but we step you through that.
See [How to install PSRule for Azure][7] for details.

To start writing your own custom rules you can use YAML, JSON, or PowerShell.
PowerShell experience is required for some scenarios.
We have a walk through scenario [Enforcing custom tags][9] to get you started.

  [7]: install.md
  [9]: customization/enforce-custom-tags.md

## What permissions do I need to export rule data?

When exporting data for _in-flight_ analysis,
the default built-in _Reader_ role to a subscription is required for:

- Exporting rule data with `Export-AzRuleData`.
- Exporting rule data from templates with `Export-AzRuleTemplateData` when online features are used.
  - Optionally `-ResourceGroupName` and `-Subscription` parameter can be used; these require access _Reader_ access.

## What permissions do I need to analyze exported rule data?

When exporting data for _in-flight_ analysis,
no access to Azure is required after data has been exported to JSON.

## Should I continue to use Azure Advisor, Defender for Cloud, or Azure Policy?

Absolutely.
PSRule for Azure does not replace Azure Advisor, Microsoft Defender for Cloud, or Azure Policy.

PSRule complements Azure Advisor, Microsoft Defender for Cloud, and Azure Policy features by:

- Recommending turning on and using features of Azure Advisor, Microsoft Defender for Cloud, or Azure Policy.
- Providing offline analysis in split environments where the analyst has no access to Azure subscriptions.
  Rule data for analysis can be exported out to a JSON file.
- Providing the ability to analyze resources in Azure Resource Manager templates before deployment.
  Additionally, analysis can be performed in a CI process.
- Providing the ability to layer on organization specific rules, as required.
- Data collection requires limited permissions and requires no additional configuration.

## What do the different severity and levels for rules means?

PSRule for Azure annotates rules with three (3) severities which indicate how you should prioritize remediation.
The following severities are defined:

- `Critical` &mdash; Consider addressing these first, ideally within the next thirty (30) days.
  Rules identified as _critical_ often have high impact and are highly likely to affect your services.
- `Important` &mdash; Consider addressing these next, ideally within the next sixty (60) days.
  Rules identified as _important_ often have a significant impact and are likely to affect your services.
- `Awareness` &mdash; Consider addressing these last, ideally within the next ninety (90) days.
  Rules identified as _awareness_ often have a moderate or low impact to the operation of your services.

!!! Tip
    Severities and suggested time frames are an indicator only.
    They may affect your environment, compliance, or security differently based on your specific requirements.
    If you feel the severity for a rule is broadly incorrect then please let as know.
    You can do this by [joining or starting a discussion][discussion].

Additionally, PSRule for Azure uses three (3) rule levels.
These levels determine how PSRule provides feedback about failing cases.
The following levels are defined:

- `Error` &mdash; Rules defined as _error_ will stop CI pipelines that are configured to break on error.
- `Warning` &mdash; Rules defined as _warning_ will not stop CI pipelines and will produce a warning.
- `Information` &mdash; Rules defined as _information_ will not stop CI pipelines.

## How often are releases shipped?

PSRule for Azure uses [semantic versioning][15] to declare breaking changes.

- Major releases are infrequent in nature, but created on an as-needed basis.
  You can check the [upgrade notes][16] to plan for the changes of the next major release.
- Minor releases are shipped normally each month.
- Patch releases for the most recent minor version are released on an as-needed basis.

The latest module version can be installed from the PowerShell Gallery and NuGet.
For a list of module changes please see the [change log][17].

For more information on how we handles versioning and changes see [Changes and versioning][18].

  [15]: https://semver.org/
  [16]: upgrade-notes.md
  [17]: https://aka.ms/ps-rule-azure/changelog
  [18]: versioning.md

## Traditional unit testing vs PSRule for Azure?

You may already be using a unit test framework such as Pester to test infrastructure code.
If you are, then you may have encountered the following challenges.

For a general PSRule/ Pester comparison see [How is PSRule different to Pester?][11]

  [11]: https://microsoft.github.io/PSRule/v2/faq/#how-is-psrule-different-to-pester

### Unit testing more than basic JSON structure

Unit tests are unable to effectively test resources contained within Azure templates.
Templates should be reusable, but this creates problems for testing when functions, conditions and copy loops are used.
Template parameters could completely change the type, number of, or configuration of resources.

PSRule resolves templates to allow analysis of the resources that would be deployed based on provided parameters.

### Standard library of tests

When building unit tests for Azure resources, starting with an empty repository can be a daunting experience.
While there are several open source repositories and samples around to get you started, you need to integrate these yourself.

_PSRule for Azure_ is distributed as a PowerShell module using the PowerShell Gallery.
Using a PowerShell module makes it easy to install and update.
The built-in rules allow you starting testing resources quickly, with minimal integration.

For detailed examples see:

- [Validate Azure resources from templates with Azure Pipelines](scenarios/azure-pipelines-ci/azure-pipelines-ci.md)
- [Validate Azure resources from templates with continuous integration (CI)](scenarios/azure-template-ci/azure-template-ci.md)

## Collection of telemetry

PSRule and PSRule for Azure currently do not collect any telemetry during installation or execution.

PowerShell (used by PSRule for Azure) does collect basic telemetry by default.
Collection of telemetry in PowerShell and how to opt-out is explained in [about_Telemetry][12].

  [12]: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_telemetry

*[ARM]: Azure Resource Manager
*[WAF]: Well-Architected Framework
*[IaC]: Infrastructure as Code
*[CI]: Continuous Integration
*[PRs]: Pull Requests

[ignore-rule]: https://microsoft.github.io/PSRule/v2/faq/#how-do-i-ignore-a-rule
[ps-rule-configure]: https://microsoft.github.io/PSRule/v2/faq/#how-do-i-configure-psrule
[ps-rule-faq]: https://microsoft.github.io/PSRule/v2/faq/
[add-custom-rule]: https://microsoft.github.io/PSRule/v2/faq/#how-do-i-layer-on-custom-rules-on-top-of-an-existing-module
