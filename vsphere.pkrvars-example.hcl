##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username                = "administrator@vsphere.local"
vcenter_password                = "VMware123!"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "172.16.10.50"
vcenter_datacenter              = "Physical-Datacenter"
vcenter_host                    = "192.168.1.51"
vcenter_datastore               = "NVMe"
vcenter_network                 = "Home Network"
vcenter_folder                  = "Templates"

# ISO Objects
iso_path                        = "[NVMe] /packer_cache/ubuntu-22.04.4-live-server-amd64.iso"
