module "grafana_cloud" {
  source = "github.com/proffalken/terraform-grafana-oteldemostack"

  grafana_cloud_api_key = var.grafana_cloud_api_key
  grafana_stack_name    = "oteldemostack"
  grafana_region        = "eu"
}

module "heroku_backstage" {
  source = "github.com/proffalken/terraform-heroku-oteldemostack-backstage"

  heroku_account_email     = var.heroku_account_email
  heroku_api_key           = var.heroku_api_key
  backstage_version_number = var.backstage_version_number
  backstage_app_name       = "demoapp"
  backstage_region         = "eu"
  prometheus_uri           = module.grafana_cloud.prometheus_remote_endpoint
  prometheus_user          = module.grafana_cloud.prometheus_user_id
}
