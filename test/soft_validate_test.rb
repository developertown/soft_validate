require 'test_helper'

class SoftValidateTest < TEST_CASE
  fixtures :dumb_users

  test "truth" do
    assert_kind_of Module, SoftValidate
  end

  test "a soft validated record will have the #soft_validates_presence_of method" do
    assert DumbUser.instance_methods.include?(:soft_valid?)
  end

  test 'a dumb user will not be soft valid' do
    assert !DumbUser.new.soft_valid?.nil?
    assert !DumbUser.new.soft_valid?
  end

  test 'a fully valid user should return true to #soft_valid?' do
    user = DumbUser.new(:email => 'me@you.com', :first_name => 'joe', :last_name => 'schmoe')
    assert user.soft_valid?
  end

  test 'an invalid user should return error messages' do
    user = DumbUser.new

    response = user.soft_errors
    assert !response.nil?
    assert !response.empty?

    assert response[:first_name].eql?("shouldn't be blank")
    assert response[:last_name].eql?("shouldn't be blank")
  end

  test 'we can instantiate a DumbUser' do
    ::DumbUser.new({})
    assert true
  end

end
