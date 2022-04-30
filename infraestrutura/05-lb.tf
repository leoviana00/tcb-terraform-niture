# ------------------------------------------------
#           LOADBALANCER PÚBLICO
#-------------------------------------------------
resource "oci_load_balancer" "lb-webserver" {
  shape = var.lb_shape

  # dynamic "shape_details" {
  #   for_each = local.is_flexible_lb_shape ? [1] : []
  #   content {
  #     minimum_bandwidth_in_mbps = var.flex_lb_min_shape
  #     maximum_bandwidth_in_mbps = var.flex_lb_max_shape
  #   }
  # }
  shape_details {
    #Required
    maximum_bandwidth_in_mbps = var.flex_lb_max_shape
    minimum_bandwidth_in_mbps = var.flex_lb_min_shape
  }

  compartment_id = var.compartment_ocid
  subnet_ids = [
    oci_core_subnet.tcb_subnet.id
  ]
  display_name = "LoadBalancer"
}

# ------------------------------------------------
#           LOADBALANCER LISTENER
#-------------------------------------------------
resource "oci_load_balancer_listener" "LoadBalancerListener" {
  load_balancer_id         = oci_load_balancer.lb-webserver.id
  name                     = "LoadBalancerListener"
  default_backend_set_name = oci_load_balancer_backendset.LoadBalancerBackendset.name
  port                     = 80
  protocol                 = "HTTP"
}

# ------------------------------------------------
#          LOADBALANCER BACKENDSET
#-------------------------------------------------
resource "oci_load_balancer_backendset" "LoadBalancerBackendset" {
  name             = "LBBackendset"
  load_balancer_id = oci_load_balancer.lb-webserver.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "80"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/"
  }
}

# ------------------------------------------------
#        LOADBALANCER BACKEND WEBSERVER1
#-------------------------------------------------
resource "oci_load_balancer_backend" "LoadBalancerBackend" {
  load_balancer_id = oci_load_balancer.lb-webserver.id
  backendset_name  = oci_load_balancer_backendset.LoadBalancerBackendset.name
  ip_address       = oci_core_instance.webserver1.private_ip
  port             = 80
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

# ------------------------------------------------
#         LOADBALANCER BACKEND WEBSERVER2
#-------------------------------------------------
resource "oci_load_balancer_backend" "LoadBalancerBackend2" {
  load_balancer_id = oci_load_balancer.lb-webserver.id
  backendset_name  = oci_load_balancer_backendset.LoadBalancerBackendset.name
  ip_address       = oci_core_instance.webserver2.private_ip
  port             = 80
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}