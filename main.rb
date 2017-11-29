require_relative('player')
require_relative('hidden_word')
require_relative('game')
require_relative('main_helper_methods')

while true
  this_game, game_ongoing, game_won = main_query_user_startup()
  game_result = main_game_loop(this_game, game_ongoing, game_won)
  game_result_loop(game_result)
end
