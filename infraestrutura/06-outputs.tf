# LoadBalancer Public IP
# ------------------------------------------------
#            LOADBALANCER - IP PÚBLICO
#-------------------------------------------------
output "LoadBalancer_Public_IP" {
  value = [oci_load_balancer.lb-webserver.ip_addresses]
}