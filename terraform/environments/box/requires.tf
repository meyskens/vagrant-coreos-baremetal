terraform {
  required_version = ">= 0.11.14"
}

provider "external" {
  version = "~> 1.1.0"
}

provider "ignition" {
  version = "~> 1.1.0"
}

provider "local" {
  version = "~> 1.2.2"
}

provider "null" {
  version = "~> 2.1.2"
}

provider "template" {
  version = "~> 2.1.0"
}

provider "tls" {
  version = "~> 2.0.1"
}

provider "matchbox" {
  version = "~> 0.3.0"
}
