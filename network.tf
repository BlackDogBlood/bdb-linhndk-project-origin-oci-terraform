resource "oci_core_vcn" "po_vcn" {
  compartment_id = var.tenancy_ocid
  cidr_blocks    = var.vcn_cidr_blocks
  display_name   = "po-vcn"
}

resource "oci_core_dhcp_options" "po_dhcp" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.po_vcn.id
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
  display_name   = "po_dhcp"
}

resource "oci_core_internet_gateway" "po_internet_gateway" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.po_vcn.id
  display_name   = "po-ig"
}

resource "oci_core_route_table" "po_route_table" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.po_vcn.id
  display_name   = "po-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.po_internet_gateway.id
  }
}

resource "oci_core_security_list" "po_security_list" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.po_vcn.id
  display_name   = "po-sl"


  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "allow ssh from anywhere"
    tcp_options {
      max = 22
      min = 22
      source_port_range {
        max = 22
        min = 22
      }
    }
  }

  ingress_security_rules {
    protocol = 1
    source   = "0.0.0.0/0"
    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    protocol = 1
    source   = "10.0.0.0/16"
    icmp_options {
      type = 3
    }
  }
}

resource "oci_core_subnet" "po_subnet" {
  compartment_id    = var.tenancy_ocid
  cidr_block        = var.subnet_cidr_blocks
  vcn_id            = oci_core_vcn.po_vcn.id
  display_name      = "po-subnet"
  dhcp_options_id   = oci_core_dhcp_options.po_dhcp.id
  route_table_id    = oci_core_route_table.po_route_table.id
  security_list_ids = [oci_core_security_list.po_security_list.id]
}