# eks `worker_groups` submodule

This submodule is designed for use by both the parent `eks` module and by the user.

> :warning: **Launch Configuration driven worker groups have been superceded by Launch Template driven worker groups**

`worker_groups` is a map of maps. Key of first level will be used as unique value for `for_each` resources and in the `aws_autoscaling_group` and `aws_launch_template` name. Inner map can take the below values.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.52.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.52.0 |
| <a name="provider_template"></a> [template](#provider\_template) | >= 2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.worker_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.worker_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.worker_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.workers_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.workers_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.workers_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.workers_additional_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.worker_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.worker_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_https_workers_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.workers_egress_internet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.workers_ingress_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.workers_ingress_cluster_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.workers_ingress_cluster_kubelet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.workers_ingress_self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ami.eks_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.eks_worker_windows](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_instance_profile.custom_worker_group_launch_template_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_instance_profile) | data source |
| [aws_iam_policy_document.workers_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [template_file.launch_template_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_worker_cni_policy"></a> [attach\_worker\_cni\_policy](#input\_attach\_worker\_cni\_policy) | Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker groups IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-worker` DaemonSet pods via another method or workers will not be able to join the cluster. | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the parent EKS cluster. | `string` | n/a | yes |
| <a name="input_cluster_security_group_id"></a> [cluster\_security\_group\_id](#input\_cluster\_security\_group\_id) | If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers | `string` | n/a | yes |
| <a name="input_create_eks"></a> [create\_eks](#input\_create\_eks) | Controls if EKS resources should be created (it affects almost all resources). | `bool` | `true` | no |
| <a name="input_iam_path"></a> [iam\_path](#input\_iam\_path) | If provided, all IAM roles will be created on this path. | `string` | `"/"` | no |
| <a name="input_manage_worker_iam_resources"></a> [manage\_worker\_iam\_resources](#input\_manage\_worker\_iam\_resources) | Whether to let the module manage worker IAM resources. If set to false, iam\_instance\_profile\_name must be specified for workers. | `bool` | `true` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | If provided, all IAM roles will be created with this permissions boundary attached. | `string` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnets to place the EKS cluster and workers within. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where the cluster and workers will be deployed. | `string` | n/a | yes |
| <a name="input_worker_additional_security_group_ids"></a> [worker\_additional\_security\_group\_ids](#input\_worker\_additional\_security\_group\_ids) | A list of additional security group ids to attach to worker instances | `list(string)` | `[]` | no |
| <a name="input_worker_ami_name_filter"></a> [worker\_ami\_name\_filter](#input\_worker\_ami\_name\_filter) | Name filter for AWS EKS worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used. | `string` | `""` | no |
| <a name="input_worker_ami_name_filter_windows"></a> [worker\_ami\_name\_filter\_windows](#input\_worker\_ami\_name\_filter\_windows) | Name filter for AWS EKS Windows worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used. | `string` | `""` | no |
| <a name="input_worker_ami_owner_id"></a> [worker\_ami\_owner\_id](#input\_worker\_ami\_owner\_id) | The ID of the owner for the AMI to use for the AWS EKS workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft'). | `string` | `"602401143452"` | no |
| <a name="input_worker_ami_owner_id_windows"></a> [worker\_ami\_owner\_id\_windows](#input\_worker\_ami\_owner\_id\_windows) | The ID of the owner for the AMI to use for the AWS EKS Windows workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft'). | `string` | `"801119661308"` | no |
| <a name="input_worker_create_initial_lifecycle_hooks"></a> [worker\_create\_initial\_lifecycle\_hooks](#input\_worker\_create\_initial\_lifecycle\_hooks) | Whether to create initial lifecycle hooks provided in worker groups. | `bool` | `false` | no |
| <a name="input_worker_create_security_group"></a> [worker\_create\_security\_group](#input\_worker\_create\_security\_group) | Whether to create a security group for the workers or attach the workers to `worker_security_group_id`. | `bool` | `true` | no |
| <a name="input_worker_groups"></a> [worker\_groups](#input\_worker\_groups) | Map of map of worker groups to create. See documentation above for more details. | `any` | `{}` | no |
| <a name="input_worker_groups_additional_policies"></a> [worker\_groups\_additional\_policies](#input\_worker\_groups\_additional\_policies) | Additional policies to be added to worker groups. | `list(string)` | `[]` | no |
| <a name="input_worker_groups_defaults"></a> [worker\_groups\_defaults](#input\_worker\_groups\_defaults) | Map of values to be applied to all worker groups. See documentation above for more details. | `any` | `{}` | no |
| <a name="input_worker_groups_role_name"></a> [worker\_groups\_role\_name](#input\_worker\_groups\_role\_name) | User defined worker groups role name. | `string` | `""` | no |
| <a name="input_worker_security_group_id"></a> [worker\_security\_group\_id](#input\_worker\_security\_group\_id) | If provided, all workers will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the EKS cluster. | `string` | `""` | no |
| <a name="input_worker_sg_ingress_from_port"></a> [worker\_sg\_ingress\_from\_port](#input\_worker\_sg\_ingress\_from\_port) | Minimum port number from which pods will accept communication. Must be changed to a lower value if some pods in your cluster will expose a port lower than 1025 (e.g. 22, 80, or 443). | `number` | `1025` | no |
| <a name="input_workers_additional_policies"></a> [workers\_additional\_policies](#input\_workers\_additional\_policies) | Additional policies to be added to workers | `list(string)` | `[]` | no |
| <a name="input_workers_role_name"></a> [workers\_role\_name](#input\_workers\_role\_name) | User defined workers role name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_auth_roles"></a> [aws\_auth\_roles](#output\_aws\_auth\_roles) | Roles for use in aws-auth ConfigMap |
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
