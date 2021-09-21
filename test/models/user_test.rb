require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def user
   @user ||= users(:one)
 end

 test "should have a email" do
   user.email = "evanir.jr@gmail.com"
   assert_equal true, user.valid?
 end

 test "should have a error if email blank" do
   user.email = nil
   assert_equal false, user.valid?
   assert_equal ['não pode ficar em branco'], user.errors.messages[:email]
 end

 test "should have a error if name blank" do
   user.name = ""
   assert_equal false, user.valid?
   assert_equal ['não pode ficar em branco'], user.errors.messages[:name]
 end

 test "email should not have a specials characters" do
   user.email = "evanir&e8.com.br"
   assert_equal false, user.valid?
   assert_equal ['email invalido!'], user.errors.messages[:email]
 end

end
