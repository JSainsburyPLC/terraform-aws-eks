# terraform-aws-eks

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-green.svg)](https://conventionalcommits.org)

This is a complete rework of the upstream community EKS module: https://github.com/terraform-aws-modules/terraform-aws-eks

> :warning: **Only `Terraform >= 0.12` will be supported. Based on `v9.0.x` of the upstream module.**

The interface to the module is ~the same~ similar, but it attempts to be more flexible
by allowing users to create and use components separately by splitting out
sub-modules for:
- EKS Control Plane
- EKS Worker Groups
- EKS Managed Node Groups
- `aws-auth` Configuration

The submodules are designed to be used as individual modules to help the user
perform actions in between creating the control plane and creating workers and nodes
(Custom CNI Configuration).

By breaking out separate sub modules we create a clearer separation of concerns and
reduce tight coupling of control plane and worker nodes whilst maintaining the same
interface for seamless migration to this module. The interface has become an example
implementation of the sub-modules.

## :rotating_light: Major Changes
There are some core implementation changes from the original `eks` module:

1. Launch Configuration support removed in favour of Launch Template driven
   `worker_groups` sub-module. They're doing the same things with no benefit to
   supporting both LC's and LT's (to my current knowledge). `worker_groups_launch_template` has been dropped
   and `worker_groups` now creates LT's.

2. Simplified code through merging defaults. A pattern I saw in the `node_groups`
   sub-module which I really liked. Merging the defaults local, defaults variable and
   and map values:
   ```
   # Merge defaults and per-group values to make code cleaner
   worker_groups_expanded = { for k, v in var.worker_groups : k => merge(
     local.worker_groups_defaults,
     var.worker_groups_defaults,
     v,
   ) if var.create_eks }
   ```

   It means that code moves from this:
   ```
   enabled_metrics = lookup(
     var.worker_groups[count.index],
     "enabled_metrics",
     local.workers_group_defaults["enabled_metrics"]
   )
   ```

   To this:
   ```
   enabled_metrics = each.value["enabled_metrics"]
   ```
3. Enabling a map of maps for `worker_groups`. By passing in a map of maps we can
   add and remove `worker_groups` without affecting the existing resources.
   A list of maps still works with all of the issues when removing objects from the list.

   With the sub-module approach, there's nothing stopping a user from using a module
   instance per worker_group further isolating the data structures in the state file.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.52.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 1.6.2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_auth"></a> [aws\_auth](#module\_aws\_auth) | ./modules/aws_auth | n/a |
| <a name="module_control_plane"></a> [control\_plane](#module\_control\_plane) | ./modules/control_plane | n/a |
| <a name="module_node_groups"></a> [node\_groups](#module\_node\_groups) | ./modules/node_groups | n/a |
| <a name="module_worker_groups"></a> [worker\_groups](#module\_worker\_groups) | ./modules/worker_groups | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_node_cni_policy"></a> [attach\_node\_cni\_policy](#input\_attach\_node\_cni\_policy) | Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-node` DaemonSet pods via another method or nodes will not be able to join the cluster. | `bool` | `true` | no |
| <a name="input_attach_worker_cni_policy"></a> [attach\_worker\_cni\_policy](#input\_attach\_worker\_cni\_policy) | Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-node` DaemonSet pods via another method or nodes will not be able to join the cluster. | `bool` | `true` | no |
| <a name="input_cluster_create_security_group"></a> [cluster\_create\_security\_group](#input\_cluster\_create\_security\_group) | Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id`. | `bool` | `true` | no |
| <a name="input_cluster_create_timeout"></a> [cluster\_create\_timeout](#input\_cluster\_create\_timeout) | Timeout value when creating the EKS cluster. | `string` | `"30m"` | no |
| <a name="input_cluster_delete_timeout"></a> [cluster\_delete\_timeout](#input\_cluster\_delete\_timeout) | Timeout value when deleting the EKS cluster. | `string` | `"15m"` | no |
| <a name="input_cluster_enabled_log_types"></a> [cluster\_enabled\_log\_types](#input\_cluster\_enabled\_log\_types) | A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | `list(string)` | `[]` | no |
| <a name="input_cluster_encryption_key_arn"></a> [cluster\_encryption\_key\_arn](#input\_cluster\_encryption\_key\_arn) | KMS Key ARN to encrypt EKS secrets with. | `string` | `""` | no |
| <a name="input_cluster_encryption_resources"></a> [cluster\_encryption\_resources](#input\_cluster\_encryption\_resources) | A list of the EKS resources to encrypt. | `list(string)` | <pre>[<br>  "secrets"<br>]</pre> | no |
| <a name="input_cluster_endpoint_private_access"></a> [cluster\_endpoint\_private\_access](#input\_cluster\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled. | `bool` | `false` | no |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled. | `bool` | `true` | no |
| <a name="input_cluster_endpoint_public_access_cidrs"></a> [cluster\_endpoint\_public\_access\_cidrs](#input\_cluster\_endpoint\_public\_access\_cidrs) | List of CIDR blocks which can access the Amazon EKS public API server endpoint. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#input\_cluster\_iam\_role\_name) | IAM role name for the cluster. Only applicable if manage\_cluster\_iam\_resources is set to false. | `string` | `""` | no |
| <a name="input_cluster_log_group_class"></a> [cluster\_log\_group\_class](#input\_cluster\_log\_group\_class) | Specified the log class of the log group. Possible values are: STANDARD or INFREQUENT\_ACCESS | `string` | `"INFREQUENT_ACCESS"` | no |
| <a name="input_cluster_log_kms_key_id"></a> [cluster\_log\_kms\_key\_id](#input\_cluster\_log\_kms\_key\_id) | If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html) | `string` | `""` | no |
| <a name="input_cluster_log_retention_in_days"></a> [cluster\_log\_retention\_in\_days](#input\_cluster\_log\_retention\_in\_days) | Number of days to retain log events. Default retention - 90 days. | `number` | `90` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster. Also used as a prefix in names of related resources. | `string` | n/a | yes |
| <a name="input_cluster_security_group_id"></a> [cluster\_security\_group\_id](#input\_cluster\_security\_group\_id) | If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers | `string` | `""` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version to use for the EKS cluster. | `string` | `"1.15"` | no |
| <a name="input_config_output_path"></a> [config\_output\_path](#input\_config\_output\_path) | Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/`. | `string` | `"./"` | no |
| <a name="input_create_eks"></a> [create\_eks](#input\_create\_eks) | Controls if EKS resources should be created (it affects almost all resources) | `bool` | `true` | no |
| <a name="input_eks_oidc_root_ca_thumbprint"></a> [eks\_oidc\_root\_ca\_thumbprint](#input\_eks\_oidc\_root\_ca\_thumbprint) | Thumbprint of Root CA for EKS OIDC, Valid until 2037 | `string` | `"9e99a48a9960b14926bb7f3b02e22da2b0ab7280"` | no |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | Whether to create OpenID Connect Provider for EKS to enable IRSA | `bool` | `false` | no |
| <a name="input_iam_path"></a> [iam\_path](#input\_iam\_path) | If provided, all IAM roles will be created on this path. | `string` | `"/"` | no |
| <a name="input_kubeconfig_name"></a> [kubeconfig\_name](#input\_kubeconfig\_name) | Override the default name used for items kubeconfig. | `string` | `""` | no |
| <a name="input_manage_aws_auth"></a> [manage\_aws\_auth](#input\_manage\_aws\_auth) | Whether to apply the aws-auth configmap file. | `bool` | `true` | no |
| <a name="input_manage_cluster_iam_resources"></a> [manage\_cluster\_iam\_resources](#input\_manage\_cluster\_iam\_resources) | Whether to let the module manage cluster IAM resources. If set to false, cluster\_iam\_role\_name must be specified. | `bool` | `true` | no |
| <a name="input_manage_node_iam_resources"></a> [manage\_node\_iam\_resources](#input\_manage\_node\_iam\_resources) | Whether to let the module manage worker IAM resources. If set to false, iam\_instance\_profile\_name must be specified for workers. | `bool` | `true` | no |
| <a name="input_manage_worker_iam_resources"></a> [manage\_worker\_iam\_resources](#input\_manage\_worker\_iam\_resources) | Whether to let the module manage worker IAM resources. If set to false, iam\_instance\_profile\_name must be specified for workers. | `bool` | `true` | no |
| <a name="input_map_accounts"></a> [map\_accounts](#input\_map\_accounts) | Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format. | `list(string)` | `[]` | no |
| <a name="input_map_roles"></a> [map\_roles](#input\_map\_roles) | Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format. | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_map_users"></a> [map\_users](#input\_map\_users) | Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format. | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | Map of map of node groups to create. See `node_groups` module's documentation for more details | `any` | `{}` | no |
| <a name="input_node_groups_additional_policies"></a> [node\_groups\_additional\_policies](#input\_node\_groups\_additional\_policies) | Additional policies to be added to workers | `list(string)` | `[]` | no |
| <a name="input_node_groups_defaults"></a> [node\_groups\_defaults](#input\_node\_groups\_defaults) | Map of values to be applied to all node groups. See `node_groups` module's documentaton for more details | `any` | `{}` | no |
| <a name="input_node_groups_role_name"></a> [node\_groups\_role\_name](#input\_node\_groups\_role\_name) | User defined workers role name. | `string` | `""` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | If provided, all IAM roles will be created with this permissions boundary attached. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnets to place the EKS cluster and workers within. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where the cluster and workers will be deployed. | `string` | n/a | yes |
| <a name="input_wait_for_cluster_cmd"></a> [wait\_for\_cluster\_cmd](#input\_wait\_for\_cluster\_cmd) | Custom local-exec command to execute for determining if the eks cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT | `string` | `"until wget --no-check-certificate -O - -q $ENDPOINT/healthz >/dev/null; do sleep 4; done"` | no |
| <a name="input_worker_additional_security_group_ids"></a> [worker\_additional\_security\_group\_ids](#input\_worker\_additional\_security\_group\_ids) | A list of additional security group ids to attach to worker instances | `list(string)` | `[]` | no |
| <a name="input_worker_ami_name_filter"></a> [worker\_ami\_name\_filter](#input\_worker\_ami\_name\_filter) | Name filter for AWS EKS worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used. | `string` | `""` | no |
| <a name="input_worker_ami_name_filter_windows"></a> [worker\_ami\_name\_filter\_windows](#input\_worker\_ami\_name\_filter\_windows) | Name filter for AWS EKS Windows worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used. | `string` | `""` | no |
| <a name="input_worker_ami_owner_id"></a> [worker\_ami\_owner\_id](#input\_worker\_ami\_owner\_id) | The ID of the owner for the AMI to use for the AWS EKS workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft'). | `string` | `"602401143452"` | no |
| <a name="input_worker_ami_owner_id_windows"></a> [worker\_ami\_owner\_id\_windows](#input\_worker\_ami\_owner\_id\_windows) | The ID of the owner for the AMI to use for the AWS EKS Windows workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft'). | `string` | `"801119661308"` | no |
| <a name="input_worker_create_initial_lifecycle_hooks"></a> [worker\_create\_initial\_lifecycle\_hooks](#input\_worker\_create\_initial\_lifecycle\_hooks) | Whether to create initial lifecycle hooks provided in worker groups. | `bool` | `false` | no |
| <a name="input_worker_create_security_group"></a> [worker\_create\_security\_group](#input\_worker\_create\_security\_group) | Whether to create a security group for the workers or attach the workers to `worker_security_group_id`. | `bool` | `true` | no |
| <a name="input_worker_groups"></a> [worker\_groups](#input\_worker\_groups) | A list of maps defining worker group configurations to be defined using AWS Launch Configurations. See workers\_group\_defaults for valid keys. | `any` | `[]` | no |
| <a name="input_worker_groups_additional_policies"></a> [worker\_groups\_additional\_policies](#input\_worker\_groups\_additional\_policies) | Additional policies to be added to workers | `list(string)` | `[]` | no |
| <a name="input_worker_groups_defaults"></a> [worker\_groups\_defaults](#input\_worker\_groups\_defaults) | Override default values for target groups. See worker\_group\_defaults in local.tf for valid keys. | `any` | `{}` | no |
| <a name="input_worker_groups_role_name"></a> [worker\_groups\_role\_name](#input\_worker\_groups\_role\_name) | User defined workers role name. | `string` | `""` | no |
| <a name="input_worker_security_group_id"></a> [worker\_security\_group\_id](#input\_worker\_security\_group\_id) | If provided, all workers will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the EKS cluster. | `string` | `""` | no |
| <a name="input_worker_sg_ingress_from_port"></a> [worker\_sg\_ingress\_from\_port](#input\_worker\_sg\_ingress\_from\_port) | Minimum port number from which pods will accept communication. Must be changed to a lower value if some pods in your cluster will expose a port lower than 1025 (e.g. 22, 80, or 443). | `number` | `1025` | no |
| <a name="input_write_kubeconfig"></a> [write\_kubeconfig](#input\_write\_kubeconfig) | Whether to write a Kubectl config file containing the cluster configuration. Saved to `config_output_path`. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of cloudwatch log group created |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster. |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster. |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint for your EKS Kubernetes API. |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | IAM role ARN of the EKS cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The name/id of the EKS cluster. |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | The URL on the EKS cluster OIDC Issuer |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ID attached to the EKS cluster. |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The Kubernetes server version for the EKS cluster. |
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | A kubernetes configuration to authenticate to this EKS cluster. |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | kubectl config file contents for this EKS cluster. |
| <a name="output_kubeconfig_filename"></a> [kubeconfig\_filename](#output\_kubeconfig\_filename) | The filename of the generated kubectl config. |
| <a name="output_node_groups"></a> [node\_groups](#output\_node\_groups) | Outputs from EKS node groups. Map of maps, keyed by var.node\_groups keys |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true`. |
| <a name="output_worker_iam_instance_profile_arns"></a> [worker\_iam\_instance\_profile\_arns](#output\_worker\_iam\_instance\_profile\_arns) | default IAM instance profile ARN for EKS worker groups |
| <a name="output_worker_iam_instance_profile_names"></a> [worker\_iam\_instance\_profile\_names](#output\_worker\_iam\_instance\_profile\_names) | default IAM instance profile name for EKS worker groups |
| <a name="output_worker_iam_role_arn"></a> [worker\_iam\_role\_arn](#output\_worker\_iam\_role\_arn) | default IAM role ARN for EKS worker groups |
| <a name="output_worker_iam_role_name"></a> [worker\_iam\_role\_name](#output\_worker\_iam\_role\_name) | default IAM role name for EKS worker groups |
| <a name="output_worker_security_group_id"></a> [worker\_security\_group\_id](#output\_worker\_security\_group\_id) | Security group ID attached to the EKS workers. |
| <a name="output_workers_asg_arns"></a> [workers\_asg\_arns](#output\_workers\_asg\_arns) | IDs of the autoscaling groups containing workers. |
| <a name="output_workers_asg_names"></a> [workers\_asg\_names](#output\_workers\_asg\_names) | Names of the autoscaling groups containing workers. |
| <a name="output_workers_default_ami_id"></a> [workers\_default\_ami\_id](#output\_workers\_default\_ami\_id) | ID of the default worker group AMI |
| <a name="output_workers_launch_template_arns"></a> [workers\_launch\_template\_arns](#output\_workers\_launch\_template\_arns) | ARNs of the worker launch templates. |
| <a name="output_workers_launch_template_ids"></a> [workers\_launch\_template\_ids](#output\_workers\_launch\_template\_ids) | IDs of the worker launch templates. |
| <a name="output_workers_launch_template_latest_versions"></a> [workers\_launch\_template\_latest\_versions](#output\_workers\_launch\_template\_latest\_versions) | Latest versions of the worker launch templates. |
| <a name="output_workers_user_data"></a> [workers\_user\_data](#output\_workers\_user\_data) | User data of worker groups |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
