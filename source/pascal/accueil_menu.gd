extends Control
# Menu d'accueil de l'application Tournoi
# ce menu contient 3 sous menu
#  * nouveau tournoi
#  * historique
#  * options

# variables privées : les éléments de la scènes qui serviront de bouton
var _history_btn
var new_btn
var options_btn


func _ready():
	# initialisation des variables privées vers les sprites de la scène
	_history_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/history_btn	
	new_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/new_btn
	options_btn= $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/options_btn


func _on_new_btn_pressed():
	# Signal qui va détecter un clic sur le bouton nouveau tournoi

	# supprimer transparence bouton (méthode globale définie dans Global.gd)
	Global.button_init(new_btn)
	
	# cacher 	menu accueil & menu tournoi
	# afficher	menu paramètres
	Global.accueil_menu.visible= false
	Global.new_match_menu.visible= true
	Global.game_set_results_menu.visible= false
	
	# rendre le menu "nouveau tournoi" complètement visible
	# Global.new_match_menu.modulate= Color(1,1,1,1)



func _on_new_btn_mouse_entered():
	# effet de survol du bouton "nouveau tournoi" au passage de la souris
	Global.button_hover(new_btn)


func _on_new_btn_mouse_exited():
	# effet de survol du bouton "nouveau tournoi" au passage de la souris
	Global.button_init(new_btn)


func _on_history_btn_mouse_entered():
	# effet de survol du bouton "historique" au passage de la souris
	Global.button_hover(_history_btn)


func _on_history_btn_mouse_exited():
	# effet de survol du bouton "historique" au passage de la souris
	Global.button_init(_history_btn)


func _on_options_btn_mouse_entered():
	# effet de survol du bouton "option" au passage de la souris
	Global.button_hover(options_btn)


func _on_options_btn_mouse_exited():
	# effet de survol du bouton "option" au passage de la souris
	Global.button_init(options_btn)
