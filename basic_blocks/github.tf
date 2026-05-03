provider "github" {
  token = var.github_token
}

resource "github_repository" "test-github-repo" {
  name        = "test-github-repo"
  description = "A test repository created by Terraform"
  private     = false
}
