require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    #available when logged out
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", contact_path
    #not available when logged out
    assert_select "a[href=?]", details_path, count: 0
    assert_select "a[href=?]", menu_path, count: 0

  end
end
