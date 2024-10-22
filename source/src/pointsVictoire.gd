# Page en construction - Menu "Points pour une Victoire"
extends MarginContainer

var more_btn
var less_btn
var back_btn
var ok_btn

var total_text

func _ready():
	# définition des raccourcis boutons
	ok_btn= $VBoxContainer/HBoxContainer/VBoxContainer2/ok_btn
	back_btn= $VBoxContainer/HBoxContainer/VBoxContainer2/back_btn
	less_btn= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/less_btn
	more_btn= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/more_btn
	
	total_text= $VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/win_points
	
	# update affichage sur le nombre de points pour une victoire
	total_text.set_text(str(Global.get_win_points()))

func _alert():	
	modulate= Color(1,1,1,0.25)
	var alert= preload("res://not_saved_pop_up_menu.tscn").instance()
	Global.main.add_child(alert)

func _on_ok_btn_pressed():

	Global.accueil.visible= false
	Global.new_parameters.visible= false
	Global.tournoi.visible= true

func _on_back_btn_pressed():
	Global.accueil.visible= true
	Global.new_parameters.visible= false
	Global.tournoi.visible= false


func _on_more_btn_pressed():	
	"""
	augmenter le nombre de points et actualiser l'affichage
	"""
	if not Global.is_saved:
		Global.button_init(more_btn)
		_alert()
		return null

	var victory_points= Global.get_win_points()
	var tournoi= Global.tournoi
	
	victory_points += 5
	
	# réinitialise le tournoi
	Global.set_total_players(victory_points)
	tournoi.init()
	
	# update affichage
	total_text.set_text(str(victory_points))
		


func _on_less_btn_pressed():
	"""
	diminuer le nombre de points
	actualiser l'affichage
	"""
	if not Global.is_saved:
		Global.button_init(less_btn)
		_alert()
		return null

	var victory_points= Global.get_victory_points()
	var tournoi= Global.tournoi

	# réinitialise le tournoi
	Global.set_total_players(victory_points)
	tournoi.init()
	
	# update affichage
	total_text.set_text(str(victory_points))


func _on_more_btn_mouse_entered():
	Global.button_hover(more_btn)
func _on_more_btn_mouse_exited():
	Global.button_init(more_btn)

func _on_less_btn_mouse_entered():
	Global.button_hover(less_btn)
func _on_less_btn_mouse_exited():
	Global.button_init(less_btn)

func _on_ok_btn_mouse_entered():
	Global.button_hover(ok_btn)
func _on_ok_btn_mouse_exited():
	Global.button_init(ok_btn)

func _on_back_btn_mouse_entered():
	Global.button_hover(back_btn)
func _on_back_btn_mouse_exited():
	Global.button_init(back_btn)
