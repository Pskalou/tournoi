# fichier qui centralise tout le code
# il est lancé en 1er et c'est lui qui appelle les autres classes

extends Node

# état initial jeu
var round_index=0
var total_players= 6

# conteneur de textes et objets
var left_column_text_node
var total_players_text_node
var round_index_node
var right_column_contains_node

# classes et variables gestion du jeu
var Game
var game
var Score
var score

# classes et instances pour les listes de boutons
var Round_buttons
var round_buttons
var round_buttons_list


func _ready():
	# initialisation des conteneurs
	left_column_text_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/richlab_tour
	total_players_text_node= $MarginContainer/VBoxContainer/HboxGenerate/lab_participants
	round_index_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex
	right_column_contains_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	
	# classe qui gère la répartition des matchss et son instance
	Game= preload("res://Game.gd")
	game= Game.new(total_players)
	
	# classe qui gère le score et son instance
	Score= preload("res://Score.gd")
	score= Score.new(total_players)
	
	# afficher les n/2 couples de boutons 	
	Round_buttons= preload("res://Round_buttons.gd")
	round_buttons= Round_buttons.new(game, score)
	round_buttons_list= round_buttons.build(round_index, right_column_contains_node)
	
	# actualise affichages
	update_displays()
	
	


# gestion des boutons et des différents appels
func _on_bt_more_pressed():
	"""
	augmenter le nombre de joueur et actualiser l'affichage
	"""
	total_players += 1
	# nouveau jeu et nouveau score
	game = Game.new(total_players)
	score= Score.new(total_players)
	# vider les anciens boutons et créer les nouveaux
	round_buttons.kill()
	round_buttons= Round_buttons.new(game, score)
	
	# afficher les nouveaux
	round_buttons_list= round_buttons.build(round_index, right_column_contains_node)
	
	update_displays()


func _on_bt_less_pressed():
	"""
	diminuer le nombre de joueurs
	actualiser l'affichage
	"""
	if total_players == 2: return null
	total_players -= 1
	
	var maxi
	if total_players % 2 == 0:
			maxi= total_players - 2
	else: 	maxi= total_players - 1
	round_index= min(maxi,round_index)
	
	# nouveau jeu et nouveau score
	game = Game.new(total_players)
	score= Score.new(total_players)
	# vider les anciens boutons et créer les nouveaux
	round_buttons.kill()
	round_buttons= Round_buttons.new(game, score)
	
	# afficher les nouveaux
	round_buttons_list= round_buttons.build(round_index, right_column_contains_node)
	
	update_displays()


func _on_bt_next_round_pressed():
	"""
	afficher les matchs du round suivant
	actualiser l'affichage
	"""
	var maxi
	if total_players % 2 == 0:
			maxi= total_players - 2
	else: 	maxi= total_players - 1
	
	# clause de garde
	if round_index == maxi : return null
	
	round_index += 1
	
	# effacer anciens boutons et afficher les nouveaux
	round_buttons.kill()
	round_buttons_list= round_buttons.build(round_index, right_column_contains_node)
	
	update_displays()


func _on_bt_previous_round_pressed():
	"""
	matchs du round précédent et actualiser l'affichage
	"""
	if round_index == 0: return null
	round_index -= 1
	
	# effacer anciens boutons et afficher les nouveaux
	round_buttons.kill()
	round_buttons_list= round_buttons.build(round_index, right_column_contains_node)

	update_displays()


# Gestion  des affichages
func update_displays () :	
	update_total_players_text()
	update_round_index_text()
	update_rounds_text()


func update_rounds_text():
	"""
	actualiser le texte des scores
	dans la colonne de gauche
	"""
	var texte= score.score_en_texte()
	left_column_text_node.set_text(texte)


func update_total_players_text():
	"""
	actualiser le texte du nombre total de participants
	"""
	total_players_text_node.set_text("Nombre de participants : %3s" % total_players)


func update_round_index_text():
	"""
	actualiser le texte du n° du tour actuel
	"""
	var texte= "Tour n° %3s" % round_index
	round_index_node.set_text(texte)


# fonction exécutée automatique tous les changements d'images
func _process(delta):
	update_displays ()