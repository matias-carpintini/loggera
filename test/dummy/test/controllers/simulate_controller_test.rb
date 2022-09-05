require "test_helper"

class SimulateControllerTest < ActionDispatch::IntegrationTest
  test "should get failure" do
    get simulate_failure_url
    assert_response :success
  end
end
