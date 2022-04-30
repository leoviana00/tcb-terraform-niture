# ------------------------------------------------
#                  PROVIDER
#-------------------------------------------------

terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

terraform {
  backend "http" {

  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}
