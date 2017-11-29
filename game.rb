class Game

  attr_reader :player, :word, :guessed_letters

  def initialize(player, word)
    @player = player
    @word = word
    @guessed_letters = []
  end


end
