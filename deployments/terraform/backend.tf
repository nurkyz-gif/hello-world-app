terraform {
  backend "gcs" {
    bucket  = "nurkyz-fuchicorp12"
    prefix  = "qa/hello-world"
    project = "aerial-optics-307300"
  }
}
