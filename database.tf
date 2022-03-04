## Copyright (c) 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "oci-adb" {
  source                                = "github.com/oracle-devrel/terraform-oci-arch-adb"
  adb_password                          = var.autonomous_database_admin_password
  compartment_ocid                      = var.compartment_ocid
  adb_database_cpu_core_count           = var.autonomous_database_cpu_core_count
  adb_database_data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  adb_database_db_name                  = var.autonomous_database_db_name
  adb_database_display_name             = var.autonomous_database_display_name
  adb_database_license_model            = var.autonomous_database_license_model
  adb_database_db_workload              = var.autonomous_database_db_workload
  adb_private_endpoint                  = false
  adb_free_tier                         = false
  defined_tags                          = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}
