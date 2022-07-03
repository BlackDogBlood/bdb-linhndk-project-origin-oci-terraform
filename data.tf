#show ubuntu images

#data "oci_core_images" "oci_core_images_data" {
#  compartment_id = var.tenancy_ocid
#  operating_system = "Canonical Ubuntu"
#  operating_system_version = "20.04"
#  sort_by = "TIMECREATED"
#  sort_order = "DESC"
#}

#show availability domain
#data "oci_identity_availability_domains" "oci_ads" {
#  compartment_id = var.tenancy_ocid
#}

data "oci_identity_availability_domain" "oci_ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

#looking for shapes

#data "oci_core_shapes" "oci_shapes" {
#  compartment_id = var.tenancy_ocid
#  image_id = var.oci_ubuntu_arm64_image
#  image_id = var.oci_ubuntu_amd64_image
#}