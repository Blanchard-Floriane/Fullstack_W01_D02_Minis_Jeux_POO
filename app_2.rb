require 'bundler' #Cette ligne charge la bibliothèque Bundler. 
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

#Accueil
puts
51.times{print "-"}
puts
puts "|    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
51.times{print "-"}
2.times{puts}

#Intialisation du joueur
puts "Hello, quel est ton prénom ?"
print "> "
user_anwser = gets.chomp
user = HumanPlayer.new(user_anwser)

player1 = Player.new("Gargamel")
player2 = Player.new("Bowser")
enemies = [player1, player2]

# Prints a text-based progress bar representing 0 to 100 percent. Each"=" # sign represents 5 percent
0.step(100, 5) do |i|
  printf("\rProgress: [%-20s]", "=" * (i/5))
  sleep(0.5)
end
puts


#Le combat
2.times{puts}
puts "Début du combat :"
puts "\u{1F7E2} #{user.name} VS \u{1F534} #{player1.name} & #{player2.name}"
puts

i = 1
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state #le puts est déjà dans la méthode .show_state

  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  if player1.life_points > 0
    puts "0 - #{player1.name} a #{player1.life_points} point.s de vie, l'attaquer"
  else
    puts "... - #{player1.name} est DEAD \u{1FAA6}, tu ne peux plus l'attaquer"
  end
  if player2.life_points > 0
    puts "1 - #{player2.name} a #{player2.life_points} point.s de vie, l'attaquer"
  else
    puts "... - #{player2.name} est DEAD \u{1FAA6}, tu ne peux plus l'attaquer"
  end
  
  while true
    puts
    print "> "
    user_choice = gets.chomp
    puts
    case user_choice
    when "a"
      user.search_weapon
      break
    when "s"
      user.search_health_pack
      break
    when "0"
      user.attacks(player1)
      break
    when "1"
      user.attacks(player2)
      break
    else
      puts "Tu devais taper a, s, 0 ou 1... C'est pas bien compliqué Tête de Noeud... Recommence !"
    end
  end

  if user.life_points > 0 && (player1.life_points > 0 || player2.life_points)
    puts "Les bots t'attaquent !"
  end
  enemies.each do |player| 
    if user.life_points > 0 && player.life_points > 0
      player.attacks(user)
    end
  end
end

#last sentence = end of game
2.times{puts}
if user.life_points > 0
  puts "La partie est finie"
  puts "BRAVO ! TU AS GAGNE ! \u{1F389}\u{1F38A}"
else 
  puts "   GAME OVER" #sheet pyramid
  puts
  i_bis = 1
  while i_bis <= 8  do
    spaces_bis = (8 - i_bis)
    puts " " * spaces_bis + "\u{1F4A9}" * i_bis
    i_bis += 2 
  end
  2.times{puts}
end

#binding.pry