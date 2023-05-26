variable "list" {
    type = list(string)
    default = [ "a", "b", "c" ]
}

output "concatenation" {
    value = concat(var.list, ["d", "e"])
  
}