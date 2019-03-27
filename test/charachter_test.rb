require "./lib/charachter"
require "minitest/autorun"


class CharacterTest < Minitest::Test

  def test_has_attributes
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    assert_equal "KITT", kitt.name
    assert_equal "William Daniels", kitt.actor
    assert_equal 1000000, kitt.salary
  end


end
