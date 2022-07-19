require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
player1 = Player.new("Chris")
player2 = Player.new("Pierre")

# Current state.
while player1.life_points > 0 && player2.life_points > 0
  puts
  puts "|_______________NOUVELE MANCHE A VENIR!_________________|"
  puts
  puts "Voici les PV avec lesquels débute chaque joueur :"
  puts
  print player1.show_state
  puts
  print player2.show_state
  puts
  puts "|________________________COMBAT________________________|"
  puts
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0

  player2.attacks(player1)
  end
end
perform

