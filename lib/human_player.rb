class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, life_points = 70, weapon_level = 1)
    @weapon_level = weapon_level # attribut spécifique à HumanPlayer
    #si j'avais directement écrit @weapon_level = 10 mon attribut aurait été figé dans initialize et donc plus compliqué à modifier dans un autre initialize
    super(name, life_points) #fait appel au initialize de la classe Event
  end

  def show_state
    puts "#{self.name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage #ainsi quand HumanPlayer utilisera la méthode attacks elle fera appel au compute_damage de HumanPlayer
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle, tu la prends."
    else
      puts "C'est de la m@*#$ ! Je préfère mon arme actuelle..."
    end
    puts
  end

  def search_health_pack
    search_dice = rand(1..6)
    case search_dice
    when 1
      puts "Tu n'as rien trouvé... "
    when 2..5
      #player find a pack with 10 points of life
      if @life_points + 10 <= 70
        @life_points = @life_points + 10
        puts "Bravo, tu as trouvé un pack de +10 points de vie !"
      else
        @life_points = 70
        puts "Bravo, tu as trouvé un pack de points de vie, tu es au max !"
      end
    else
      if @life_points + 20 <= 70
        @life_points = @life_points + 20
        puts "Waow, tu as trouvé un pack de +20 points de vie !"
      else
        @life_points = 70
        puts "Bravo, tu as trouvé un pack de points de vie, tu es au max !"
      end
    end
    puts
  end
end