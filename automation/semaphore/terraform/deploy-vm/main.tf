# Fichier cloud-init pour installer Python3 et QEMU

resource "proxmox_virtual_environment_file" "custom_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.target_node

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${element(var.name, 0)}
    timezone: Europe/Paris
    users:
      - default
      - name: ${var.ciuser}
        groups: [sudo]
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh_authorized_keys:
          - ${trimspace(var.ssh_key)}
    package_update: true
    packages:
      - qemu-guest-agent
      - python3
      - python3-pip
      - git
      - net-tools
      - curl
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - apt-get install -y python3-venv
      - echo "cloud-init complete" > /tmp/cloud-init.done
    EOF

    file_name = "custom-cloud-config.yaml"
  }
}

# Création des VMs - Compatible ancienne structure

resource "proxmox_virtual_environment_vm" "proxmox" {
  count      = var.instance_count
  name       = element(var.name, count.index)
  vm_id      = element(var.vmid, count.index)
  node_name  = var.target_node
  clone {
    vm_id = var.clone
  }

  # Configuration CPU / RAM
  cpu {
    cores   = 1
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = 2048
  }

  # Réseau
 
  network_device {
    bridge    = element(var.network_bridge, count.index)
    vlan_id   = element(var.vlan_tag, count.index)
    model     = "virtio"
  }

  # Disques

  disk {
    datastore_id = var.storage
    interface    = "virtio0"
    size         = var.size
    iothread     = true
    discard      = "on"
  }

  initialization {
    # Cloud-Init automatique
    datastore_id = var.storage

    ip_config {
      ipv4 {
        address = element(var.ip, count.index)
        gateway = var.gateway
      }
    }

    user_account {
      username = var.ciuser
      password = var.cipwd
      keys     = [trimspace(var.ssh_key)]
    }

    dns {
      servers = [var.server_dns]
    }
    # injecte le fichier Cloud-Init personnalisé ici
    user_data_file_id = proxmox_virtual_environment_file.custom_cloud_config.id
  }

  agent {
    enabled = false
  }
}