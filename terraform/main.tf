module "grafana_cloud" {
  source = "github.com/proffalkens-demo-stack/terraform-grafana-oteldemostack"

  grafana_cloud_api_key = var.grafana_cloud_api_key
  grafana_stack_name    = "oteldemostack"
  grafana_region        = "eu"
}

module "heroku_backstage" {
  source = "github.com/proffalkens-demo-stack/terraform-heroku-oteldemostack-backstage"

  heroku_account_email     = var.heroku_account_email
  heroku_api_key           = var.heroku_api_key
  backstage_version_number = var.backstage_version_number
  backstage_app_name       = "backstage-otel-demo"
  backstage_region         = "eu"
  prometheus_uri           = "prometheus-prod-01-eu-west-0.grafana.net/api/prom"
  prometheus_user          = module.grafana_cloud.prometheus_user_id
  prometheus_viewer_token  = module.grafana_cloud.admin_api_key
  github_client_id         = var.github_client_id
  github_client_secret     = var.github_client_secret
  github_pat               = var.github_pat
  github_discovery_target  = var.github_discovery_target
}

module "google_cloud" {
  source = "github.com/proffalkens-demo-stack/terraform-google-oteldemostack"
}
