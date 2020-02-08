extends Control


# définition des boutons de la scène
var history_btn
var new_btn
var options_btn

func _ready():
	
	# raccourcis boutons
	history_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/history_btn	
	new_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/new_btn
	options_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/options_btn


# clic sur nouveau tournoi
func _on_new_btn_pressed():
	# supprimer transparence bouton
	Global.button_init(new_btn)
	
	# cacher accueil / tournoi
	# afficheer la page paramètres
	Global.accueil_menu.visible= false
	Global.new_match_menu.visible= true
	Global.tournoi.visible= false
	
	Global.new_match_menu.modulate= Color(1,1,1,1)


# survol des boutons
# changement de transparence
func _on_new_btn_mouse_entered():
	Global.button_hover(new_btn)
func _on_new_btn_mouse_exited():
	Global.button_init(new_btn)
	
func _on_history_btn_mouse_entered():
	pass
	#history_btn.modulate= Color(1,1,1,0.5)
func _on_history_btn_mouse_exited():
	pass
	#history_btn.modulate= Color(1,1,1,1)

func _on_options_btn_mouse_entered():
	pass
	#options_btn.modulate= Color(1,1,1,0.5)
func _on_options_btn_mouse_exited():
	pass
	#options_btn.modulate= Color(1,1,1,1)

