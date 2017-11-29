require('minitest/autorun')
require('minitest/rg')
require_relative('../game')
require_relative('../hidden_word')
require_relative('../player')


class TestGame < MiniTest::Test


  def setup
    @hidden_word = HiddenWord.new("ameliorate")
    @player = Player.new("Terrence")
    @game = Game.new(@player, @hidden_word)
  end


  def test_get_player
    actual = @game.player()
    expected = @player
    assert_equal(expected, actual)
  end

  def test_get_hidden_word
    actual = @game.word()
    expected = @hidden_word
    assert_equal(expected, actual)
  end

end
