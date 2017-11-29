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
    if @hidden_word.word.include?(letter)
      return "You guessed correctly"
    end
    return "You guessed incorrectly"
  end

  def check(letter)
    return @guessed_letters.include?(letter)
  end

end
