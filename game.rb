class Game

  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(player, word)
    @player = player
    @hidden_word = word
    @guessed_letters = [nil]
  end

  def check_guesses
    guesses = @guessed_letters
    guesses_to_return = []
    for guess in guesses
      if guess != nil
         guesses_to_return.push(guess)
       end
     end
    return guesses_to_return
  end


  def guess(letter)
    letter = letter.downcase()
    if letter != " "
      @guessed_letters << letter
    end
    # this comment block is not needed
    # just for chceking when testing:
    #result_asterisked_word = @hidden_word.asterisked_word(
    #  @guessed_letters)
    # p result_asterisked_word
    if @hidden_word.word.include?(letter)
      return true
    end
    #@player.lives() -= 1 did not work! unexpected tOP_ASGN, expecting keyword_end (SyntaxError)
    #@player.lives() -= 1
    @player.lose_life()
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

  def game_lost?()
    return true if @player.lives() <= 0
    return false
  end

  def game_won?()
    word_current_status = @hidden_word.asterisked_word(
      @guessed_letters)
    if word_current_status.include?("*")
      return false
    else
      return true
    end
  end

  def show_asterisk_hidden_word
    return @hidden_word.asterisked_word(
      @guessed_letters)
  end

  def show_word_unhidden
    return @hidden_word.word()
  end

end
