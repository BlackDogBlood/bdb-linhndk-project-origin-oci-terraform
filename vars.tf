variable "TENANCY_OCID" {}
variable "USER_OCID" {}
variable "FINGERPRINT" {}
variable "PRIVATE_KEY_PATH" {
  default = "./keys/oci.pem"
}
variable "REGION" {
  default = "ap-singapore-1"
}
variable "OCI_UBUNTU_ARM64_IMAGE" {}
variable "OCI_UBUNTU_AMD64_IMAGE" {}