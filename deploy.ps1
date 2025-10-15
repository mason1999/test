$input_bicep_param_path = './main.bicepparam'
$output_json_param_path = './main.json'

az bicep build-params -f $input_bicep_param_path --outfile $output_json_param_path
# Get-Content $output_json_param_path
$params = Get-Content $output_json_param_path | ConvertFrom-Json -AsHashTable -Depth 100
foreach ($x in (Get-ChildItem "policy-definitions")) {
    $current_policy = Get-Content "policy-definitions/$($x.basename).json" | ConvertFrom-Json -AsHashTable -Depth 100
    $params.parameters.policies.value += $current_policy
}
$params | ConvertTo-Json -Depth 100 > $output_json_param_path

# Remove-Item -Path $output_json_param_path
