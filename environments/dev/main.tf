# 1. Resource Group
module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = "rg-avd-${var.environment}-${var.location}"
  location            = var.location
  tags                = var.tags
}

# 2. Virtual Network & Subnet
module "network" {
  source                  = "../../modules/network"
  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  vnet_name               = "vnet-avd-${var.environment}-${var.location}"
  address_space           = ["10.1.0.0/16"]
  subnet_name             = "snet-avd-${var.environment}"
  subnet_address_prefixes = ["10.1.1.0/24"]
  tags                    = var.tags
}

# 3. Entra ID (Azure AD) Test User
module "entra_test_user" {
  source              = "../../modules/entra_user"
  create_user         = var.create_test_user
  user_principal_name = "avd.testuser.${var.environment}@${var.domain_name}"
  display_name        = "AVD Test User (${upper(var.environment)})"
  mail_nickname       = "avdtestuser${var.environment}"
}

# 4. Personal AVD Host Pool & Resources
module "personal_host_pool" {
  source                           = "../../modules/host_pool"
  host_pool_name                   = "hp-avd-personal-${var.environment}"
  location                         = module.resource_group.location
  resource_group_name              = module.resource_group.name
  host_pool_type                   = "Personal"
  load_balancer_type               = "Persistent"
  personal_desktop_assignment_type = "Automatic"
  tags                             = var.tags
}

module "personal_app_group" {
  source                 = "../../modules/application_group"
  app_group_name         = "ag-avd-personal-desktop-${var.environment}"
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  app_group_type         = "Desktop"
  host_pool_id           = module.personal_host_pool.id
  assignee_principal_ids = [module.entra_test_user.object_id]
  tags                   = var.tags
}

module "personal_session_host" {
  source                       = "../../modules/session_host"
  vm_name                      = "vmavdpers${var.environment}"
  location                     = module.resource_group.location
  resource_group_name          = module.resource_group.name
  subnet_id                    = module.network.subnet_id
  vm_size                      = var.vm_size
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  host_pool_name               = module.personal_host_pool.name
  host_pool_registration_token = module.personal_host_pool.registration_token
  assigned_user_object_ids     = [module.entra_test_user.object_id]
  tags                         = var.tags
}

# 5. Pooled AVD Host Pool & Resources
module "pooled_host_pool" {
  source                   = "../../modules/host_pool"
  host_pool_name           = "hp-avd-pooled-${var.environment}"
  location                 = module.resource_group.location
  resource_group_name      = module.resource_group.name
  host_pool_type           = "Pooled"
  load_balancer_type       = "BreadthFirst"
  maximum_sessions_allowed = 10
  tags                     = var.tags
}

module "pooled_app_group" {
  source                 = "../../modules/application_group"
  app_group_name         = "ag-avd-pooled-desktop-${var.environment}"
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  app_group_type         = "Desktop"
  host_pool_id           = module.pooled_host_pool.id
  assignee_principal_ids = [module.entra_test_user.object_id]
  tags                   = var.tags
}

module "pooled_session_host" {
  source                       = "../../modules/session_host"
  vm_name                      = "vmavdpool${var.environment}"
  location                     = module.resource_group.location
  resource_group_name          = module.resource_group.name
  subnet_id                    = module.network.subnet_id
  vm_size                      = var.vm_size
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  host_pool_name               = module.pooled_host_pool.name
  host_pool_registration_token = module.pooled_host_pool.registration_token
  assigned_user_object_ids     = [module.entra_test_user.object_id]
  tags                         = var.tags
}

# 6. AVD Unified Workspace
module "workspace" {
  source              = "../../modules/workspace"
  workspace_name      = "ws-avd-${var.environment}"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  application_group_ids = [
    module.personal_app_group.id,
    module.pooled_app_group.id
  ]
  tags = var.tags
}
