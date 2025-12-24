resource "yandex_vpc_network" "net-1" {
  name = "${local.preffix}network"
  description = "My test network"
}

resource "yandex_vpc_subnet" "subnet" {
  count = 3
  v4_cidr_blocks = [var.subnets_addr[count.index]]
  zone           = var.zone_list[count.index]
  network_id     = yandex_vpc_network.net-1.id
  labels = {
    "project" = "slurm"
    "env" = "lab"
  }
  name = "${local.preffix}subnet-${count.index + 1}"
}

