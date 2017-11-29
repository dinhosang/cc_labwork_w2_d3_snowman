require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word')


class TestHiddenWord < MiniTest::Test


  def setup
    @hidden_word = HiddenWord.new("Jeremiah")
  end


  def test_get_hidden_word
    actual = @hidden_word.word()
    expected = "jeremiah"
    assert_equal(expected, actual)
  end


  def test_show_asterisk_hidden_word
    actual = @hidden_word.asterisked_word()
    expected = "********"
    assert_equal(expected, actual)
  end

end
