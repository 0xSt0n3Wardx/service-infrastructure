#Le fichier provider.tf pour y définir les fournisseurs
terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.86.0"
    }
  }
}

provider "proxmox" {
  endpoint        = var.pmx_api_url
  api_token       = var.api_token
  insecure        = true

  # Configuration SSH pour les fichiers
  ssh {
    username = "root"  # Utilisateur SSH pour le nœud Proxmox
    password = var.pmx_ssh_password  
  }
}