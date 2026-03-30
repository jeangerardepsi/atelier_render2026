terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "1.1.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

variable "render_api_key" { type = string }
variable "render_owner_id" { type = string }

resource "render_web_service" "flask_app" {
  name        = "flask-render-elvivas-2026" # Change le nom ici pour être sûr qu'il soit unique !
  plan        = "free"
  region      = "oregon"
  runtime     = "docker"
  repo_url    = "https://github.com/jeangerardepsi/atelier_render2026" 
}
