# Le fichier variables.tf pour les variables principales
variable "pmx_api_url" {
  type = string
}

variable "api_token" { # nouveau token API pour l'authentification
  type = string
}

variable "pmx_ssh_password" {
  type = string
}
variable "clone" {
  type = number
}

variable "name" {
  type = list(string)
}

variable "target_node" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "vmid" {
  description = "ID_de_la_VM"
  type        = list(number)
}

variable "network_bridge" {
  type = list(string)
}

variable "vlan_tag" {          # Nouvelle variable pour les VLAN tags
  type = list(number)          # La variable doit être de type liste de nombres
}

variable "ip" {
  type = list(string)
}

variable "gateway" {
  type = string
}
variable "server_dns" {
  type = string
}

variable "size" {
  type = string
}

variable "storage" {
  type = string
}

variable "cloudinit_storage" {
  type = string
}

variable "ciuser" {
  type = string
}

variable "cipwd" {
  type = string
}

variable "ssh_key" {
  type = string
}