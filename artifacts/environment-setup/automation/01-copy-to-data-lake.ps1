Remove-Module solliance-synapse-automation
Import-Module ".\artifacts\environment-setup\solliance-synapse-automation"

$templatesPath = ".\artifacts\environment-setup\templates"
$workspaceName = "asaworkspace03"
$token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IkN0VHVoTUptRDVNN0RMZHpEMnYyeDNRS1NSWSIsImtpZCI6IkN0VHVoTUptRDVNN0RMZHpEMnYyeDNRS1NSWSJ9.eyJhdWQiOiJodHRwczovL2Rldi5henVyZXN5bmFwc2UubmV0IiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvY2VmY2I4ZTctZWUzMC00OWI4LWIxOTAtMTMzZjFkYWFmZDg1LyIsImlhdCI6MTU4ODAyOTQ3OSwibmJmIjoxNTg4MDI5NDc5LCJleHAiOjE1ODgwMzMzNzksImFjciI6IjEiLCJhaW8iOiI0MmRnWU1qcW4xRGw5TEZqOWo3Qm5jZEVKNXoyYnVNNzRuOVJQZC9yT0dQNHJ4aFdMVk1BIiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6ImVjNTJkMTNkLTJlODUtNDEwZS1hODlhLThjNzlmYjZhMzJhYyIsImFwcGlkYWNyIjoiMCIsImZhbWlseV9uYW1lIjoiMTc1Nzk5IiwiZ2l2ZW5fbmFtZSI6Ik9ETF9Vc2VyIiwiaXBhZGRyIjoiNzkuMTE4LjEuMjIzIiwibmFtZSI6Ik9ETF9Vc2VyIDE3NTc5OSIsIm9pZCI6IjM3MmI3ZDUxLTE2YTQtNDQ2Ny05NmU5LWMxNjlkZTA1NDFhMyIsInB1aWQiOiIxMDAzMjAwMEI3NDlDOThBIiwic2NwIjoid29ya3NwYWNlYXJ0aWZhY3RzLm1hbmFnZW1lbnQiLCJzdWIiOiJCdDlfMUhzZDFaTl8yTUFWcllSR3VKdmlEeENzYnIzdXdQb2NGNFZsUV9jIiwidGlkIjoiY2VmY2I4ZTctZWUzMC00OWI4LWIxOTAtMTMzZjFkYWFmZDg1IiwidW5pcXVlX25hbWUiOiJvZGxfdXNlcl8xNzU3OTlAbXNhenVyZWxhYnMub25taWNyb3NvZnQuY29tIiwidXBuIjoib2RsX3VzZXJfMTc1Nzk5QG1zYXp1cmVsYWJzLm9ubWljcm9zb2Z0LmNvbSIsInV0aSI6IjQ5a0N0VU5PWDBHTzNnRkhfOFE1QUEiLCJ2ZXIiOiIxLjAifQ.i5mxWA04KCze363DFcGSs1OovQqNe9saGa9MxuI9_5nkOCDNdHKTJoZ9r23KjTBg7wNYnAkIeAnahUq6LfbQUceXz7L-eBaTrMB3xuZOYsi5Pn15dJKicJknqkVvrKCaGbpJqv6VQJSQg_PFWTBt7og9Kyqk8MVv71tIghF97mX2B7RQP8PjaB9_GGCagCfmkgdpEqsMzf4IsKV4vcJc-ipfSKfkCnwfS6vDYD2r_lSfD3XD4fy6ueo92T_DWSrT_bTQlxSJpiu5-p1OR4ddM7guW1HXnpN2dLD5LM6V5erVPULK0evD2UjWQGSqP2egRcDZrvkDIaITJ3g1uTVEew"


Create-KeyVault-LinkedService -TemplatesPath $templatesPath -WorkspaceName $workspaceName -Name "asakeyvault01" -Token $token

$token
$name = "asakeyvault01"
$keyVaultTemplate = Get-Content -Path "$($TemplatesPath)/keyvault.json"
    $keyVault = $keyVaultTemplate.Replace("#KEY_VAULT_NAME#", "asakeyvault01")
$uri = "https://$workspaceName.dev.azuresynapse.net/linkedservices/$name?api-version=2019-06-01-preview"

    try
    {
    Invoke-RestMethod -Uri $uri -Method PUT -Body $keyVault -Headers @{ Authorization="Bearer $($Token)" }
    }
    catch { write-output $_}


$PSVersionTable.PSVersion