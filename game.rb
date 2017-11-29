class Game

  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(player, word)
    @player = player
    @hidden_word = word
    @guessed_letters = []
  end


  def guess(letter)
    letter = letter.downcase()
    @guessed_letters << letter
    result_asterisked_word = @hidden_word.asterisked_word(
      @guessed_letters)
    # p result_asterisked_word
    if @hidden_word.word.include?(letter)
      return true
    end
      return false
  end

  def check(letter)
    return @guessed_letters.include?(letter)
  end

  def send_letter(letter_array)
    result = @hidden_word.asterisked_word(
      letter_array)
    return result
  end
end
