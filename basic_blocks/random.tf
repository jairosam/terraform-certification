provider "random" {}

resource "random_integer" "random_number" {
  min = 1
  max = 100
}

output "random_number" {
  value = random_integer.random_number.result
}