require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Jinny's 31st, Hulkamaniacs"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get menu" do
    get :menu
    assert_response :success
    assert_select "title", "Menu | #{@base_title}"
  end

  test "should get details" do
    get :details
    assert_response :success
    assert_select "title", "Details | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
