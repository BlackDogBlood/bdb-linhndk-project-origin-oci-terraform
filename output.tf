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

output "po_k3s_master_1_public_ip" {
  value = oci_core_instance.po_k3s_master_1.public_ip
}

output "po_k3s_master_2_public_ip" {
  value = oci_core_instance.po_k3s_master_2.public_ip
}

output "po_k3s_worker_1_public_ip" {
  value = oci_core_instance.po_k3s_worker_1.public_ip
}

output "po_k3s_worker_2_public_ip" {
  value = oci_core_instance.po_k3s_worker_2.public_ip
}