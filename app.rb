require 'bundler' #Cette ligne charge la bibliothèque Bundler. 
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

# player1 = Player.new("Alex of Ruby Love \u{1F48B}")
# player2 = Player.new("José of Rubynutile \u{1F629}")

# puts
# puts "Début du combat :"
# puts "#{player1.name} VS #{player2.name}"
# puts

# i = 1
# while true
#   if player1.life_points <= 0 || player2.life_points <= 0 
#     break
#   else
#     player1.show_state #les puts sont déjà dans la méthode show_state
#     player2.show_state 
#     puts
#     puts "\e[4m#{"Round #{i}"}\e[0m :" #\e[4m#{texte}\e[0m pour souligner le texte
#     player1.attacks(player2)
#   end
#   if player1.life_points <= 0 || player2.life_points <= 0 
#     break
#   else
#     player2.attacks(player1)
#   end
#   puts
#   i += 1
# end

binding.pry