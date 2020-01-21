# fichier qui centralise tout le code
# il est lancé en 1er et c'est lui qui appelle les autres classes

extends Node


var round_index=0
var total_players= 6


# conteneur de textes et objets
var left_column_text_node
var total_players_text_node
var round_index_node
var right_column_contains_node


var Game= preload("res://Game.gd")
var game


var Score= preload("res://Score.gd")
var score


var newMatch= load("res://vrac/bouton_participant.tscn")


func _ready():
	# initialisation des conteneurs
	left_column_text_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/richlab_tour
	total_players_text_node= $MarginContainer/VBoxContainer/HboxGenerate/lab_participants
	round_index_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex
	right_column_contains_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	
	# nouveau jeu
	game= Game.new(total_players)
	score= Score.new(total_players)
	
	button_builder()
	
	# actualise affichages
	update_displays()
	

var match_list = []


func button_builder():
	while match_list:
		match_list.pop_back().queue_free()
	var id1
	var id2
	var pos= Vector2(0,0)
	var players_list= range(total_players)
	var i= 0
	while len(players_list) > 1:
		id1= players_list.pop_front()
		id2= game.opponent(id1, round_index)
		
		# clause de garde si pas d'adversaire
		if id2 == null: continue
		
		# création des instances des boutons
		players_list.erase(id2)
		match_list.append(newMatch.instance())
		match_list[i].me_id= id1
		match_list[i].other_id= id2
		# initialisation des états
		match_list[i].state= score.get_result(id1, id2)
		# initialisation de la position
		match_list[i].rect_position= pos 
		# affichage de l'instance
		right_column_contains_node.add_child(match_list[i])
		
		# mise en place du signal
		match_list[i].connect("is_pressed", self, "changement_resultat_handler")
		
		# boucle suivante
		pos += Vector2(0, 50)
		i= i+1


func changement_resultat_handler(id1, id2, state):
	# mise à jour du tableau de resultats
	score.set_result(id1,id2,state)
	# actualisation des affichages
	update_displays()


# gestion des boutons et des différents appels
func _on_bt_more_pressed():
	total_players += 1
	# nouveau jeu et nouveau score
	game = Game.new(total_players)
	score= Score.new(total_players)
	# actualisation affichage
	button_builder()
	update_displays()


func _on_bt_less_pressed():
	
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
	
	button_builder()
	update_displays()


func _on_bt_next_round_pressed():
	var maxi
	if total_players % 2 == 0:
			maxi= total_players - 2
	else: 	maxi= total_players - 1
	if round_index == maxi : return null
	round_index += 1
	button_builder()
	update_displays()


func _on_bt_previous_round_pressed():
	if round_index == 0: return null
	round_index -= 1
	button_builder()
	update_displays()


# Gestion  des affichages
func update_displays () :	
	update_total_players_text()
	update_round_index_text()
	update_rounds_text()


func update_rounds_text():
	var texte= score.score_en_texte()
	left_column_text_node.set_text(texte)


func update_total_players_text():
	total_players_text_node.set_text("Nombre de participants : %3s" % total_players)


func update_round_index_text():
	var texte= "Tour n° %3s" % round_index
	round_index_node.set_text(texte)