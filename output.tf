#view ubuntu images

#output "oci_core_images_output" {
#  value = data.oci_core_images.oci_core_images_data
#}

#output "oci_ad" {
#  value = data.oci_identity_availability_domain.oci_ad
#}

#looking for shapes
#output "oci_shapes" {
#  value = data.oci_core_shapes.oci_shapes
#}

output "po_controller_public_ip" {
  value = oci_core_instance.po_controller.public_ip
}

output "po_spare_public_ip" {
  value = oci_core_instance.po_spare.public_ip
}

output "po_k3s_master_public_ip" {
value = oci_core_instance.po_k3s_master.public_ip
}

output "po_k3s_worker_public_ip" {
  value = oci_core_instance.po_k3s_worker.public_ip
}
