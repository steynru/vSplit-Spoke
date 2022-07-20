variable "azure_sub_id_vscode_local" {
  type = string
  default = "a008b1c5-30b6-4611-b9da-d01e0e529f51"
}

variable "short_name" {
  type = string
  default = "THDC"
}

variable "resource_location" {
  type = string
  default = "northeurope"
}

variable "long_name" {
  type = string
  default = "The Home Dataceter Company"
}

variable "vnet_ip_range" {
  #type = string
  default = ["10.10.0.0/22"]
}

variable "infra-subnet" {
  #type = string
  default = ["10.10.0.0/25"]
}

variable "app-subnet" {
  #type = string
  default = ["10.10.1.0/25"]
}

variable "db-subnet" {
  #type = string
  default = ["10.10.1.128/26"]
}

variable "web-subnet" {
  #type = string
  default = ["10.10.1.192/26"]
}

variable "aks01-subnet" {
  #type = string
  default = ["10.10.2.0/24"]
}