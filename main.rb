require_relative('player')
require_relative('hidden_word')
require_relative('game')

while true
  p "Welcome to the game!"
  print "Please enter a hidden word: "
  chosen_word = gets.chomp()
  system "clear"
  print "Please enter your name: "

  player_name = gets.chomp()
  player_one = Player.new(player_name)
  word_to_guess = HiddenWord.new(chosen_word)
  this_game = Game.new(player_one, word_to_guess)

  p this_game.show_asterisk_hidden_word
  p "Please guess a letter:"
  current_guess = gets.chomp()

end
