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