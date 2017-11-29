require_relative('player')
require_relative('hidden_word')
require_relative('game')


def main_query_user_startup
  puts "Welcome to the game setup."
  puts ""
  puts "After entering a hidden word or phrase please pass the computer to the player."
  puts ("-" * 75)
  while true
    print "Your hidden word or phrase: "
    chosen_word_phrase = gets.chomp()
    if chosen_word_phrase.match(/^[[:alpha:]]+$/)
      break
    else
      puts "Please only use letters of the english alphabet"
      puts ("-" * 75)
    end
  end

  system "clear"

  puts "Welcome to the game!"
  print "Please enter your name: "
  player_name = gets.chomp()
  puts ("-" * 75)
  puts "You start with six lives, and you'll lose one with each incorrect guess."
  player_one = Player.new(player_name)
  word_to_guess = HiddenWord.new(chosen_word_phrase)
  this_game = Game.new(player_one, word_to_guess)

  game_ongoing = true
  game_won = nil
  this_game.guess(' ')

  return this_game, game_ongoing, game_won
end


def main_game_loop(this_game, game_ongoing, game_won)
  while game_ongoing
    while true
      puts ("-" * 75)
      puts "The hidden word or phrase:"
      puts this_game.show_asterisk_hidden_word
      puts ""
      puts "List of guessed letters:"
      p this_game.check_guesses()
      puts ""
      puts "Please guess a letter:"
      current_guess = gets.chomp()
      if !current_guess.match(/^[[:alpha:]]+$/)
        puts "Please only use a letter in the english alphabet"
      elsif current_guess.length() != 1
        puts "Please only enter one letter at a time"
      else
        system "clear"
        break
      end
    end
    puts ("-" * 75)
    correct_guess = this_game.guess(current_guess)
    if !correct_guess
      puts "You guessed incorrectly!"
      puts ""
      puts "You have #{this_game.player().lives()} lives remaining."
    else
      puts "That's right!"
      puts "You have #{this_game.player().lives()} lives remaining."
    end
    if this_game.game_lost?()
      game_won = false
      game_ongoing = false
      puts "The snowman melted, maybe next time!"
      puts "The word was: #{this_game.show_word_unhidden}"
      puts ("-" * 75)
    elsif this_game.game_won?()
      game_won = true
      game_ongoing = false
      puts "Congratulations, you won the game!"
      puts "The word was: #{this_game.show_asterisk_hidden_word}"
      puts ("-" * 75)
    end
  end
end


def play_again_query()
  response = nil
  while response != true
    puts "Would you like to play again?: y/n"
    play_again = gets.chomp().downcase
    if play_again == 'y'
      response = true
    elsif play_again == 'n'
      system "clear"
      exit
    else
      puts "Please enter y or n for yes or no"
      puts ("-" * 75)
    end
  end
  system "clear"
end
