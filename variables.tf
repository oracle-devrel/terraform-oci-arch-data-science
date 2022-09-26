## Copyright (c) 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Variables
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "availability_domain_name" {
  default = ""
}

variable "availability_domain_number" {
  default = 0
}

variable "ssh_public_key" {
  default = ""
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.3"
}

# OS Images
variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "9"
}

variable "instance_shape" {
  default     = "VM.Standard.E4.Flex"
}

variable "instance_shape_flex_ocpus" {
    default = 1
}

variable "instance_shape_flex_memory" {
    default = 10
}

variable "autonomous_database_cpu_core_count" {
  default = "4"
}
variable "autonomous_database_admin_password" {
}

variable "autonomous_database_db_name" {
  default = "aTFdb"
}

variable "autonomous_database_display_name" {
  default = "My ATP DB"
}

variable "autonomous_database_is_auto_scaling_enabled" {
  default = "false"
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = "1"
}

variable "autonomous_database_db_workload" {
  default = "DW"
}

variable "autonomous_database_license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "autonomous_database_data_safe_status" {
  default = "NOT_REGISTERED"
}

variable "analytics_instance_capacity_capacity_type" {
  default = "OLPU_COUNT"
}

variable "analytics_instance_capacity_capacity_value" {
  default = 1
}

variable "analytics_instance_feature_set" {
  default = "ENTERPRISE_ANALYTICS"
}

variable "analytics_instance_license_type" {
  default = "LICENSE_INCLUDED"
}

variable "analytics_instance_name" {
  default = "OAC"
}

variable "analytics_instance_idcs_access_token" {}

variable "vcn_cidr" { 
  default = "10.0.0.0/16" 
}

variable "subnet_cidr" { 
  default = "10.0.0.0/24"
}

variable "catalog_display_name" {
  default = "test_catalog_instance"
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}

locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
  availability_domain_name = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain_number], "name") : var.availability_domain_name
}


