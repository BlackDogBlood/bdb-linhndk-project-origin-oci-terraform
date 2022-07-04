resource "oci_core_instance" "po_controller" {
  availability_domain = data.oci_identity_availability_domain.oci_ad.name
  compartment_id      = var.tenancy_ocid
  shape               = var.oci_amd64_shape
  display_name        = "po_controller"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.po_subnet.id
  }

  source_details {
    source_id   = var.oci_ubuntu_amd64_image
    source_type = "image"
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  metadata = {
    ssh_authorized_keys = file("./ssh/oci_rsa.pub")
  }
}

resource "oci_core_instance" "po_spare" {
  availability_domain = data.oci_identity_availability_domain.oci_ad.name
  compartment_id      = var.tenancy_ocid
  shape               = var.oci_amd64_shape
  display_name        = "po_spare"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.po_subnet.id
  }

  source_details {
    source_id   = var.oci_ubuntu_amd64_image
    source_type = "image"
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  metadata = {
    ssh_authorized_keys = file("./ssh/oci_rsa.pub")
  }
}

resource "oci_core_instance" "po_k3s_master" {
  availability_domain = data.oci_identity_availability_domain.oci_ad.name
  compartment_id      = var.tenancy_ocid
  shape               = var.oci_arm64_shape
  display_name        = "po_master"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.po_subnet.id
  }

  source_details {
    source_id   = var.oci_ubuntu_arm64_image
    source_type = "image"
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 6
  }

  metadata = {
    ssh_authorized_keys = file("./ssh/oci_rsa.pub")
  }
}

resource "oci_core_instance" "po_k3s_worker" {
  availability_domain = data.oci_identity_availability_domain.oci_ad.name
  compartment_id      = var.tenancy_ocid
  shape               = var.oci_arm64_shape
  display_name        = "po_worker"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.po_subnet.id
  }

  source_details {
    source_id   = var.oci_ubuntu_arm64_image
    source_type = "image"
  }

  shape_config {
    ocpus         = 3
    memory_in_gbs = 18
  }

  metadata = {
    ssh_authorized_keys = file("./ssh/oci_rsa.pub")
  }
}