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

  def test_check_letter_in_array
    @game.guess('y')
    actual = @game.check('y')
    expected = true
    assert_equal(expected, actual)
  end


  def test_guess_letter__correct
    letter = 't'
    actual = @game.guess(letter)
    expected = true
    assert_equal(expected, actual)
  end

  def test_guess_letter__incorrect
    letter = 'z'
    actual = @game.guess(letter)
    expected = false
    assert_equal(expected, actual)
  end


  def test_send_letter_to_hidden_word_object
    letter = ['e']
    actual = @game.send_letter(letter)
    expected = "**e******e"
    assert_equal(expected, actual)
  end

  def test_guess__incorrect_reduce_life
    actual = @game.player().lives()
    expected = 6
    assert_equal(expected, actual)
    @game.guess('g')
    actual = @game.player().lives()
    expected = 5
    assert_equal(expected, actual)
  end

  def test_guess__correct_not_reduce_life
    actual = @game.player().lives()
    expected = 6
    assert_equal(expected, actual)
    @game.guess('e')
    actual = @game.player().lives()
    expected = 6
    assert_equal(expected, actual)
  end

end
