extends MarginContainer

var _more_btn
var _less_btn
var _back_btn
var _ok_btn


var _total_text


func _ready():
	# définition des raccourcis boutons
	_ok_btn= $VBoxContainer/HBoxContainer/VBoxContainer2/ok_btn
	_back_btn= $VBoxContainer/HBoxContainer/VBoxContainer2/back_btn
	_less_btn= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/less_btn
	_more_btn= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/more_btn

	_total_text= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/total_text
	
	# update affichage
	_total_text.set_text(str(Global.get_total_players()))


func _alert():	
	modulate= Color(1,1,1,0.25)
	var alert= preload("res://not_saved_pop_up_menu.tscn").instance()
	Global.main.add_child(alert)


func _on_ok_btn_pressed():
	Global.accueil_menu.visible= false
	Global.new_match_menu.visible= false
	Global.game_set_results_menu.visible= true


func _on_back_btn_pressed():
	Global.accueil_menu.visible= true
	Global.new_match_menu.visible= false
	Global.game_set_results_menu.visible= false


func _on_more_btn_pressed():	
	"""
	augmenter le nombre de joueur et actualiser l'affichage
	"""
	if not Global.is_saved:
		Global.button_init(_more_btn)
		_alert()
		return null

	var total_players= Global.get_total_players()
	var game_set_results_menu= Global.game_set_results_menu
	
	total_players += 1
	
	# réinitialise le tournoi
	Global.set_total_players(total_players)
	game_set_results_menu.init()
	
	# update affichage
	_total_text.set_text(str(total_players))


func _on_less_btn_pressed():
	"""
	diminuer le nombre de joueurs
	actualiser l'affichage
	"""
	if not Global.is_saved:
		Global.button_init(_less_btn)
		_alert()
		return null

	var total_players= Global.get_total_players()
	var game_set_results_menu= Global.game_set_results_menu
	
	# clause de garde
	if total_players == 2: return null
	total_players -= 1
	
	# gestion de valeurs abhérantes
	var maxi
	if total_players % 2 == 0:
			maxi= total_players - 2
	else: 	maxi= total_players - 1
	game_set_results_menu.set_round_index(min(maxi,game_set_results_menu.get_round_index()))
	
	# réinitialise le tournoi
	Global.set_total_players(total_players)
	game_set_results_menu.init()
	
	# update affichage
	_total_text.set_text(str(total_players))


func _on_more_btn_mouse_entered():
	Global.button_hover(_more_btn)
func _on_more_btn_mouse_exited():
	Global.button_init(_more_btn)


func _on_less_btn_mouse_entered():
	Global.button_hover(_less_btn)
func _on_less_btn_mouse_exited():
	Global.button_init(_less_btn)


func _on_ok_btn_mouse_entered():
	Global.button_hover(_ok_btn)
func _on_ok_btn_mouse_exited():
	Global.button_init(_ok_btn)


func _on_back_btn_mouse_entered():
	Global.button_hover(_back_btn)
func _on_back_btn_mouse_exited():
	Global.button_init(_back_btn)
