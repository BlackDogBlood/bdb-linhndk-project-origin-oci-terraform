variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {
  default = "./keys/oci.pem"
}
variable "region" {
  default = "ap-singapore-1"
}
variable "oci_ubuntu_arm64_image" {
  default = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa2ff4yyggrk6coocm546r5tluzmqkf5bjndrkyhtiogd7dc6nzc4a"
}
variable "oci_ubuntu_amd64_image" {
  default = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa5fiuyidchi6v3qmdlmu7qmbgug6d22gvlzmroic3s3d5dqxr76ea"
}
variable "vcn_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_cidr_blocks" {
  default = "10.0.1.0/24"
}