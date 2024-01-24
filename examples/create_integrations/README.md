# Example Usage of puzl.cloud module for GitLab Integration

## Usage

### Apply

1. Create credetials on https://console.puzl.cloud.
2. Update the `main.tf` file with your specific details, such as the GitLab URL and desired namespace.
3. Set `KUBE_HOST` and `KUBE_TOKEN` enviroment varibale.
4. Initialize the Terraform environment:

```bash
terraform init
terraform plan
```

5. Apply the Terraform configuration:

```bash
terraform apply
```

## Cleanup

To remove the deployed resources, run:

```bash
terraform destroy
```
