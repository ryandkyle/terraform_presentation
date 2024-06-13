# Commands run to set up the environment at any point for CRUD operations

## Before running `terraform plan`

### Get account info
`az account show`
Reference: https://learn.microsoft.com/en-US/cli/azure/account?view=azure-cli-latest#az-account-show

### Get an access token
`az account get-access-token --subscription <sub-id>`
Reference: https://learn.microsoft.com/en-US/cli/azure/account?view=azure-cli-latest#az-account-get-access-token

### Create SP to run Terraform commands
`az ad sp create-for-rbac --name terraform-spn --role Contributor --scopes /subscriptions/<sub-id>`
Reference: https://learn.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash#create-a-service-principal

### Find the SP created
`az ad sp list --display-name terraform-spn --output table`
Reference: https://learn.microsoft.com/en-us/cli/azure/azure-cli-sp-tutorial-4?tabs=bash#list-service-principals

### Reset SP password
`az ad sp credential reset --id <spn-id>`
Reference: https://learn.microsoft.com/en-us/cli/azure/azure-cli-sp-tutorial-7?tabs=bash#reset-credentials-returning-output-to-the-console-and-log-file

# PowerShell

### Register 

`Register-AzureRmResourceProvider -ProviderNamespace Microsoft.App`
Reference: 
