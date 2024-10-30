require "test_helper"

class AboutPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get about_page_show_url
    assert_response :success
  end
end
