resource "yandex_lb_target_group" "tg" {
  name      = "${local.preffix}nlb-target-group"
  region_id = "ru-central1"

  labels = var.labels
  target {
    subnet_id = yandex_vpc_subnet.subnet[0].id
    address   = yandex_compute_instance.vm[0].network_interface[0].ip_address
  }
  target {
    subnet_id = yandex_vpc_subnet.subnet[0].id
    address   = yandex_compute_instance.vm[0].network_interface[0].ip_address
  }
  target {
    subnet_id = yandex_vpc_subnet.subnet[2].id
    address   = yandex_compute_instance.vm[2].network_interface[0].ip_address
  }
}

resource "yandex_lb_network_load_balancer" "nlb" {
  name = "${local.preffix}nlb"

  labels = var.labels
  listener {
    name = "my-listener"
    port = var.nlb_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tg.id

    healthcheck {
      name = var.healthcheck.name
      http_options {
        port = var.healthcheck.port
        path = var.healthcheck.path
      }
    }
  }
}

output "external_ip" {
  value = one(one(yandex_lb_network_load_balancer.nlb.listener).external_address_spec).address
  description = "IP for YC LB"
}