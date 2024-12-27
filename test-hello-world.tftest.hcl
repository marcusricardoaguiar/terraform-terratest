run "valid_output" {
  command = plan
  assert {
    condition     = output.hello_world == "Hello, World!"
    error_message = "Output hello_world is not the expected one."
  }
  module {
    source = "./modules/hello-world"
  }
}
