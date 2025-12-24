terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.80"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.1.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
  required_version = ">= 1.14"
}

provider "yandex" {
  token     = "y0__xC2l87sBBjB3RMgxbmn3RUSUWbQaEtNSQbUCLGcwE1zYWocEg"
  cloud_id  = "b1g5dkvs072ukhn7e4ka"
  folder_id = "b1gfhf6hvqnndtuo39pn"
}
