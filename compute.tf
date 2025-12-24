resource "yandex_compute_instance" "vm" {
  count = 3
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
