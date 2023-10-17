class Player
  attr_accessor :name, :life_points 

  def initialize(name, life_points = 10) #ici life_points est un attribut accessoire 
    @name = name.to_s
    @life_points = life_points
  end

  def show_state
    puts "#{self.name} a #{@life_points} points de vie."
  end

  def gets_damage(num)
    @life_points = @life_points - num.to_i
    if @life_points <= 0
      puts "#{self.name} a été tué !"
    else
    end
    # Ici on touche directement l'attribut dans l'objet class Player donc comme il s'agit d'un attribut spécifique à mon objet, que ma méthode modifie cet attribut donc pas besoin de return
  end
  
  def attacks(player_2)
    puts "#{self.name} attaque #{player_2.name},"
    damage_point = compute_damage
    puts "Il lui inflige #{damage_point} point.s de dommages."
    player_2.gets_damage(damage_point)
  end
  
  def compute_damage
    return rand(1..6)
  end
end