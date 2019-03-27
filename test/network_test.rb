require "./lib/charachter"
require "./lib/show"
require "./lib/network"
require "minitest/autorun"

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")
    #whitespace intentional in setup for readability
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])

    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_has_name
    assert_equal "NBC", @nbc.name
  end

  def test_shows_starts_empty_and_can_add_shows
    assert_equal [], @nbc.shows
    @nbc.add_show(@knight_rider)
    assert_equal [@knight_rider], @nbc.shows
    @nbc.add_show(@parks_and_rec)
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_can_find_highest_paid_actor
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end
  #got the wierd problem ruby has with assert_equal thinking its a block, parens didnt fix
  def test_makes_payroll
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    hash = {"David Hasselhoff" => 1600000, "William Daniels" => 1000000, "Amy Poehler" => 2000000, "Nick Offerman" => 1400000}
    assert_equal hash,  @nbc.payroll
  end

end
