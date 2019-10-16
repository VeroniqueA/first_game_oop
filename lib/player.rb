class Player

	attr_accessor :name, :life_points

 
  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
  	puts "le joueur #{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
  	@life_points -= damage
  	if @life_points <= 0 
  		puts "le joueur #{@name} a été tué"
  	else puts "le joueur #{@name} a #{@life_points} points de vie"
  	end
  end

  def attacks(player_attacked)
  	puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
  	  	lost_points = compute_damage
  	puts "il lui inflige #{lost_points} points de dommage"
  	player_attacked.gets_damage(lost_points)
  end

  def compute_damage
  	return rand(1..6)
  end

 end

 class HumanPlayer < Player
 	
 	attr_accessor :weapon_level

 	def initialize(player_attacked)
 	@weapon_level = 1
 	@life_points = 100
 	end

 	def show_state
 		puts "le joueur #{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
	end
 
 	def search_weapon

 	weapon = rand(1..6)
 	if weapon > @weapon_level
 		@weapon_level = weapon
 		puts "Youhou ! ton arme a un niveau le meilleur"
 	else puts "désolé tu gardes ton arme actuelle"
 	end

 	 def search_health_pack
    	level_pack = rand(1..6)
    	if level_pack == 1
      	puts "Tu n'as rien trouvé"
    	elsif level_pack <= 5 && level_pack >= 2
      	puts "Bravo, tu as trouvé un pack de +50 points de vie"
      	@life_points += 50
      	@life_points = 100 if @life_points > 100
    	else
      	puts 'Waow, tu as trouvé un pack de +80 points de vie !'
      	@life_points += 50
      	@life_points = 100 if @life_points > 100
  		end
	end

 end
end



 




