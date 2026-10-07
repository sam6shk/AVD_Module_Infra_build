# Azure Virtual Desktop (AVD) Module-Based Infrastructure Provisioning

This repository provides reusable, modularized **Terraform** code to provision an end-to-end **Azure Virtual Desktop (AVD)** infrastructure for both `dev` and `prod` environments. It includes Entra ID (Azure AD) test user creation, Personal (Dedicated) AVD host pool setup, Pooled (Multi-Session) AVD host pool setup, workspace integration, RBAC role assignments, Azure DevOps (ADO) pipeline YAML, and GitHub Actions workflow YAML.

---

## 🏗️ Repository Architecture

```text
AVD_Module_based_Infra_Build/
├── .github/
│   └── workflows/
│       └── terraform-deploy.yml    # GitHub Actions workflow (Validate, Plan, Apply)
├── azure-pipelines.yml             # Azure DevOps multi-stage pipeline YAML
├── modules/
│   ├── resource_group/             # Resource Group module
│   ├── network/                    # VNet, Subnet, and NSG module
│   ├── host_pool/                  # AVD Host Pool & Registration Token module
│   ├── application_group/          # AVD App Group & RBAC assignment module
│   ├── workspace/                  # AVD Workspace & App Group association module
│   ├── entra_user/                 # Entra ID (Azure AD) Test User creation module
│   └── session_host/               # Session Host VM, Entra ID Join & DSC Agent module
├── environments/
│   ├── dev/                        # DEV environment configuration
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   ├── versions.tf
│   │   └── backend.tf
│   └── prod/                       # PROD environment configuration
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       ├── versions.tf
│       └── backend.tf
├── .gitignore
└── README.md
```

---

## 🚀 Key Features

1. **Reusable Terraform Modules**:
   - `resource_group`: Standardized Azure Resource Group management.
   - `network`: Virtual Network, subnet for session hosts, and NSG with AVD outbound rules.
   - `host_pool`: Modular creation for both **Personal** (Persistent load balancer, automatic desktop assignment) and **Pooled** (BreadthFirst / DepthFirst load balancer) host pools with token registration.
   - `application_group`: Desktop Application Groups linked to host pools with automatic `"Desktop Virtualization User"` role assignment.
   - `workspace`: AVD Workspace linking multiple application groups.
   - `entra_user`: Creates a test user in Entra ID with secure random or custom password generation.
   - `session_host`: Windows 11 Enterprise Multi-Session VM provisioning with system-assigned identity, **Entra ID Join** (`AADLoginForWindows`), AVD Agent Registration DSC, and `"Virtual Machine User Login"` RBAC role assignment for direct login.

2. **Multi-Environment Support (`dev` and `prod`)**:
   - Environment-specific parameterization (VM sizes, subnet prefixes, tag sets, session limits).

3. **CI/CD Integration**:
   - **Azure DevOps Pipeline (`azure-pipelines.yml`)**: Multi-stage pipeline (`Validate`, `Plan`, `Apply`) with manual environment approvals for `prod`.
   - **GitHub Actions (`.github/workflows/terraform-deploy.yml`)**: Triggered on push/PR or via `workflow_dispatch` with environment selection.

---

## 🛠️ Prerequisites

- **Terraform** >= 1.3.0
- **Azure CLI** installed and authenticated (`az login`)
- Azure Subscription with permissions for Resource Group creation, Virtual Network management, Virtual Machine creation, and Role Assignments (`User Access Administrator` or `Owner`).
- Entra ID permissions (`User.ReadWrite.All` or `Global Administrator` / `User Administrator`) to create Azure AD users via Terraform.

---

## 🚀 Local Deployment Instructions

### 1. DEV Environment Deployment

```bash
cd environments/dev

# Initialize Terraform modules and providers
terraform init

# Validate configuration
terraform validate

# Review execution plan
terraform plan -var-file="terraform.tfvars"

# Apply changes
terraform apply -var-file="terraform.tfvars"
```

### 2. PROD Environment Deployment

```bash
cd environments/prod

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Review execution plan
terraform plan -var-file="terraform.tfvars"

# Apply changes
terraform apply -var-file="terraform.tfvars"
```

---

## ⚙️ CI/CD Setup

### Azure DevOps (ADO) Pipeline Setup

1. Go to your Azure DevOps Project -> **Pipelines** -> **New Pipeline**.
2. Select **GitHub** or **Azure Repos Git** and select `AVD_Module_based_Infra_Build`.
3. Choose **Existing Azure Pipelines YAML file** and select `azure-pipelines.yml`.
4. Create an Azure Resource Manager **Service Connection** (ARM) in ADO named `azure-spn-avd-connection` (or update `AZURE_SERVICE_CONNECTION` in `azure-pipelines.yml`).
5. Run the pipeline!

### GitHub Actions Workflow Setup

1. In your GitHub Repository (`sam6shk/AVD_Module_based_Infra_Build`), navigate to **Settings** -> **Secrets and variables** -> **Actions**.
2. Add the following repository secrets:
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`
3. Trigger the workflow from the **Actions** tab using **Run workflow**.

---

## 🔐 Security Considerations

- Passwords and registration tokens are marked `sensitive = true` in Terraform outputs.
- Backend remote state files should be stored in encrypted Azure Storage Accounts with blob versioning enabled (`backend.tf`).
- Session hosts use native **Entra ID Join** (`AADLoginForWindows`) without requiring legacy Active Directory Domain Services (AD DS).
