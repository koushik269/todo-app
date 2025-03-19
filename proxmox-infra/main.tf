terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox.linuxgamer.online:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "q1w2e3r4"
  pm_tls_insecure = true
}

resource "proxmox_lxc" "web_server" {
  target_node = "proxmox"
  hostname     = "web-server"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = "your-password"
  unprivileged = true
  start        = true
  cores        = 1
  memory       = 512
  swap         = 512
  rootfs    {
    storage = "local-lvm"
    size = "10G"
  }
}