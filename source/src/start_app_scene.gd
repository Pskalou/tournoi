# Script qui accompagne l'instanciation de la scène `start_app_scene.tscn`.
#
# Point d'entrée de l'application. 
# Cette classe instancie les scènes nécessaires à l'application.
class_name Start_app_scene

extends MarginContainer


func _ready():
	
	Global.main= self
	
	# scène principale
	Global.main.add_child(Global.accueil_menu)
	Global.main.add_child(Global.new_match_menu)
	Global.main.add_child(Global.game_set_results_menu)
	Global.main.add_child(Global.results_menu)
	
	Global.accueil_menu.visible= true
	Global.new_match_menu.visible= false
	Global.game_set_results_menu.visible= false
	Global.results_menu.visible= false
