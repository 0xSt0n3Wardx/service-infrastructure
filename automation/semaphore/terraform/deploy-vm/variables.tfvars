# Le fichier terraform.tfvars pour les variables secrètes qui ne sera pas stocké dans votre repository git
pmx_api_url        = "https://192.168.1.20:8006/api2/json"
api_token          = "terraform-prov@pve!terraform=b****-8***-4***-**7-*****6a5e"
pmx_ssh_password   = "!*secret_password!*"

instance_count     = 2
vmid               = [21000, 22000]
name               = ["nginx", "apache"]
clone              = 10000
target_node        = "pve-demo-01"

# vmbr0 = LAN / vmbr1 = VM_Network / vmbr2 = DMZ
network_bridge     = ["vmbr0", "vmbr0"]  # Utilisez vmbr0 pour deb01, vmbr1 pour deb-app, vmbr2 pour deb-rp
# Ajout de tags VLAN
vlan_tag           = [10, 10]
ip                 = ["10.10.10.110/24", "10.10.10.111/24"]  # Garder vide pour des adresses IP dynamiques
gateway            = "10.10.10.1"
server_dns         = "10.10.10.1"
size               = "20"
storage            = "synology_proxmox"
cloudinit_storage  = "synology_proxmox"
ciuser             = "useradmin"
cipwd              = "admin123"
ssh_key            = "ssh-rsa A************************ useradmin@infrastructure"