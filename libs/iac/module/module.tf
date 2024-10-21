module "this" {
  # CITIZEN_ADDR=registry.example.com citizen module dev-team alb aws 0.1.0
  # source = "registry.example.com/dev-team/alb/aws"
  # CITIZEN_ADDR=registry.localhost.com citizen module testing terraform-aws-log-exporter aws 1.1.1
  source = "https://registry.localhost.com/testing/terraform-aws-log-exporter/aws/"
  version = "1.1.1"
}
