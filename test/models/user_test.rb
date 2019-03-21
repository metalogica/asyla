require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name returns capitalized first and last name" do
    #Method 1: From scratch
    richard = User.new(first_name: "richard", last_name: "jarram" )
    assert_equal "Richard Jarram", richard.full_name

    #Method 2: from YAML
    assert_equal "John Doe", users(:john).full_name
  end

  test "#full_name should not crash if first name is nil" do
    richard = User.new(last_name: "jarram")
    assert_equal "Jarram", richard.full_name
  end
end
