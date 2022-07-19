require 'pry'

class Player
 
  attr_accessor :name, :life_points

  def initialize(name_player)
    @name = name_player
    @life_points = 100
  end

  def show_state
    puts "#{@name} qui débute avec #{life_points} points de vie" if @life_points > 0
  end
  #permet d'afficher le statut du joueur

  def gets_damage(attack_points)
    @life_points = @life_points - attack_points
    puts "Le Big BOss #{@name} a été tué (avec de la triche)!" if life_points <= 0
  end
  #permet de calculer et afficher les points de vie avec la prise en compte des dommages

  def attacks(target_player)
    puts "Le Big Boss #{@name} attaque le petit #{target_player.name}"
    hit_points = compute_damage
    target_player.gets_damage(hit_points)
    puts "il lui colle un #{hit_points} de dommages dans l'oeil gauche"
  end
  #méthode pour l'attaque et les dommages 

  def compute_damage
    rand(1..6)
  end
  #donne des dégats aléatoire entre 1 et 6
end