variable "group_email" {
}

variable "group_name" {
}

variable "group_description" {
}

variable "member_users" {
  type    = set(string)
  default = []
}

variable "manager_users" {
  type    = set(string)
  default = []
}

variable "owner_users" {
  type    = set(string)
  default = []
}
