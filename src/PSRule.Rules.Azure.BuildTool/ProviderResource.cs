// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

using System;
using System.Collections.Generic;
using System.CommandLine.Invocation;
using System.IO;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PSRule.Rules.Azure.BuildTool.Models;

namespace PSRule.Rules.Azure.BuildTool;

/// <summary>
/// Build a Azure resource type index for each resource provider.
/// </summary>
internal sealed class ProviderResource
{
    private sealed class TypeSet
    {
        public string Provider { get; set; }

        public string Type { get; set; }
    }

    public static void Build(ProviderResourceOption options, InvocationContext invocation)
    {
        BuildIndex(options);
        MinifyTypes(options);
        MinifyLocations(options);
        MinifyEnvironments(options);
        MinifyPolicyIgnore(options);
        MinifySecretTemplate(options);
        MinifySecretProperty(options);
    }

    private static void MinifyEnvironments(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify environments");
        var environments = ReadFile<JObject>(GetSourcePath("./data/environments.json"));
        WriteFile(GetSourcePath("./data/environments.min.json"), environments);
    }

    private static void MinifyPolicyIgnore(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify policy-ignore");
        var entries = ReadFile<PolicyIgnoreEntry[]>(GetSourcePath("./data/policy-ignore.json"));
        WriteFile(GetSourcePath("./data/policy-ignore.min.json"), entries.Select(e => e.Min));
    }

    private static void MinifySecretTemplate(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify secret-template");
        var secretTemplate = ReadFile<JObject>(GetSourcePath("./data/secret-template.json"));
        WriteFile(GetSourcePath("./data/secret-template.min.json"), secretTemplate);
    }

    private static void MinifySecretProperty(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify secret-property");
        var secretProperty = ReadFile<JObject>(GetSourcePath("./data/secret-property.json"));
        WriteFile(GetSourcePath("./data/secret-property.min.json"), secretProperty);
    }

    private static void MinifyLocations(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify locations");
        var locations = ReadFile<JObject>(GetSourcePath("./data/locations.json"));
        WriteFile(GetSourcePath("./data/locations.min.json"), locations);
    }

    private static void MinifyTypes(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Minify types");
        var count = 0;
        foreach (var provider in GetProviders(GetSourcePath("./data/providers")))
        {
            var entries = ReadFile<ResourceTypeEntry[]>(provider);
            WriteMinifiedResourceType(provider, entries.Select(e => e.Min));
            count++;
        }
        Console.WriteLine($"BuildTool -- {count} providers processed");
    }

    private static void BuildIndex(ProviderResourceOption options)
    {
        Console.WriteLine("BuildTool -- Building type index");
        var index = new Dictionary<string, IndexEntry>();
        var count = 0;
        foreach (var provider in GetProviders(GetSourcePath("./data/providers")))
        {
            var source = ReadFile<JArray>(provider);
            var set = GetTypeSet(provider, source);
            foreach (var type in set)
            {
                index[type.Type] = new IndexEntry
                {
                    RelativePath = type.Provider,
                    Index = Array.IndexOf(set, type)
                };
            }
            count++;
        }
        var json = JsonConvert.SerializeObject(index);
        File.WriteAllText(GetSourcePath(options.OutputPath ?? "./data/types_index.min.json"), json);
        Console.WriteLine($"BuildTool -- {count} providers processed");
    }

    private static void WriteMinifiedResourceType(string provider, IEnumerable<ResourceTypeMin> entries)
    {
        var file = provider.Replace("types.json", "types.min.json");
        WriteFile(file, entries);
    }

    private static IEnumerable<string> GetProviders(string path)
    {
        return Directory.EnumerateFiles(path, "types.json", SearchOption.AllDirectories);
    }

    private static TypeSet[] GetTypeSet(string path, JArray o)
    {
        var d = Path.GetFileName(Path.GetDirectoryName(path));
        var result = new TypeSet[o.Count];
        for (var i = 0; i < result.Length; i++)
        {
            result[i] = new TypeSet
            {
                Provider = d,
                Type = string.Concat(d, "/", o[i]["resourceType"].Value<string>().ToLowerInvariant())
            };
        }
        return result;
    }

    private static T ReadFile<T>(string path)
    {
        using var stream = new StreamReader(path);
        using var reader = new JsonTextReader(stream);
        try
        {

            var d = new JsonSerializer();
            return d.Deserialize<T>(reader);
        }
        catch (Exception)
        {
            Console.WriteLine($"ERROR - Failed to read file: {path}");
            throw;
        }
    }

    private static void WriteFile<T>(string path, T o)
    {
        using var stream = new StreamWriter(path, false, Encoding.UTF8);
        using var writer = new JsonTextWriter(stream);
        var d = new JsonSerializer();
        d.Serialize(writer, o);
    }

    private static string GetSourcePath(string name)
    {
        return Path.Combine(Directory.GetCurrentDirectory(), name);
    }
}
