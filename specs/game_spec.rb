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
    actual = @game.hidden_word()
    expected = @hidden_word
    assert_equal(expected, actual)
  end

  def test_check_guessed_letters
    actual = @game.guessed_letters().count()
    expected = 0
    assert_equal(expected, actual)
  end

  def test_guess_letter__correct
    letter = 't'
    actual = @game.guess(letter)
    expected = "You guessed correctly"
    assert_equal(expected, actual)
  end

end
