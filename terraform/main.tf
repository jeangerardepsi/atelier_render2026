terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = ">= 1.7.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

# --- DÉCLARATION DES VARIABLES ---
variable "render_api_key" { type = string }
variable "render_owner_id" { type = string }
variable "image_url" { type = string }
variable "image_tag" { type = string }
variable "github_actor" {
  description = "GitHub username"
  type        = string
}

# --- RESSOURCE ---
resource "render_web_service" "flask_app" {
  name   = "flask-render-iac-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"

  runtime_source = {
    image = {
      image_url = var.image_url
      tag       = var.image_tag
    }
  }

  # L'injection de la variable d'environnement (Exercice 2)
  env_vars = {
    ENV = {
      value = "production"
    }
  }
}
