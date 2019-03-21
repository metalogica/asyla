require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  # setup
  # exercise
  # verify
  # teardown
  test "admin visiting the index" do
    visit "/"
    assert_selector("h4", text: "Administrator")
  end
end
