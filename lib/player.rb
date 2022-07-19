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
    puts "Le Big BOss #{@name} a été tué (avec de la triche) par #{@Human_Player} !" if life_points <= 0
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

class Human_Player < Player
  attr_accessor :weapon_level
#on garde le name on modifie la valeur des PV et on rajoute la variale weapon level 

  def initialize(name_player)
    @name = name_player
    @life_points = 100
    @weapon_level = 1
  end
 #on définit une nouvelle méthode show dans laquelle on affiche le niveau de l'arme de base

  def show_state
    puts "#{@name} auras pour commencer #{@life_points} points de vie et une arme de niveau #{@weapon_level} " 
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
  #méthode compute permettant ette fois-ci de multiplier les dommages par le niveau de l'arme

  def search_weapon
    random_weapon_barter = rand(1..6) #j'utilise rand pour donner un niveau aléatoire entre 1 et 6 à l'arme trouvée

    puts "T'as trouvé une dinguerie de niveau #{random_weapon_barter}"
    puts
    if random_weapon_barter > @weapon_level
      @weapon_level = random_weapon_barter
      puts "Alors là mon pote, tu vas pouvoir botter des culs !"
    else
      " Ah mince elle est aussi claquée que celle que tu as ..."
    end
    # j'utilise un if afin de comparer mes deux armes, si la nouvelle est plus élevée alors je la prends sinon rien.
  end

  def search_health_pack
    random_health_pack = rand(1..6) # même méthodologie que pour l'arme
    #cette fois j'apporte un côté chance et ne donne qu'un chiffre gagnant pour un max de PV et un chiffre perdant
    if random_health_pack == 1
      puts " Tu reste dans la team one shot..."
    elsif random_health_pack == 6
      puts " Wooooooow mais c'est que tu viens de trouver un HealthPack de + 80 PV !! "
      @life_points += 80
      @life_points = 100 if @life_points > 100 #si les PV dépassent 100 alors ça reste à 100
    else
      puts " C'est pas ouf mais t'as quand même chopé 50 PV "
      @life_points += 50
      @life_points = 100 if @life_points > 100 #si les PV dépassent 100 alors ça reste à 100
    end
  end

end
  