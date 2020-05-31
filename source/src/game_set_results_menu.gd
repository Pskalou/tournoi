# Script qui accompagne l'instanciation de la scène `game_set_results_menu.tscn`.
#
# Cette classe met en place l'interface permettant 
# de modifier les scores tours par tours.
class_name Game_set_results_menu


extends Control


# état initial jeu, 
# valeurs par défaut au cas où...
var _round_index= 0
var _total_players


# conteneur de textes et objets
var _left_column_text_node
var _total_players_text_node
var _round_index_node
var _right_column_contains_node


# classes et instances pour les listes de boutons
var _round_buttons_list


# Initialise le tournoi en créant :
#
# * nouveau jeu
# * nouveau score
# * nouveau boutons du rounds (suppression des anciens et ajout des nouveaux)
func init():
	_round_index=0
	# nouveau jeu et nouveau score
	Global.game = Game_generator.new()
	Global.score= Score_manager.new()
	# vider les anciens boutons et créer les nouveaux
	Global.round_buttons.kill()
	Global.round_buttons= Round_buttons.new()
	# afficher les nouveaux boutons
	Global.round_buttons_list= Global.round_buttons.build(_round_index, _right_column_contains_node)
	
	# actualise affichages
	_update_displays()
	
	
# Getter qui retourne l'index du round en cours.
func get_round_index() -> int:
	return _round_index


# Setter qui définit l'index du round en cours.
func set_round_index(new_index:int) -> void:
	_round_index= new_index


func _ready():
	# initialisation des variables
	_round_index=0
	_total_players= Global.get_total_players()
	
	# initialisation des conteneurs
	_left_column_text_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/richlab_tour
	_round_index_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex
	_right_column_contains_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	
	# classe qui gère la répartition des matchs et son instance
	Global.game = Game_generator.new()
	
	# classe qui gère le score et son instance
	Global.score= Score_manager.new()
	
	# afficher les n/2 couples de boutons 	
	Global.round_buttons  = Round_buttons.new()
	_round_buttons_list= Global.round_buttons.build(_round_index, _right_column_contains_node)
	
	# écouteur de signal lorsque le tableau est actualisé
	# et qu'il faut actualiser l'affichage
	Global.connect("actualise_affichage", self, "_update_displays")
	
	# actualise affichages
	_update_displays()


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
	_total_players= Global.get_total_players()
	
	if _total_players % 2 == 0:
			maxi= _total_players - 2
	else: 	maxi= _total_players - 1
	
	# clause de garde
	if _round_index == maxi : return null
	
	_round_index += 1
	
	# effacer anciens boutons et afficher les nouveaux
	Global.round_buttons.kill()
	_round_buttons_list= Global.round_buttons.build(_round_index, _right_column_contains_node)
	
	_update_displays()


func _on_previous_btn_pressed():
	"""
	matchs du round précédent et actualiser l'affichage
	"""
	if _round_index == 0: return null
	_round_index -= 1
	
	# effacer anciens boutons et afficher les nouveaux
	Global.round_buttons.kill()
	_round_buttons_list= Global.round_buttons.build(_round_index, _right_column_contains_node)

	_update_displays()


# Gestion  des affichages
func _update_displays () :
	_update__round_index_text()
	_update_rounds_text()


# actualiser le texte des scores
# dans la colonne de gauche
func _update_rounds_text():
	var bbcode_texte
	if Global.get_total_players() < 13:
		bbcode_texte= Global.score.score_en_bbcode(false)
	else:
		bbcode_texte= Global.score.score_en_bbcode(true)
	
	_left_column_text_node.bbcode_text = bbcode_texte


# actualiser le texte du n° du tour actuel
func _update__round_index_text():
	"""
	"""
	var texte= "Tour n° %3s" % _round_index
	_round_index_node.set_text(texte)

