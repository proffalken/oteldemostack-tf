terraform {
  cloud {
    organization = "doics"

    workspaces {
      name = "oteldemostack"
    }
  }
}
