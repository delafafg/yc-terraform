variable "vm_name" {
  type = string
  description = "Virtual Machine name"
}

variable "image_id" {
  type = string
  default = "fd883qojk2a3hruf8p7m"
  description = "Image ID from YC"
}

variable "subnets_addr" {
  type = list(string)
  description = "V4 Subnets Addresses"
}

variable "zone_list" {
  type = list(string)
  description = "Availability zones from YC"
}

variable "labels" {
  type = map(string)
}

variable "resources" {
  type = object({
    cpu = number
    memory = number
    disk = number
  })
  description = "Compute Instance resources"
}
