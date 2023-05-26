variable "list" {
    type = list(string)
    default = [ "a", "b", "c" ]
}

output "element" {
    value = element(var.list, 1)
  
}