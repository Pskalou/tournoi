# Classe associée à la scène `duel_button.tscn`.
#
# Affiche 2 boutons associés à 2 adversaires : le _player_id et son _opponent_id. 
# Un clic sur les boutons modifie l'état du match (`_state`) en fonction de la victoire, défaite ou non joué.
#
# L'information se transmet via les signaux.
class_name Duel_button
extends TextureButton

# 3 couleurs
var _lost_color= Color(0.492188,0.136505,0.136505)
var _win_color=  Color(0.155957,0.492188,0.136505)
var _neutral_color= Color(0.414062,0.414062,0.414062)

# 3 états : 0 match nul, 1 je gagne, 2 je pers
var _state= 0


# valeurs par défaut (id et label)
var _player_id= 1
var _me_name
var _opponent_id= 2
var _opponent_name

signal is_pressed

# Défini le nouvel état dans le match opposant player_id et opponent_id. 
#
# * 0 : non joué
# * 1 : player_id gagne
# * 2 : player_id perd
func set_state(new_state:int) -> void :
	self._state= new_state


# Initialise l'instance de duel_button avec les identifiants :
#
# * player_id : joueur de référence
# * opponent_id : adversaire
func initialisation(player_id:int, opponent_id:int) -> void :
	self._player_id= player_id
	self._opponent_id= opponent_id


func _ready():
	# initialisation des labels
	_me_name= "participant "+str(_player_id)
	_opponent_name= "participant "+str(_opponent_id)
	$VBoxContainer/me.set_text(_me_name)
	$VBoxContainer/other.set_text(_opponent_name)
		
	# initialisation des couleurs
	_update_color()


func _update_color():
	if _state==0 :
		$VBoxContainer/me/fonds.modulate = _neutral_color
		$VBoxContainer/other/fonds.modulate= _neutral_color
	if _state==1:
		$VBoxContainer/me/fonds.modulate = _win_color
		$VBoxContainer/other/fonds.modulate= _lost_color
	if _state==2:
		$VBoxContainer/me/fonds.modulate = _lost_color
		$VBoxContainer/other/fonds.modulate= _win_color 


func _on_clic_pressed():
	_state = (_state+1)%3
	_update_color()
	
	emit_signal("is_pressed", _player_id, _opponent_id, _state)
