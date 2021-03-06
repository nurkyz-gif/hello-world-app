module "helm_deploy" {
  source                    = "fuchicorp/chart/helm"
  deployment_name           = "${var.deployment_name}"
  deployment_environment    = "${var.deployment_environment}"
  deployment_endpoint       = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
  deployment_path           = "hello-world"     
  template_custom_vars = {
    deployment_image        = "${var.deployment_image}"
  }          
}

variable "deployment_name" {
    default = "dev"
    description = "- (Optional) The name of the deployment."
}

variable "deployment_environment" {
    default = "prod"
    description = "- (Optional) The namespace to deploy the helm chart."
}


variable "deployment_endpoint" {
    type = "map"

    default = {
        dev     = "dev.hello"
        qa      = "qa.hello"
        prod    = "hello"
        stage   = "stage.hello"
    }
    description = "- (Optional) The endpooint of the deployment."
}

variable "google_domain_name" {
  default = "nurkyz.com"
}

variable "deployment_image" {
    default = "docker.nurkyz.com/hello-world-stage:4a48f6c"
    description = "- (Optional) The docker image of the deployment."
}