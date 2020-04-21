require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def show_menu
  p "Quelle action veux-tu effectuer\n"
  p 'a - chercher une meilleure arme'
  p "s - chercher à se soigner\n"
  p 'attaquer un joueur en vue :'
  p '0 - '+$player1.show_state
  p '1 - '+$player2.show_state
end

def exec_menu
  selection = nil
  while selection != 'a' && selection != 's' && selection != '0' && selection != '1'
    show_menu
    selection = gets.chomp
  end
  if selection == 'a'
    $human_player.search_weapon
  elsif selection == 's'
    $human_player.search_health_pack
  elsif selection == '0'
    $human_player.attacks($player1)
  elsif selection == '1'
    $human_player.attacks($player2)
  end
end

def init
  p "------------------------------------------------"
  p "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  p "|Le but du jeu est d'être le dernier survivant !|"
  p "-------------------------------------------------"
  p "Quel est ton prénom?"
  $human_player = HumanPlayer.new(gets.chomp)
end

$player1 = Player.new("Josiane")
$player2 = Player.new("José")
$enemies = [$player1, $player2]

def finish
  p 'La partie est finie'
  if $human_player.life_points > 0
    p 'BRAVO! TU AS GAGNE'
  else
    p 'Loser! Tu as perdu !'
  end
end

def perform
  init
  while $human_player.life_points > 0 && ($player1.life_points > 0 || $player2.life_points > 0)
    $human_player.show_state
    exec_menu
    p 'Les autres joueurs attaquent'
    $enemies.each do |enemie|
      if enemie.life_points > 0 && $human_player.life_points > 0
        enemie.attacks($human_player)
      end
    end
  end
  finish
end

perform

