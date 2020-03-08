# Cette classe a en charge la création et la gestion les boutons de duels.
# Elle fait le lien entre les clics et le score.
class_name Round_buttons


var _game
var _score

# liste de tous les boutons de duels du round en cours
var _round_buttons_list = []


func _init():
	self._game= Global.game
	self._score= Global.score
	print("Boutons du round créé => liste de boutons créé")


# Fonction utilisée pour vider le tableau d'objets.
# Supprime tous les anciens boutons.
func kill():
	while _round_buttons_list:
		_round_buttons_list.pop_back().queue_free()


# Crée l'ensemble des boutons pour un round donné
#
# entrée : 
#
# * round_index : le round concerné
# * current_node: le node dans lequel on va instancier les boutons
#
# sortie :
#
# * tableau de tous les boutons
func build(round_index:int, current_node:Node) -> Array:
	var total_players= Global.get_total_players()
	# identifiants des 2 adversaires
	var id1
	var id2
	
	# précharger un bouton 
	var _duel_button= load("res://duel_button.tscn")
	
	# vecteur utilisé pour la translation entre 2 boutons
	var pos= Vector2(0,0)
	
	# liste de id des joueurs (0 à n-1)
	var players_list= range(total_players)
	var i= 0
	var current_match: Duel_button
	
	# tant qu'il y a des couples de joueurs
	# créer un bouton entre un joueur (id1) et (s'il existe) son adversaire (id2)
	while len(players_list) > 1:
		# définir le joueur et son adversaire
		id1= players_list.pop_front()
		id2= _game.opponent(id1, round_index)
		
		# clause de garde si pas d'adversaire
		if id2 == -1:	continue
		else:			players_list.erase(id2)
		
		# création d'une instance de duel_button
		current_match= _duel_button.instance()
		_round_buttons_list.append(current_match)
		
		# initialisation du duel_button : identifiants, état sauvegardé et position
		current_match.initialisation(id1 , id2)
		current_match.set_state(_score.get_result(id1, id2))
		current_match.rect_position= pos 

		# affichage de l'instance
		current_node.add_child(current_match)
		
		# mise en place du signal lors d'un clic sur le bouton
		current_match.connect("is_pressed", self, "_changement_resultat_handler")
		
		# boucle suivante
		pos += Vector2(0, 50)
		i= i+1
	
	
	# retourne le tableau de tous les boutons
	return _round_buttons_list


func _changement_resultat_handler(id1:int, id2:int, state:int) -> void:
	# mise à jour du tableau de resultats
	_score.set_result(id1,id2,state)
