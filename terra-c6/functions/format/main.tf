variable "name" {
    type = string
    default = "example"
}

output "formatted_name" {
    value = format("This is %s", var.name)
}