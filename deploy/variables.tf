
variable "test" {
  default = 1
  type    = number
}

variable "region" {
  description = "region"
}

variable "bucket" {
  description = "backend bucket"
}
variable "key" {
  description = "backend key"
}
