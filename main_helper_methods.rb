require_relative('player')
require_relative('hidden_word')
require_relative('game')


def main_query_user_startup
  p "Welcome to the game!"

  print "Please enter a hidden word: "
  chosen_word = gets.chomp()

  system "clear"
  print "Please enter your name: "
  player_name = gets.chomp()

  player_one = Player.new(player_name)
  word_to_guess = HiddenWord.new(chosen_word)
  this_game = Game.new(player_one, word_to_guess)

  game_ongoing = true
  game_won = nil
  this_game.guess(' ')

  return this_game, game_ongoing, game_won
end


def main_game_loop(this_game, game_ongoing, game_won)
  while game_ongoing
    p this_game.show_asterisk_hidden_word
    p "Please guess a letter:"
    current_guess = gets.chomp()
    correct_guess = this_game.guess(current_guess)
    if !correct_guess
      p "You guessed incorrectly!"
      p "You have #{this_game.player().lives()} lives remaining."
      p "Your guessed letters:"
      p this_game.check_guesses()
    else
      p "That's right!"
      p "You have #{this_game.player().lives()} lives remaining."
      p "Your guessed letters:"
      p this_game.check_guesses()
    end
    if this_game.game_lost?()
      game_won = false
      game_ongoing = false
      p "The snowman melted, maybe next time!"
      p "The word was: #{this_game.show_word_unhidden}"
    elsif this_game.game_won?()
      game_won = true
      game_ongoing = false
      p "Congratulations, you won the game!"
      p "The word was: #{this_game.show_asterisk_hidden_word}"
    end
  end
  return game_won
end


def game_result_loop(game_result)
  if game_result
    response = nil
    while response != true
      p "Would you like to play again?: y/n"
      play_again = gets.chomp().downcase
      if play_again == 'y'
        response = true
      elsif play_again == 'n'
        response = true
        exit
      else
        p "Please enter y or n for yes or no"
      end
    end
  else
    response = nil
    while response != true
      p "Would you like to play again?: y/n"
      play_again = gets.chomp().downcase
      if play_again == 'y'
        response = true
      elsif play_again == 'n'
        system "clear"
        exit
      else
        p "Please enter y or n for yes or no"
      end
    end
  end
  system "clear"
end
