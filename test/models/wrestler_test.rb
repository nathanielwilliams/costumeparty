require 'test_helper'

class WrestlerTest < ActiveSupport::TestCase
  def setup
   @user = users(:hulk)
   @wrestler = Wrestler.new(name: "Norm MacDonald", image: File.open(File.join(Rails.root, '/test/images/hulk-hogan-pastamania.jpg')), slogan: "I am not a wrestler.")
 end

 test "should be valid" do
   assert @wrestler.valid?
 end

 test "name should be present" do
   @wrestler.name = "   "
   assert_not @wrestler.valid?
 end

 test "image should be present" do
   @wrestler.name = "   "
   assert_not @wrestler.valid?
 end

 test "slogan should be present" do
   @wrestler.name = "   "
   assert_not @wrestler.valid?
 end
end
