#show ubuntu images

#data "oci_core_images" "oci_core_images_data" {
#  compartment_id = var.tenancy_ocid
#  operating_system = "Canonical Ubuntu"
#  operating_system_version = "20.04"
#  sort_by = "TIMECREATED"
#  sort_order = "DESC"
#}