require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Hell in a Cell | Jinny XXXI"
    assert_equal full_title("Help"), "Help | Hell in a Cell | Jinny XXXI"
  end
end
