# script associé à la scène bouton_participant
# affiche 2 "boutons" liés entres eux par la couleur

extends TextureButton

# 3 couleurs
var lost_color= Color(0.492188,0.136505,0.136505)
var win_color=  Color(0.155957,0.492188,0.136505)
var neutral_color= Color(0.414062,0.414062,0.414062)

# 3 états : 0 match nul, 1 je gagne, 2 je pers
var state= 0

# valeurs par défaut (id et label)
var player_id= 1
var me_name
var opponent_id= 2
var opponent_name

signal is_pressed


func _ready():
	# initialisation des labels
	me_name= "participant "+str(player_id)
	opponent_name= "participant "+str(opponent_id)
	$VBoxContainer/me.set_text(me_name)
	$VBoxContainer/other.set_text(opponent_name)
		
	# initialisation des couleurs
	update_color()


func update_color():
	if state==0 :
		$VBoxContainer/me/fonds.modulate = neutral_color
		$VBoxContainer/other/fonds.modulate= neutral_color
	if state==1:
		$VBoxContainer/me/fonds.modulate = win_color
		$VBoxContainer/other/fonds.modulate= lost_color
	if state==2:
		$VBoxContainer/me/fonds.modulate = lost_color
		$VBoxContainer/other/fonds.modulate= win_color 


func _on_clic_pressed():
	state = (state+1)%3
	update_color()
	
	emit_signal("is_pressed", player_id, opponent_id, state)
