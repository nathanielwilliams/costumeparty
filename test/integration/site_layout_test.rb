require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", details_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", menu_path
    assert_select "a[href=?]", signup_path
  end
end