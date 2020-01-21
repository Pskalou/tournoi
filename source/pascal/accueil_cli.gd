extends Node


var round_index=0
var total_players= 6
var round_indexsMaths_node
var total_players_node
var round_index_node
var allgame_node


var Game= preload("res://Game.gd")
var game


var newMatch= load("res://vrac/bouton_participant.tscn")


func _ready():
	game= Game.new(6)
	
	
	print(game.opponent(3,0))
	
	
	round_indexsMaths_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/richlab_tour
	total_players_node= $MarginContainer/VBoxContainer/HboxGenerate/lab_participants
	round_index_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex
	allgame_node= $MarginContainer/VBoxContainer/HBoxContainer/vboxTours/HBoxContainer/allTournoi
	#add_child(node_newScene)
	#add_child(newMatch)
	
	updateAllText()
	
	
	var node_newMatch1= newMatch.instance()
	node_newMatch1.me_id= 0
	node_newMatch1.other_id= game.opponent(0, round_index)
	node_newMatch1.state= 1
	node_newMatch1.rect_position = Vector2(0,0)
	allgame_node.add_child(node_newMatch1)
	node_newMatch1.connect("is_pressed", self, "changement_resultat_handler")
	
	
	var node_newMatch2= newMatch.instance()
	node_newMatch2.me_id= 2
	node_newMatch2.other_id= game.opponent(node_newMatch2.me_id, round_index)
	node_newMatch2.state= 2
	node_newMatch2.rect_position = Vector2(0,50)
	allgame_node.add_child(node_newMatch2)
	node_newMatch2.connect("is_pressed", self, "changement_resultat_handler")
	
	
	

# 
func changement_resultat_handler(id1, id2, state):
	print ("changement résultats : ", id1," vs ", id2," → " , state)
	


# gestion des boutons et des différents appels
func _on_bt_more_pressed():
	total_players += 1
	game = Game.new(total_players)
	updateAllText()


func _on_bt_less_pressed():
	if total_players == 2: return null
	total_players -= 1
	game = Game.new(total_players)
	round_index= min(total_players-1,round_index)
	updateAllText()


func _on_bt_next_round_pressed():
	if round_index == total_players-2 : return null
	round_index += 1
	updateAllText()


func _on_bt_previous_round_pressed():
	if round_index == 0: return null
	round_index -= 1
	updateAllText()


func _process(delta):
	pass


# Gestion  des affichages
func update_rounds_text():
	var texte=""
##	nbround_index= total_players-1
	for i in range (total_players):
		texte+= str(i) + " vs " + str(game.opponent(i, round_index)) + "\n"
	texte+= "\n"
	round_indexsMaths_node.set_text(texte)


func update_total_players_text():
	total_players_node.set_text("Nombre de participants : %3s" % total_players)


func update_round_index_text():
	var texte= "Tour n° %3s" % round_index
	round_index_node.set_text(texte)


func updateAllText () :	
	update_total_players_text()
	update_round_index_text()
	update_rounds_text()