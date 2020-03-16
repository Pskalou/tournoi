# La Classe globale chargée automatiquement lors du lancement de l'application.
# Elle stocke les informations essentielles et nécessaires à toutes les classes.
#
# Cette classe est globale et utilise le principe Singleton de Godot.
# (cf menu `Projet > Paramètres du projet... > Autoload` et cocher le design pattern "*Singleton*")
#
# Le nom *GlobalClass* est utilisé uniquement pour générer la doc
class_name Global_

extends Node


# attribut privé : nombre total de joueur (par défaut = 6)
var _total_players:int= 6


# Cet attribut indique si le tournoi a été modifié depuis la dernière sauvegarde.
# Si un risque de perdre les résultats en cours, une fenêtre modale  apparaît
# et demande si on est sûr d'être certain.
#
# Valeur par défaut : True
var is_saved:bool= true


# L'attribut *game* référence une instance de `GameGenerator`.
# C'est le moyen de déterminer l'`adversaire_id` en fonction du `round` et de `player_id`.
var game:Game_generator


# L'attribut `score` référence une instance de **ScoreManager**
# C'est la classe dédiée à la gestion du score.
var score:Score_manager


# L'attribut `round_button` référence une instance de `Round_buttons` :
#
# * contient et gère les `duel_boutons` (pour chaque round)
# * modifie l'état instantané du tournoi en fonction des clics
# * est détruite (queue_free) puis réinstanciée pour chaque roud
var round_buttons:Round_buttons


# Tableau de `int` qui contient, pour un tour donné, la liste des `duel_boutons`.
var round_buttons_list:Array


# Node racine de l'application. Ce node va contenir toute les scènes de l'application.
var main:MarginContainer


# Instance de la scène menu d'accueil de l'application. Visible ou pas en fonction de l'interface souhaitée.
var accueil_menu= 			preload("res://accueil_menu.tscn").instance()


# Instance de la scène menu de configuration d'un nouveau tournoi. Visible ou pas en fonction de l'interface souhaitée.
var new_match_menu= 		preload("res://new_match_menu.tscn").instance()


# Instance de la scène qui affiche le tournoi, les boutons et le score en direct.
# Visible ou pas en fonction de l'interface souhaitée.
var game_set_results_menu= 	preload("res://game_set_results_menu.tscn").instance()


# Setter pour définir le nombre de joueurs dans le tournoi actuel.
func set_total_players(nombre_de_joueurs:int) -> void:
	_total_players= nombre_de_joueurs
	

# Getter qui retourne le nombre de joueurs dans le tournoi actuel.
func get_total_players() -> int:
	return _total_players


# Méthode pour définir et homogénéiser l'ensemble des changement de style
# à appliquer lors du **survol d'un bouton** de type TextureButton.
func button_hover(button:TextureButton) -> void:
	button.modulate= Color(1,1,1,0.5)


# Méthode pour définir et homogénéiser l'ensemble des changement de style
# à appliquer pour réinitialiser le bouton de type TextureButton (après un survol de la souris).
func button_init(button):
	button.modulate= Color(1,1,1,1)
