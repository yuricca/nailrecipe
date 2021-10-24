require 'test_helper'

class NailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nails_index_url
    assert_response :success
  end

end
