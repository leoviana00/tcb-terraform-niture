# ------------------------------------------------
#                    ACESSO
#-------------------------------------------------
variable "compartment_ocid" {}
variable "region" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key" {}
variable "ssh_public_key" {}

# ------------------------------------------------
#                      REGIÃO
#-------------------------------------------------
variable "ad_region_mapping" {
  type = map(string)

  default = {
    us-phoenix-1  = 3
    us-ashburn-1  = 2
    sa-saopaulo-1 = 1
  }
}

# ------------------------------------------------
#           IMAGENS PARA A INSTÂNCIA
#-------------------------------------------------
variable "images" {
  type = map(string)

  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    # Oracle-provided image "Oracle-Linux-7.9-2020.10.26-0"
    us-phoenix-1  = "ocid1.image.oc1.phx.aaaaaaaacirjuulpw2vbdiogz3jtcw3cdd3u5iuangemxq5f5ajfox3aplxa"
    us-ashburn-1  = "ocid1.image.oc1.iad.aaaaaaaabbg2rypwy5pwnzinrutzjbrs3r35vqzwhfjui7yibmydzl7qgn6a"
    sa-saopaulo-1 = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaudio63gdicxwujhfok7jdyewf6iwl6sgcaqlyk4fvttg3bw6gbpq"
  }
}

# ------------------------------------------------
#    SCRIPT PARA PREPARAÇÃO E DEPLOY WEBSERVER
#-------------------------------------------------
variable "BootStrapFile" {
  default = "../scripts/setup.sh"
}

# ------------------------------------------------
#           LOADBALANCER
#-------------------------------------------------
variable "lb_shape" {
  default = "flexible"
}

variable "flex_lb_min_shape" {
  default = 10
}

variable "flex_lb_max_shape" {
  default = 100
}

# ------------------------------------------------
#               NETWORKING
#-------------------------------------------------
variable "service_ports" {
  default = [80, 22]
}