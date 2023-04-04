terraform {
  required_providers {
    acl = {
      source = "tsuru/acl"
      version = "0.1.1"
    }

    tsuru = {
      source = "tsuru/tsuru"
      version = "2.6.1"
    }
  }
}

provider "tsuru" {
  # Configuration options
}

resource "tsuru_app" "example" {
    name = "edg-tsuruexampleterra2-gcp-dev"
    description = "Example app to terraform tsuru integration"
    platform = "nodejs"
    team_owner = var.team_owner
    pool = var.pool_name
    plan = "c0.1m0.1"

    tags = [
        "tag-teste",
        "dev"
    ]
}

# Define env variables

resource "tsuru_app_env" "example" {
  app = tsuru_app.example.name

  environment_variables = var.public_envs
}

# Define acls

resource "tsuru_service_instance" "acl" {
  service_name = "acl"
  name         = tsuru_app.example.name
  owner        = tsuru_app.example.team_owner
  plan         = "c0.1m0.1"
}

resource "tsuru_service_instance_bind" "app-acl" {
  service_name     = tsuru_service_instance.acl.service_name
  service_instance = tsuru_service_instance.acl.name
  app              = tsuru_app.example.name
}

resource "acl_destination_rule" "test_app" {
  instance = tsuru_service_instance.acl.name

  app = "google.com"
}

# Define service instance
resource "tsuru_service_instance" "testetf_dbaas_service" {
  service_name = var.service_name
  name         = var.instance_name
  owner        = tsuru_app.example.team_owner
  description  = "Dbaas service"
  plan         = "mongodb-standalone-4-2-dev-gcp-tsuru-us-east1-dev-gcp-tsuru-us-east1"
  tags         = ["tag_a", "tag_b"]
  parameters = {
    "value"      = "10"
    "otherValue" = "false"
  }
  wait_for_up_status = true
}

resource "tsuru_service_instance_bind" "instance_bind" {
  service_name      = tsuru_service_instance.testetf_dbaas_service.service_name
  service_instance  = tsuru_service_instance.testetf_dbaas_service.name
  app               = tsuru_app.example.name
  restart_on_update = true
}