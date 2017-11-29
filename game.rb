class Game

  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(player, word)
    @player = player
    @hidden_word = word
    @guessed_letters = []
  end


  def guess(letter)
    if @hidden_word.word.include?(letter)
      return "You guessed correctly"
    end
  end

end
