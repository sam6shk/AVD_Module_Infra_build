# Remote state backend configuration for PROD environment.
# Uncomment and configure with your Azure Storage Account details before running in production CI/CD.

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "rg-tfstate-prod"
#     storage_account_name = "sttfstateprod001"
#     container_name       = "tfstate"
#     key                  = "avd-prod.tfstate"
#   }
# }
