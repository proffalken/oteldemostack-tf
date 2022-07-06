module "grafana_cloud" {
  source = "github.com/proffalken/terraform-grafana-oteldemostack"

  grafana_cloud_api_key = var.grafana_cloud_api_key
  grafana_stack_name    = "oteldemostack"
  grafana_region        = "eu"
}
