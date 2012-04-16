require 'test_helper'

require 'fixtures/non_validated_user'


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

  test 'a valid user should return an empty error message response' do
    user = DumbUser.new(:email => 'me@you.com', :first_name => 'joe', :last_name => 'schmoe')
    assert user.soft_errors.empty?
  end

  test 'The progress count should reflect the number of soft validated attributes that are populated' do
    user = DumbUser.new(:email => 'me@you.com', :first_name => 'joe')
    assert user.progress_count == 1

    user = DumbUser.new(:email => 'me@you.com', :first_name => 'joe', :last_name => 'schmoe')
    assert user.progress_count == 2
  end

  test 'The progress complete count should be the number of soft validated attributes' do
    assert DumbUser.new.progress_complete_count == 2
  end

  test 'Calling #progress_percent on a partially populated instance should return the right value' do
    user = DumbUser.new(:email => 'me@you.com', :first_name => 'joe')
    assert user.progress_percent == 0.50
  end

  test 'we can instantiate a DumbUser' do
    ::DumbUser.new({})
    assert true
  end

  test 'soft-validating a non-existent attribute should raise an error' do
    error = assert_raise SoftValidateError do
      require 'fixtures/user_with_non_existent_validated_attr'
    end

    assert error.message.match(/^Soft validated attribute does not exist/)
  end

end
