require 'minitest/autorun'
require 'minitest/pride'
require './Validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
      assert Validator.new('userinfo.csv')
  end

  def test_userchecker
    userchecker = Validator.new('userinfo.csv')
    assert userchecker.userchecker_phone(userchecker.data[1]["phone"])
    refute userchecker.userchecker_phone(userchecker.data[2]["phone"])
  end

end


#one test for each method (4)
