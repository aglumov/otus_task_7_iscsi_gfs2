variable "subnet" {
  type    = list(string)
  default = ["subnet-F76666A1", "subnet-738FFC80", "subnet-05E8BE02"]
}

variable "cc_access_key" {
  type = string
}

variable "cc_secret_key" {
  type = string
}
