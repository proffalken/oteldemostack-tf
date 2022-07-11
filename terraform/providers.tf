terraform {
  cloud {
    organization = "doics"

    workspaces {
      name = "oteldemostack"
    }
  }
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.24.0"
    }
  }
}

provider "grafana" {
  alias         = "cloud"
  cloud_api_key = var.grafana_cloud_api_key
}
