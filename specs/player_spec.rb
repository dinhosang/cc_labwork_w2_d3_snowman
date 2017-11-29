require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class TestPlayer < MiniTest::Test


  def setup
    @first_player = Player.new("Jenny")
  end


  def test_get_player_name
    actual = @first_player.name()
    expected = "Jenny"
    assert_equal(expected, actual)
  end


  def test_get_number_of_lives
    actual = @first_player.lives()
    expected = 6
    assert_equal(expected, actual)
  end


  def test_reduce_lives_by_one
    @first_player.lose_life()
    actual = @first_player.lives()
    expected = 5
    assert_equal(expected, actual)
  end


end
