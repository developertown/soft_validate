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

  test 'we can instantiate a DumbUser' do
    ::DumbUser.new({})
    assert true
  end

end
