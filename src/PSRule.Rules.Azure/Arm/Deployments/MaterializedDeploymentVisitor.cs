// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

using System;
using System.Collections.Generic;
using Newtonsoft.Json.Linq;
using PSRule.Rules.Azure.Arm.Expressions;

namespace PSRule.Rules.Azure.Arm.Deployments;

/// <summary>
/// A template visitor for generating rule data.
/// </summary>
internal sealed class MaterializedDeploymentVisitor : DeploymentVisitor
{
    private const string PROPERTY_DEPENDS_ON = "dependsOn";
    private const string PROPERTY_COMMENTS = "comments";
    private const string PROPERTY_CONDITION = "condition";
    private const string PROPERTY_RESOURCES = "resources";
    private const string PROPERTY_ID = "id";
    private const string PROPERTY_NAME = "name";
    private const string PROPERTY_LOCATION = "location";
    private const string PROPERTY_CUSTOM_NETWORK_INTERFACE_NAME = "customNetworkInterfaceName";
    private const string PROPERTY_PROPERTIES = "properties";
    private const string PROPERTY_PROVISIONING_STATE = "provisioningState";
    private const string PROPERTY_CLIENT_ID = "clientId";
    private const string PROPERTY_PRINCIPAL_ID = "principalId";
    private const string PROPERTY_PRINCIPAL_TYPE = "principalType";
    private const string PROPERTY_TENANT_ID = "tenantId";
    private const string PROPERTY_ADMINISTRATORS = "administrators";
    private const string PROPERTY_IDENTITY = "identity";
    private const string PROPERTY_TYPE = "type";
    private const string PROPERTY_SITE_CONFIG = "siteConfig";
    private const string PROPERTY_SUBNETS = "subnets";
    private const string PROPERTY_NETWORK_INTERFACES = "networkInterfaces";
    private const string PROPERTY_SUBSCRIPTION_ID = "subscriptionId";
    private const string PROPERTY_ACCEPT_OWNERSHIP_STATE = "acceptOwnershipState";
    private const string PROPERTY_ACCEPT_OWNERSHIP_URL = "acceptOwnershipUrl";
    private const string PROPERTY_LOGIN_SERVER = "loginServer";
    private const string PROPERTY_RULES = "rules";
    private const string PROPERTY_RULE_ID = "ruleId";
    private const string PROPERTY_ACCESS_POLICIES = "accessPolicies";
    private const string PROPERTY_SERVICE_BUS_ENDPOINT = "serviceBusEndpoint";
    private const string PROPERTY_PRIMARY_ENDPOINTS = "primaryEndpoints";
    private const string PROPERTY_PRIMARY_LOCATION = "primaryLocation";

    private const string PLACEHOLDER_GUID = "ffffffff-ffff-ffff-ffff-ffffffffffff";
    private const string IDENTITY_SYSTEM_ASSIGNED = "SystemAssigned";
    private const string DEFAULT_USER = "User";
    private const string PROVISIONING_STATE_SUCCEEDED = "Succeeded";

    private const string TYPE_USER_ASSIGNED_IDENTITY = "Microsoft.ManagedIdentity/userAssignedIdentities";
    private const string TYPE_SQLSERVER = "Microsoft.Sql/servers";
    private const string TYPE_SQLSERVER_ADMINISTRATOR = "Microsoft.Sql/servers/administrators";
    private const string TYPE_WEBAPP = "Microsoft.Web/sites";
    private const string TYPE_WEBAPP_CONFIG = "Microsoft.Web/sites/config";
    private const string TYPE_WEBAPP_SLOT = "Microsoft.Web/sites/slots";
    private const string TYPE_WEBAPP_SLOT_CONFIG = "Microsoft.Web/sites/slots/config";
    private const string TYPE_VIRTUAL_NETWORK = "Microsoft.Network/virtualNetworks";
    private const string TYPE_PRIVATE_ENDPOINT = "Microsoft.Network/privateEndpoints";
    private const string TYPE_NETWORK_INTERFACE = "Microsoft.Network/networkInterfaces";
    private const string TYPE_SUBSCRIPTION_ALIAS = "Microsoft.Subscription/aliases";
    private const string TYPE_CONTAINER_REGISTRY = "Microsoft.ContainerRegistry/registries";
    private const string TYPE_KEYVAULT = "Microsoft.KeyVault/vaults";
    private const string TYPE_STORAGE_OBJECTREPLICATIONPOLICIES = "Microsoft.Storage/storageAccounts/objectReplicationPolicies";
    private const string TYPE_AUTHORIZATION_ROLE_ASSIGNMENTS = "Microsoft.Authorization/roleAssignments";
    private const string TYPE_MANAGEMENT_GROUPS = "Microsoft.Management/managementGroups";
    private const string TYPE_RELAY_NAMESPACE = "Microsoft.Relay/namespaces";
    private const string TYPE_SERVICE_BUS_NAMESPACE = "Microsoft.ServiceBus/namespaces";
    private const string TYPE_STORAGE_ACCOUNT = "Microsoft.Storage/storageAccounts";

    private static readonly JsonMergeSettings _MergeSettings = new()
    {
        MergeArrayHandling = MergeArrayHandling.Concat,
        MergeNullValueHandling = MergeNullValueHandling.Ignore,
        PropertyNameComparison = StringComparison.OrdinalIgnoreCase
    };

    protected override void Resource(TemplateContext context, IResourceValue resource)
    {
        // Remove resource properties that not required in rule data
        if (resource.Value.ContainsKey(PROPERTY_CONDITION))
            resource.Value.Remove(PROPERTY_CONDITION);

        if (resource.Value.ContainsKey(PROPERTY_COMMENTS))
            resource.Value.Remove(PROPERTY_COMMENTS);

        if (!resource.Value.TryGetDependencies(out _))
            resource.Value.Remove(PROPERTY_DEPENDS_ON);

        base.Resource(context, resource);
    }

    protected override void EndTemplate(TemplateContext context, string deploymentName, JObject template)
    {
        // Re-arrange sub-resources.
        var resources = context.GetResources();
        for (var i = 0; i < resources.Length; i++)
            MoveResource(context, resources[i]);

        // Fill in properties for resources that have known special cases that can be calculated.
        BuildMaterializedView(context, context.GetResources());
        base.EndTemplate(context, deploymentName, template);
    }

    /// <summary>
    /// When a resource in emitted, fill in runtime properties that can be calculated.
    /// </summary>
    protected override void Emit(TemplateContext context, IResourceValue resource)
    {
        ProjectRuntimeProperties(context, resource);
        base.Emit(context, resource);
    }

    /// <summary>
    /// Build materialized views.
    /// </summary>
    private static void BuildMaterializedView(TemplateContext context, IResourceValue[] resources)
    {
        var remaining = new List<IResourceValue>(resources);
        var processed = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        for (var i = 0; resources != null && i < resources.Length; i++)
        {
            if (processed.Contains(resources[i].Id))
                continue;

            MergeResource(context, resources[i], remaining, processed);
            ProjectEffectiveProperties(resources[i]);
            processed.Add(resources[i].Id);
            remaining.Remove(resources[i]);
        }
    }

    /// <summary>
    /// Project calculated properties into the resource.
    /// </summary>
    private static void ProjectEffectiveProperties(IResourceValue resource)
    {
        _ = MaterializedWebApp(resource) ||
            MaterializedSQLServer(resource);
    }

    /// <summary>
    /// Project runtime properties that are commonly referenced.
    /// </summary>
    private static void ProjectRuntimeProperties(TemplateContext context, IResourceValue resource)
    {
        _ = ProjectManagedIdentity(context, resource) ||
            ProjectVirtualNetwork(context, resource) ||
            ProjectContainerRegistry(context, resource) ||
            ProjectPrivateEndpoints(context, resource) ||
            ProjectSubscriptionAlias(context, resource) ||
            ProjectStorageObjectReplicationPolicies(context, resource) ||
            ProjectKeyVault(context, resource) ||
            ProjectRoleAssignments(context, resource) ||
            ProjectManagementGroup(context, resource) ||
            ProjectServiceBusNamespace(context, resource) ||
            ProjectRelayNamespace(context, resource) ||
            ProjectStorageAccount(context, resource) ||
            ProjectResource(context, resource);
    }

    /// <summary>
    /// Project runtime properties for a relay namespace.
    /// </summary>
    private static bool ProjectRelayNamespace(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_RELAY_NAMESPACE))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);
        properties.AddIfNotExists(PROPERTY_PROVISIONING_STATE, PROVISIONING_STATE_SUCCEEDED);
        properties.AddIfNotExists(PROPERTY_SERVICE_BUS_ENDPOINT, $"https://{resource.Name}.servicebus.windows.net:443/");

        return true;
    }

    /// <summary>
    /// Project runtime properties for a service bus namespace.
    /// </summary>
    private static bool ProjectServiceBusNamespace(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_SERVICE_BUS_NAMESPACE))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);
        properties.AddIfNotExists(PROPERTY_PROVISIONING_STATE, PROVISIONING_STATE_SUCCEEDED);
        properties.AddIfNotExists(PROPERTY_SERVICE_BUS_ENDPOINT, $"https://{resource.Name}.servicebus.windows.net:443/");

        return true;
    }

    /// <summary>
    /// Project runtime properties for a storage account.
    /// </summary>
    private static bool ProjectStorageAccount(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_STORAGE_ACCOUNT))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);
        properties.AddIfNotExists(PROPERTY_PROVISIONING_STATE, PROVISIONING_STATE_SUCCEEDED);
        properties.AddIfNotExists(PROPERTY_PRIMARY_LOCATION, resource.Value[PROPERTY_LOCATION]?.Value<string>()?.ToLowerInvariant());

        properties.UseProperty(PROPERTY_PRIMARY_ENDPOINTS, out JObject primaryEndpoints);
        primaryEndpoints.AddIfNotExists("web", $"https://{resource.Name}.web.core.windows.net/");
        primaryEndpoints.AddIfNotExists("dfs", $"https://{resource.Name}.dfs.core.windows.net/");
        primaryEndpoints.AddIfNotExists("blob", $"https://{resource.Name}.blob.core.windows.net/");
        primaryEndpoints.AddIfNotExists("file", $"https://{resource.Name}.file.core.windows.net/");
        primaryEndpoints.AddIfNotExists("queue", $"https://{resource.Name}.queue.core.windows.net/");
        primaryEndpoints.AddIfNotExists("table", $"https://{resource.Name}.table.core.windows.net/");

        return true;
    }

    private static bool ProjectResource(TemplateContext context, IResourceValue resource)
    {
        if (!resource.Value.TryGetProperty(PROPERTY_IDENTITY, out JObject identity) ||
            !identity.TryGetProperty(PROPERTY_TYPE, out var type) ||
            type.IndexOf(IDENTITY_SYSTEM_ASSIGNED, StringComparison.OrdinalIgnoreCase) == -1)
            return true;

        if (!identity.ContainsKeyInsensitive(PROPERTY_PRINCIPAL_ID))
            identity.Add(PROPERTY_PRINCIPAL_ID, PLACEHOLDER_GUID);

        if (!identity.ContainsKeyInsensitive(PROPERTY_TENANT_ID))
            identity.Add(PROPERTY_TENANT_ID, context.Tenant.TenantId);

        return true;
    }

    private static bool ProjectManagementGroup(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_MANAGEMENT_GROUPS))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add properties.tenantId
        if (!properties.ContainsKeyInsensitive(PROPERTY_TENANT_ID))
        {
            properties[PROPERTY_TENANT_ID] = context.Tenant.TenantId;
        }

        return true;
    }

    private static bool ProjectRoleAssignments(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_AUTHORIZATION_ROLE_ASSIGNMENTS))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add properties.principalType
        if (!properties.ContainsKeyInsensitive(PROPERTY_PRINCIPAL_TYPE))
        {
            properties[PROPERTY_PRINCIPAL_TYPE] = DEFAULT_USER;
        }

        return true;
    }

    private static bool ProjectManagedIdentity(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_USER_ASSIGNED_IDENTITY))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);
        if (!properties.ContainsKeyInsensitive(PROPERTY_CLIENT_ID))
            properties.Add(PROPERTY_CLIENT_ID, PLACEHOLDER_GUID);

        if (!properties.ContainsKeyInsensitive(PROPERTY_PRINCIPAL_ID))
            properties.Add(PROPERTY_PRINCIPAL_ID, PLACEHOLDER_GUID);

        if (!properties.ContainsKeyInsensitive(PROPERTY_TENANT_ID))
            properties.Add(PROPERTY_TENANT_ID, context.Tenant.TenantId);

        return true;
    }

    private static bool ProjectVirtualNetwork(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_VIRTUAL_NETWORK))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Get subnets
        if (properties.TryArrayProperty(PROPERTY_SUBNETS, out var subnets))
        {
            foreach (var subnet in subnets.Values<JObject>())
            {
                if (subnet.TryGetProperty(PROPERTY_NAME, out var name))
                    subnet[PROPERTY_ID] = string.Concat(resource.Id, "/subnets/", name);
            }
        }
        return true;
    }

    private static bool ProjectPrivateEndpoints(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_PRIVATE_ENDPOINT))
            return false;

        if (!ResourceHelper.TryResourceGroup(resource.Id, out var subscriptionId, out var resourceGroupName))
            return true;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add network interfaces
        if (!properties.ContainsKeyInsensitive(PROPERTY_NETWORK_INTERFACES))
        {
            // If the special case of a customNetworkInterfaceName property exists then use that for the name of the NIC.
            var networkInterfaceName = properties.TryStringProperty(PROPERTY_CUSTOM_NETWORK_INTERFACE_NAME, out var customNetworkInterfaceName) &&
                !string.IsNullOrEmpty(customNetworkInterfaceName) ? customNetworkInterfaceName : $"pe.nic.{ExpressionHelpers.GetUniqueString([resource.Id])}";

            var networkInterface = new JObject
            {
                [PROPERTY_ID] = ResourceHelper.CombineResourceId(subscriptionId, resourceGroupName, TYPE_NETWORK_INTERFACE, networkInterfaceName)
            };
            properties[PROPERTY_NETWORK_INTERFACES] = new JArray(new JObject[] { networkInterface });
        }
        return true;
    }

    private static bool ProjectSubscriptionAlias(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_SUBSCRIPTION_ALIAS))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add subscriptionId
        if (!properties.ContainsKeyInsensitive(PROPERTY_SUBSCRIPTION_ID))
        {
            properties[PROPERTY_SUBSCRIPTION_ID] = Guid.NewGuid().ToString();
        }

        // Add acceptOwnershipState
        if (!properties.ContainsKeyInsensitive(PROPERTY_ACCEPT_OWNERSHIP_STATE))
        {
            properties[PROPERTY_ACCEPT_OWNERSHIP_STATE] = "Completed";
        }

        // Add acceptOwnershipUrl
        if (!properties.ContainsKeyInsensitive(PROPERTY_ACCEPT_OWNERSHIP_URL))
        {
            properties[PROPERTY_ACCEPT_OWNERSHIP_URL] = string.Empty;
        }
        return true;
    }

    private static bool ProjectContainerRegistry(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_CONTAINER_REGISTRY))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add loginServer
        if (!properties.ContainsKeyInsensitive(PROPERTY_LOGIN_SERVER))
        {
            properties[PROPERTY_LOGIN_SERVER] = $"{resource.Name}.azurecr.io";
        }
        return ProjectResource(context, resource);
    }

    private static bool ProjectKeyVault(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_KEYVAULT))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add properties.accessPolicies
        if (!properties.ContainsKeyInsensitive(PROPERTY_ACCESS_POLICIES))
        {
            properties[PROPERTY_ACCESS_POLICIES] = new JArray();
        }

        // Add properties.tenantId
        if (!properties.ContainsKeyInsensitive(PROPERTY_TENANT_ID))
        {
            properties[PROPERTY_TENANT_ID] = context.Tenant.TenantId;
        }
        return true;
    }

    private static bool ProjectStorageObjectReplicationPolicies(TemplateContext context, IResourceValue resource)
    {
        if (!resource.IsType(TYPE_STORAGE_OBJECTREPLICATIONPOLICIES))
            return false;

        resource.Value.UseProperty(PROPERTY_PROPERTIES, out JObject properties);

        // Add rules.ruleId
        if (properties.TryArrayProperty(PROPERTY_RULES, out var rules))
        {
            foreach (var rule in rules.Values<JObject>())
            {
                if (!rule.ContainsKeyInsensitive(PROPERTY_RULE_ID))
                    rule[PROPERTY_RULE_ID] = Guid.NewGuid().ToString();
            }

        }
        return true;
    }

    /// <summary>
    /// Handle special cases for Logical SQL Server.
    /// Entra administrator group can be defined on the server or overridden by a sub-resource.
    /// </summary>
    private static bool MaterializedSQLServer(IResourceValue resource)
    {
        if (!resource.IsType(TYPE_SQLSERVER))
            return false;

        if (!resource.Value.TryGetResources(TYPE_SQLSERVER_ADMINISTRATOR, out var subResources))
            return true;

        for (var i = 0; i < subResources.Length; i++)
        {
            // The sub-resource if defined overrides the configuration on the server.
            if (subResources[i].ResourceNameEquals("ActiveDirectory") &&
                subResources[i].TryGetProperty<JObject>(PROPERTY_PROPERTIES, out var overrideProperties))
            {
                resource.Value.UseProperty<JObject>(PROPERTY_PROPERTIES, out var properties);
                properties.UseProperty<JObject>(PROPERTY_ADMINISTRATORS, out var administrators);
                administrators.Merge(overrideProperties, _MergeSettings);
            }
        }
        return true;
    }

    /// <summary>
    /// Handle special cases for web apps and slots.
    /// SiteConfig can be defined on the web app or be overridden by a config sub-resource.
    /// </summary>
    private static bool MaterializedWebApp(IResourceValue resource)
    {
        string configType = null;
        if (resource.IsType(TYPE_WEBAPP))
            configType = TYPE_WEBAPP_CONFIG;
        else if (resource.IsType(TYPE_WEBAPP_SLOT))
            configType = TYPE_WEBAPP_SLOT_CONFIG;

        if (configType == null)
            return false;

        if (!resource.Value.TryGetResources(configType, out var subResources))
            return true;

        for (var i = 0; i < subResources.Length; i++)
        {
            if (subResources[i].ResourceNameEquals("web") &&
                subResources[i].TryGetProperty<JObject>(PROPERTY_PROPERTIES, out var overrideProperties))
            {
                resource.Value.UseProperty<JObject>(PROPERTY_PROPERTIES, out var properties);
                properties.UseProperty<JObject>(PROPERTY_SITE_CONFIG, out var siteConfig);
                siteConfig.Merge(overrideProperties, _MergeSettings);
            }
        }
        return true;
    }

    /// <summary>
    /// Merge resources based on duplicates which could occur across modules.
    /// </summary>
    private static void MergeResource(TemplateContext context, IResourceValue resource, List<IResourceValue> unprocessed, HashSet<string> processed)
    {
        _ = MergeResourceLeft(context, resource, unprocessed, processed) ||
            MergeResourceRight(context, resource, unprocessed, processed);
    }

    private static bool MergeResourceLeft(TemplateContext context, IResourceValue resource, List<IResourceValue> unprocessed, HashSet<string> processed)
    {
        if (!ShouldMergeLeft(resource.Type))
            return false;

        var duplicates = unprocessed.FindAll(x => x.Id == resource.Id);
        for (var i = 1; duplicates.Count > 1 && i < duplicates.Count; i++)
        {
            MergeResourceLeft(duplicates[0].Value, duplicates[i].Value, processed);
            unprocessed.Remove(duplicates[i]);
            context.RemoveResource(duplicates[i]);
        }
        return true;
    }

    /// <summary>
    /// Merge specific resources and their sub-resources.
    /// </summary>
    private static void MergeResourceLeft(JObject left, JObject right, HashSet<string> processed)
    {
        left.Merge(right, _MergeSettings);

        // Handle child resources
        if (left.TryGetResources(out var resources))
        {
            for (var i = 0; resources != null && i < resources.Length; i++)
            {
                if (!resources[i].TryGetProperty(PROPERTY_ID, out var childResourceId) || processed.Contains(childResourceId))
                    continue;

                var duplicates = Array.FindAll(resources, x => x[PROPERTY_ID].ToString() == childResourceId);
                for (var j = 1; duplicates.Length > 1 && j < duplicates.Length; j++)
                {
                    MergeResourceLeft(duplicates[0].Value<JObject>(), duplicates[j].Value<JObject>(), processed);
                    duplicates[j].Remove();
                }
                processed.Add(childResourceId);
            }
        }
    }

    /// <summary>
    /// Merge resources based on duplicates which could occur across modules.
    /// Last instance wins but sub-resources are accumulated.
    /// </summary>
    private static bool MergeResourceRight(TemplateContext context, IResourceValue resource, List<IResourceValue> unprocessed, HashSet<string> processed)
    {
        var duplicates = unprocessed.FindAll(x => x.Id == resource.Id);
        for (var i = 1; duplicates.Count > 1 && i < duplicates.Count; i++)
        {
            MergeResourceRight(duplicates[i - 1].Value, duplicates[i].Value, processed);
            unprocessed.Remove(duplicates[i - 1]);
            context.RemoveResource(duplicates[i - 1]);
        }

        var right = duplicates[duplicates.Count - 1];
        if (duplicates.Count > 1 && right.Value.TryGetResources(out var subResources))
        {
            for (var i = subResources.Length - 1; i >= 0; i--)
            {
                if (!subResources[i].TryGetProperty(PROPERTY_ID, out var childResourceId))
                    continue;

                if (processed.Contains(childResourceId))
                {
                    subResources[i].Remove();
                }
                else
                {
                    processed.Add(childResourceId);
                }
            }
        }
        return true;
    }

    /// <summary>
    /// Merge resources sub-resources only.
    /// </summary>
    private static void MergeResourceRight(JObject left, JObject right, HashSet<string> processed)
    {
        // Get sub-resources.
        if (left.TryGetResources(out var leftResources))
        {
            if (!right.TryGetResourcesArray(out var rightResources))
                rightResources = new JArray();

            rightResources.AddRangeFromStart(leftResources);
            right.ReplaceProperty(PROPERTY_RESOURCES, rightResources);
        }
    }

    /// <summary>
    /// Move sub-resources based on parent resource relationship.
    /// This process nests sub-resources so that relationship can be analyzed.
    /// </summary>
    private static void MoveResource(TemplateContext context, IResourceValue resource)
    {
        if (!ShouldMove(resource.Type))
            return;

        if (resource.Value.TryGetDependencies(out _) || resource.Type.Split('/').Length > 2)
        {
            resource.Value.Remove(PROPERTY_DEPENDS_ON);
            if (context.TryParentResourceId(resource.Value, out var parentResourceId))
            {
                for (var j = 0; j < parentResourceId.Length; j++)
                {
                    if (context.TryGetResource(parentResourceId[j], out var parent))
                    {
                        parent.Value.UseProperty(PROPERTY_RESOURCES, out JArray innerResources);
                        innerResources.Add(resource.Value);
                        context.RemoveResource(resource);
                    }
                }
            }
        }
    }

    /// <summary>
    /// Determines if the specific sub-resource type should be nested.
    /// </summary>
    private static bool ShouldMove(string resourceType)
    {
        return !string.Equals(resourceType, "Microsoft.Sql/servers/databases", StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>
    /// Determines if the specific resource type should be merged.
    /// </summary>
    private static bool ShouldMergeLeft(string resourceType)
    {
        return string.Equals(resourceType, "Microsoft.Storage/storageAccounts", StringComparison.OrdinalIgnoreCase);
    }
}
