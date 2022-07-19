require 'bundler'
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

def perform
  puts "
  ---------------------------------------------------
  |      THE GOLOROT I : LE REVEIL DU CODE          |
  |       'Oeil pour oeil, dent pour dent'          |
  |                    By P & C                     |
  ---------------------------------------------------
  "

  # Intro je demande les infos du joueur et indique le but du jeu
  puts " !! Bienvenue dans GOLOROT !! Choisi le plus badass des pseudos : "
  print "=>"
  player_name = gets.chomp
  puts
  player1 = Human_Player.new(player_name)

  puts "On m'a péta toute ma marchandise, #{player_name} ta mission si tu l'accepte (t'as pas vraiment le choix bg) est de me ramener tout ce qu'on m'as pris sinon je risque d'y passer mon boss me tuera ! Alors tue les tous avant stp ! "
  puts

  boss1 = Player.new("Golomuno")
  boss2 = Player.new("Piero")
  enemies = [boss1, boss2] # ici deux instances ennemi sont crées

  while player1.life_points > 0 && (boss1.life_points > 0 || boss2.life_points > 0)
    puts "____________PREPARE TOI AU COMBAT_____________"
    puts player1.show_state

    puts 'Quelle action veux-tu effectuer ?'
    puts
    puts 'a - Essayer de drop une dinguerie'
    puts
    puts 's - Essayer de se soigner'
    puts 
    puts "A quel Big Boss tu vas oser te frotter ?"
    puts    
    puts "0 - #{boss1.show_state.to_s} "
    puts
    puts "1 - #{boss2.show_state.to_s} "
    choice = gets.chomp
    print "=>"
    if choice == "a"
      player1.search_weapon

      elsif choice == "s" 
        player1.search_health_pack

      elsif choice == "0" 
        player1.attacks(boss1)
      
      elsif choice == "1" 
        player1.attacks(boss2)

      else
        puts " Choisi parmis ce que je propose jsais pas moi ..."
    
    end
    puts
    puts "___________MANCHE DES BIG BOSS__________"
    puts
    enemies.each do |boss|
      boss.attacks(player1) if boss.life_points > 0
    end
  end
  binding.pry
end

perform
