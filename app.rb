require_relative 'lib/game'
require_relative 'lib/player'

puts "Bienvenue dans le jeu de Morpion !"

# Demander les noms des joueurs
print "Joueur 1, entrez votre nom : "
player1_name = gets.chomp
player1 = Player.new(player1_name, "X")

print "Joueur 2, entrez votre nom : "
player2_name = gets.chomp
player2 = Player.new(player2_name, "O")

# Initialiser le jeu
game = Game.new(player1, player2)

# Début du jeu
game.play
