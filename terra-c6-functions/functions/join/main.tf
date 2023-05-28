variable "list" {
    type = list(string)
    default = [ "a", "b", "c" ]
}

output "joined" {
    value = join(":", var.list)
  
}