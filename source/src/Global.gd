# Classe globale chargée automatiquement lors du lancement de l'application 
# cette classe est globale (cf menu Projet > Paramètres du projet... > Autoload)
# car nous avons coché le design pattern "Singleton"
extends Node


# paramètres par défaut lors du lancement de l'application
var _total_players= 6
var is_saved= true


# lors d'un tournoi, game référence une instance de GameGenerator => algorithme de répartition des matchs
var game

# lors d'un tournoi, score référence une instance de ScoreManager => gestion du score
var score

# référence une instance de Round_buttons
# => pour un tour donné (round) contient et gère les duel_boutons
# => modifie l'état instantané du tournoi en fonction des clics
var round_buttons

# tableau qui contient, pour un tour donné, la liste des duel_boutons
var round_buttons_list

# définition du node racine qui va contenir toute les scènes de l'application
var main


# instanciation des scènes
# chaque scène est donc présente pendant l'application,
# mais toutes ne sont pas visibles en même temps
var accueil_menu= 			preload("res://accueil_menu.tscn").instance()
var new_match_menu= 		preload("res://new_match_menu.tscn").instance()
var game_set_results_menu= 	preload("res://game_set_results_menu.tscn").instance()


func set_total_players(nombre_de_joueurs):
	# setter pour le nombre de joueurs dans le tournoi actuel
	_total_players= nombre_de_joueurs
	

func get_total_players():
	# getter pour le nombre de joueurs dans le tournoi actuel

	return _total_players


func button_hover(button):
	# changement de style lors du survol d'un bouton de type TextureButton

	button.modulate= Color(1,1,1,0.5)


func button_init(button):
	# réinitialisation du syle des boutons TextureButton après le survol de la souris

	button.modulate= Color(1,1,1,1)
