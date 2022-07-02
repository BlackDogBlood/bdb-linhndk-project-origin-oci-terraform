resource "oci_core_vcn" "po_vcn" {
  compartment_id = var.TENANCY_OCID
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "po-vcn"
}