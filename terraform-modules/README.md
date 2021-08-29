# This repository creates a Terraform modules

## 1 - Create an account in the Microsoft Azure 

## 2 - Install the Terraform

* 2.1 - Open the URL: https://www.terraform.io/downloads.html and get the latest terraform version of your Operational System.

* 2.2 - Extract the terraform binary in your path
     ``` 
        sudo unzip -d /usr/local/bin terraform_1.0.5_linux_amd64.zip        
     ```
* 2.3 - Test the Terraform installation with this command and the output is like that:
     ```
        terraform version
           Terraform v1.0.5
           on linux_amd64
     ```
* 2.4 - Install the Azure CLI, I use this URL: https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli-linux?pivots=apt

     ```
        curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
     ``` 
* 2.5 - Testing the Azure Cli Installation and the output is like that:

    ```
       az version
       {
         "azure-cli": "2.27.2",
         "azure-cli-core": "2.27.2",
         "azure-cli-telemetry": "1.0.6",
         "extensions": {}
       }
     ```
* 2.6 - Login in the Azure CLI
   ```
       az login
   ``` 
     *Obs.: This command will open a Web page to you login in your azure account and after this, the page instruct you to come back to your terminal with this message:

     **You have logged in. Now let us find all the subscriptions to which you have access...**

* 2.7 - Verify the default Azure subscription with this command, and the return is like that:
    ```
      az account show

      {
          "environmentName": "AzureCloud",
          "homeTenantId": "00000000-0000-0000-0000-000000000",
          "id": "00000000-0000-0000-0000-000000000",
          "isDefault": true,
          "managedByTenants": [],
          "name": "subscription-free",
          "state": "Enabled",
          "tenantId": "00000000-0000-0000-0000-000000000",
            "user": {
               "name": "user@provider.com",
               "type": "user"
            }
      }

    ```
   **Note: You need the "user" value to the next command**

* 2.8 - Get the subscription ID with the command bellow, replace the value of **microsoft_account_email** with the value that you got in the step before

   ```
    az account list --query "[?user.name=='<microsoft_account_email>'].{Name:name, ID:id, Default:isDefault}" --output Table
   ```
   *Obs.: The Output is like bellow

   ```
        Name               ID                                    Default
     -----------------  ------------------------------------  ---------
     subscription-free  00000000-0000-0000-0000-000000000000  True

   ```
* 2.9 - Create a service principal, to use to runs the terraform
    - 2.9.1 - You need export the variable that the azure uses like this:
       ```
         export MSYS_NO_PATHCONV=1   
       ```
    - 2.9.2 - Create a service principal with the command bellow, replace the **service_principal_name** with the name that you want to create:

       ```
         az ad sp create-for-rbac --name <service_principal_name>
       ```
       *Note: You Need annotate the **appId**, the **password** and **tenant** values to use in the next command

* 2.10 - Export the variables that you need to runs the terraform in the Azure

     ```
        export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
        export ARM_TENANT_ID="<azure_subscription_tenant_id>"
        export ARM_CLIENT_ID="<service_principal_appid>"
        export ARM_CLIENT_SECRET="<service_principal_password>"
     ```
    * Note: In the **ARM_SUBSCRIPTION_ID** you need to put the value got in the 2.8 step in the ID value.
    * Note: In the **ARM_TENANT_ID** you need to put the **tenant** value that you got in the 2.9.2 step.
    * Note: In the **ARM_CLIENT_ID** you need to put the **appId** value that you got in the 2.9.2 step.
    * Note: In the **ARM_CLIENT_SECRET** you need to put the **password** value that you got in the 2.9.2 step.

* 2.11 - Put the values inside the **create_aks_app.tf**, changing it with your own values

* 2.12 - You need to initiate the terraform with the **terraform init** command
    ```
       terraform init
          Initializing modules...
          
          Initializing the backend...
          
          Initializing provider plugins...
          - Reusing previous version of hashicorp/kubernetes from the dependency lock file
          - Reusing previous version of hashicorp/azurerm from the dependency lock file
          - Using previously-installed hashicorp/kubernetes v2.4.1
          - Using previously-installed hashicorp/azurerm v2.46.0
          
          Terraform has been successfully initialized!
          
          You may now begin working with Terraform. Try running "terraform plan" to see
          any changes that are required for your infrastructure. All Terraform commands
          should now work.
          
          If you ever set or change modules or backend configuration for Terraform,
          rerun this command to reinitialize your working directory. If you forget, other
          commands will detect it and remind you to do so if necessary.
     ```

 
* 2.13 - Now you can runs the Terraform Plan to see all the resources that you will create

    ```
    terraform plan

        Terraform used the selected providers to generate the following execution
        plan. Resource actions are indicated with the following symbols:
          + create
        
        Terraform will perform the following actions:
        
          # module.create_aks.azurerm_kubernetes_cluster.aks_cluster will be created
          + resource "azurerm_kubernetes_cluster" "aks_cluster" {
              + dns_prefix              = "aks"
              + fqdn                    = (known after apply)
              + id                      = (known after apply)
              + kube_admin_config       = (known after apply)
              + kube_admin_config_raw   = (sensitive value)
              + kube_config             = (known after apply)
              + kube_config_raw         = (sensitive value)
              + kubelet_identity        = (known after apply)
              + kubernetes_version      = (known after apply)
              + location                = "eastus"
              + name                    = "aks"
              + node_resource_group     = (known after apply)
              + private_cluster_enabled = (known after apply)
              + private_fqdn            = (known after apply)
              + private_link_enabled    = (known after apply)
              + resource_group_name     = "resource_group_test"
              + sku_tier                = "Free"
        
              + addon_profile {
     ```
* 2.14 - Runs the terraform apply to create all resources. (--auto-approve is used to apply without confirmation)

   ```
     terraform apply --auto-approve
   ```



* 2.15 - After you finish deploy application on the cluster, you need to get the **resource_group_name** value in the **create_aks_app** and use to include in the command bellow to configure your kubectl:

   ```
     az aks get-credentials --resource-group <resource_group_name> --name aks --admin
   
   ```
* 2.16 - Try to get the Kubernetes Objects with kubectl
   ```
     kubectl get nodes

   ``` 
* 2.17 - If you want to destroy, just runs the **terraform destroy** command (This command supported --auto-approve flag also)

  ```
    terraform destroy 
  ```
