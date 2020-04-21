class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    p "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(points)
    @life_points -= points
    if @life_points <= 0
      p "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    p "le joueur #{@name} attaque le joueur #{player.name}"
    damage_computed = compute_damage
    p "il lui inflige #{damage_computed} points de dommages"
    player.gets_damage(damage_computed)
  end

  private

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    p "#{@name} a #{@life_points} points de vie & une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    lvl_of_weapon = rand(1..6)
    p "Tu as trouvé une arme de niveau #{lvl_of_weapon}"
    if (lvl_of_weapon > @weapon_level)
      @weapon_level = lvl_of_weapon
      p "Youhou! elle est meilleure que ton arme actuelle: tu la prends"
    else
      p "Fucking bordel de merde, elle n'est pas mieux que ton arme actuelle"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      p "Tu n'as rien trouvé"
    elsif health_pack >= 2 && health_pack <= 5
      if @life_points <= 50
        @life_points += 50
      else
        @life_points = 100
      end
      p "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif health_pack == 6
      if @life_points <= 80
        @life_points += 80
      else
        @life_points = 100
      end
      p "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end