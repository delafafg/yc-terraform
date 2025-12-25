resource "yandex_compute_instance" "vm" {
  count = var.count_var
  name        = "${local.preffix}${var.vm_name}-${count.index + 1}"
  platform_id = "standard-v${count.index + 1}"
  zone        = var.zone_list[count.index]

  labels = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    index     = 1
    subnet_id = yandex_vpc_subnet.subnet[count.index].id
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_vm_ip_0" {
  value = yandex_compute_instance.vm[0].network_interface[0].ip_address
  description = "IP for YC compute instance"
}

output "internal_vm_ip_1" {
  value = yandex_compute_instance.vm[1].network_interface[0].ip_address
  description = "IP for YC compute instance"
}

output "internal_vm_ip_2" {
  value = yandex_compute_instance.vm[2].network_interface[0].ip_address
  description = "IP for YC compute instance"
}
