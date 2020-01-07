terraform {
  backend "s3" {
    bucket = "moderngreek-terraform"
    key    = "orch.moderngreek.us/orch"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "moderngreek-terraform"
    key    = "orch.moderngreek.us/orch"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
}
provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}
variable "cloudflare_email" {
  type = "string"
  default= "tech@moderngreek.us"
}
variable "cloudflare_token" {
  type = "string"
}
variable "region" {
  type    = "string"
  default = "us-east-1"
}
variable "name" {
  type    = "string"
  default = "orch"
}
variable "domain" {
  type    = "string"
  default = "moderngreek.us"
}
variable "volume_size" {
  type    = "string"
  default = "40"
}
variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}
variable "rancher_version" {
  type    = "string"
  default = "latest"
}
variable "docker_version" {
  type    = "string"
  default = "18.09.4-ce"
}
variable "ami" {
  type    = "string"
  default = "ami-0d554a1dd1d4ed527"
}
