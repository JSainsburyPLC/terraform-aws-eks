data "aws_iam_policy_document" "cluster_assume_role_policy" {
  statement {
    sid = "EKSClusterAssumeRole"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

locals {
  kubeconfig = var.create_eks ? templatefile("${path.module}/templates/kubeconfig.tpl",
    {
      kubeconfig_name     = local.kubeconfig_name,
      endpoint            = aws_eks_cluster.this[0].endpoint,
      cluster_auth_base64 = aws_eks_cluster.this[0].certificate_authority[0].data,
      region              = var.region,
      cluster_name        = var.cluster_name,
  }) : ""
}

data "aws_iam_role" "custom_cluster_iam_role" {
  count = var.manage_cluster_iam_resources ? 0 : 1
  name  = var.cluster_iam_role_name
}
