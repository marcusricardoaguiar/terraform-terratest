variables {
  example_list = ["1", "2", "3"]
  example_map  = {"a": 1, "b": 2}
  example_any  = "test-any"
}

run "valid_content_files" {
  command = plan
  assert {
    condition     = local_file.example.content == "example + "
    error_message = "Output example is not the expected one."
  }
  assert {
    condition     = local_file.example2.content == ""
    error_message = "Output example2 is not the expected one."
  }
  module {
    source = "./modules/basic"
  }
}

run "valid_outputs" {
  command = plan
  assert {
    condition     = output.example == "example"
    error_message = "Output example is not the expected one."
  }
  assert {
    condition     = output.example2 == ""
    error_message = "Output example2 is not the expected one."
  }
  assert {
    condition     = output.example_list == var.example_list
    error_message = "Output example_list is not the expected one."
  }
  assert {
    condition     = output.example_map == var.example_map
    error_message = "Output example_map is not the expected one."
  }
  assert {
    condition     = output.example_any == var.example_any
    error_message = "Output example_any is not the expected one."
  }
  module {
    source = "./modules/basic"
  }
}
