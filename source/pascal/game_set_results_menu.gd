# script lié à la scène tournoi.tscn
#
# met en place l'interface permettant 
# de modifier les scores tours par tours



extends Control

# état initial jeu, 
# valeurs par défaut au cas où...
var round_index= 0
var total_players

# conteneur de textes et objets
var left_column_text_node
var total_players_text_node
var round_index_node
var right_column_contains_node

# classes et variables gestion du jeu
var Game_generator
var Score_manager

# classes et instances pour les listes de boutons
var Round_buttons
var round_buttons_list


func init():
	round_index=0
	# nouveau jeu et nouveau score
	Global.game = Game_generator.new()
	Global.score= Score_manager.new()
	# vider les anciens boutons et créer les nouveaux
	Global.round_buttons.kill()
	Global.round_buttons= Round_buttons.new()
	# afficher les nouveaux boutons
	Global.round_buttons_list= Global.round_buttons.build(round_index, right_column_contains_node)


func _ready():
	# initialisation des variables
	round_index=0
	total_players= Global.get_total_players()
	
	# initialisation des conteneurs
	left_column_text_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/richlab_tour
	round_index_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex
	right_column_contains_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	right_column_contains_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	
	# classe qui gère la répartition des matchss et son instance
	Game_generator= preload("res://Game_generator.gd")
	Global.game = Game_generator.new()
	
	# classe qui gère le score et son instance
	Score_manager= preload("res://Score_manager.gd")
	Global.score= Score_manager.new()
	
	# afficher les n/2 couples de boutons 	
	Round_buttons= preload("res://Round_buttons.gd")
	Global.round_buttons  = Round_buttons.new()
	round_buttons_list= Global.round_buttons.build(round_index, right_column_contains_node)

	# actualise affichages
	update_displays()


# interface bouton retour
func _on_back_btn_pressed():
	Global.accueil_menu.visible= true
	Global.new_match_menu.visible= false
	Global.game_set_results_menu.visible= false


func _on_next_btn_pressed():
	"""
	afficher les matchs du round suivant
	actualiser l'affichage
	"""
	var maxi
	total_players= Global.get_total_players()
	
	if total_players % 2 == 0:
			maxi= total_players - 2
	else: 	maxi= total_players - 1
	
	# clause de garde
	if round_index == maxi : return null
	
	round_index += 1
	
	# effacer anciens boutons et afficher les nouveaux
	Global.round_buttons.kill()
	round_buttons_list= Global.round_buttons.build(round_index, right_column_contains_node)
	
	update_displays()


func _on_previous_btn_pressed():
	"""
	matchs du round précédent et actualiser l'affichage
	"""
	if round_index == 0: return null
	round_index -= 1
	
	# effacer anciens boutons et afficher les nouveaux
	Global.round_buttons.kill()
	round_buttons_list= Global.round_buttons.build(round_index, right_column_contains_node)

	update_displays()


# Gestion  des affichages
func update_displays () :	
	update_round_index_text()
	update_rounds_text()


func update_rounds_text():
	"""
	actualiser le texte des scores
	dans la colonne de gauche
	"""
	var texte= Global.score.score_en_texte()
	left_column_text_node.set_text(texte)


func update_round_index_text():
	"""
	actualiser le texte du n° du tour actuel
	"""
	var texte= "Tour n° %3s" % round_index
	round_index_node.set_text(texte)


# fonction exécutée automatique tous les changements d'images
func _process(delta):
	update_displays ()
	pass
