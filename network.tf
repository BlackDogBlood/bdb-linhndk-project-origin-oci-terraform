resource "oci_core_vcn" "po_vcn" {
  compartment_id = var.tenancy_ocid
  cidr_blocks    = var.vcn_cidr_blocks
  display_name   = "po-vcn"
}