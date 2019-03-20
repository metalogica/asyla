require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  # setup
  # exercise
  # verify
  # teardown

  # test "visiting the index" do
  #   visit tasks_url
  #
  #   assert_selector "h1", text: "Task"
  # end
  test "admin visiting the index" do
    visit "/"
    assert_selector("h4", text: "Administrator")
  end
end
