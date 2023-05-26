variable "keys" {
    type = list(string)
    default = [ "name", "age" ]
}

variable "values" {
    type = list(string)
    default = [ "sagar", "32" ]
}

output "mapped" {
    value = tomap(var.keys)
  
}