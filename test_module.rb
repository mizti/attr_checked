require 'test/unit'
require './checked_attributes'
class Person
  include CheckedAttributes
  attr_checked :age do |v|
      v >= 18
  end
end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    @bob = Person.new
  end
  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_under17
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end

end


