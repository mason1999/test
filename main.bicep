targetScope = 'subscription'

param policies array

resource policy 'Microsoft.Authorization/policyDefinitions@2025-03-01' = [
  for x in policies: {
    name: x.name
    properties: x.properties
  }
]
