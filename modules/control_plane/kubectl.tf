
resource "local_file" "kubeconfig" {
  count                = var.write_kubeconfig && var.create_eks ? 1 : 0
  content              = local.kubeconfig
  filename             = substr(var.config_output_path, -1, 1) == "/" ? "${var.config_output_path}kubeconfig_${var.cluster_name}" : var.config_output_path
  directory_permission = "0750"
  file_permission      = "0600"
}
