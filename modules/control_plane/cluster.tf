resource "aws_cloudwatch_log_group" "this" {
  count             = length(var.cluster_enabled_log_types) > 0 && var.create_eks ? 1 : 0
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = var.cluster_log_retention_in_days
  log_group_class   = var.cluster_log_group_class
  kms_key_id        = var.cluster_log_kms_key_id
  tags              = var.tags
}

resource "aws_eks_cluster" "this" {
  count                     = var.create_eks ? 1 : 0
  name                      = var.cluster_name
  enabled_cluster_log_types = var.cluster_enabled_log_types
  role_arn                  = local.cluster_iam_role_arn
  version                   = var.cluster_version
  tags                      = var.tags

  vpc_config {
    security_group_ids      = [local.cluster_security_group_id]
    subnet_ids              = var.subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  dynamic encryption_config {
    for_each = toset(var.cluster_encryption_key_arn != "" ? ["encryption_enabled"] : [])

    content {
      provider {
        key_arn = var.cluster_encryption_key_arn
      }
      resources = var.cluster_encryption_resources
    }
  }

  timeouts {
    create = var.cluster_create_timeout
    delete = var.cluster_delete_timeout
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy,
    aws_cloudwatch_log_group.this
  ]
}

resource "aws_security_group" "cluster" {
  count       = var.cluster_create_security_group && var.create_eks ? 1 : 0
  name_prefix = var.cluster_name
  description = "EKS cluster security group."
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-eks_cluster_sg"
    },
  )
}

resource "aws_security_group_rule" "cluster_egress_internet" {
  count             = var.cluster_create_security_group && var.create_eks ? 1 : 0
  description       = "Allow cluster egress access to the Internet."
  protocol          = "-1"
  security_group_id = local.cluster_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

resource "aws_iam_role" "cluster" {
  count                 = var.manage_cluster_iam_resources && var.create_eks ? 1 : 0
  name_prefix           = var.cluster_name
  assume_role_policy    = data.aws_iam_policy_document.cluster_assume_role_policy.json
  permissions_boundary  = var.permissions_boundary
  path                  = var.iam_path
  force_detach_policies = true
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  count      = var.manage_cluster_iam_resources && var.create_eks ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = local.cluster_iam_role_name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  count      = var.manage_cluster_iam_resources && var.create_eks ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = local.cluster_iam_role_name
}
