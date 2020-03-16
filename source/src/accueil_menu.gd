# Script qui accompagne l'instanciation de la scène `accueil_menu.gd`.
# 
# Menu d'accueil de l'application Tournoi
# ce menu contient 3 sous menu
#  * nouveau tournoi
#  * historique
#  * options
class_name Accueil_menu
extends Control


# initialisation des nodes de la scène qui serviront de bouton
onready var _history_btn=	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/history_btn
onready var _new_btn= 		$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/new_btn
onready var _options_btn=	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/options_btn


func _ready():
	pass

	
# Signal qui va détecter un clic sur le bouton nouveau tournoi
func _on_new_btn_pressed() -> void:

	# supprimer transparence bouton (méthode globale définie dans Global.gd)
	Global.button_init(_new_btn)
	
	# cacher 	menu accueil & menu tournoi
	# afficher	menu paramètres
	Global.accueil_menu.visible= false
	Global.new_match_menu.visible= true
	Global.game_set_results_menu.visible= false
	
	# rendre le menu "nouveau tournoi" complètement visible
	# Global.new_match_menu.modulate= Color(1,1,1,1)


# effet de survol du bouton "nouveau tournoi" au passage de la souris
func _on_new_btn_mouse_entered() 	-> void:
	Global.button_hover(_new_btn)


# effet de survol du bouton "nouveau tournoi" au passage de la souris
func _on_new_btn_mouse_exited() 	-> void:
	Global.button_init(_new_btn)


# effet de survol du bouton "historique" au passage de la souris
func _on_history_btn_mouse_entered()-> void:
	Global.button_hover(_history_btn)


# effet de survol du bouton "historique" au passage de la souris
func _on_history_btn_mouse_exited()	-> void:
	Global.button_init(_history_btn)


# effet de survol du bouton "option" au passage de la souris
func _on_options_btn_mouse_entered()-> void:
	Global.button_hover(_options_btn)


	# effet de survol du bouton "option" au passage de la souris
func _on_options_btn_mouse_exited()	-> void:
	Global.button_init(_options_btn)