subnets_addr = [
  "10.1.0.0/24",
  "10.2.0.0/24",
  "10.3.0.0/24"
]

vm_name = "instance"

zone_list = [
  "ru-central1-a",
  "ru-central1-b",
  "ru-central1-d"
]

labels = {
  "project" = "slurm"
  "env" = "lab"
}

resources = {
  cpu = 2
  memory = 2
  disk = 10
}

nlb_port = 8080

healthcheck = {
  name = "http"
  port = 80
  path = "/"
}

count_var = 3