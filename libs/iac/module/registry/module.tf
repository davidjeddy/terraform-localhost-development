module "this" {
  # ./citizen module <namespace> <name> <provider> <version>
  # HTTP 764: removeSocket registry.localhost.com:443::::::::::::::::::::: writable: true
  # ✔ publish test-namespace/test-module/aws/1.1.1
  source  = "registry.localhost.com/test-namespace/test-module/aws"
  version = "1.1.1"
}
