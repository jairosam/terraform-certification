provider "random" {}

variable "number_of_pets" {
  type = number
  description = "number of pets"
}

resource "random_integer" "random_number" {
  min = 1
  max = 90
}

resource "random_pet" "pet_name" {
  length    = var.number_of_pets
  separator = "-"
}

output "random_number" {
  value = random_integer.random_number.result
}

output "pet_name" {
  value = random_pet.pet_name.id
}