# Class Round_buttons
# affiche la liste des boutons


var _game
var _score
var _round_buttons_list = []


func _init():
	self._game= Global.game
	self._score= Global.score
	print("Boutons du round créé => liste de boutons créé")


func kill():
	"""
	Fonction utilisée pour vider le tableau d'objets
	elle permet d'effacer de l'écran les anciens boutons
	"""
	while _round_buttons_list:
		_round_buttons_list.pop_back().queue_free()



func build(round_index, current_node):
	"""
	entrée : le round concerné, le node dans lequel on va instancier les boutons
	fonction retourne le tableau d'état d'un match pour un round bien précis
	"""
	var total_players= Global.get_total_players()
	# identifiants des 2 adversaires
	var id1
	var id2
	
	# précharger un bouton 
	var newMatch= load("res://duel_button.tscn")
	
	# vecteur utilisé pour la translation entre 2 boutons
	var pos= Vector2(0,0)
	
	# liste de id des joueurs (0 à n-1)
	var players_list= range(total_players)
	var i= 0
	var current_match
	
	# tant qu'il y a des couples de joueurs
	# créer un bouton entre un joueur (id1) et (s'il existe) son adversaire (id2)
	while len(players_list) > 1:
		# définir le joueur et son adversaire
		id1= players_list.pop_front()
		id2= _game.opponent(id1, round_index)
		
		# clause de garde si pas d'adversaire
		if id2 == null:	continue
		else:			players_list.erase(id2)
		
		# création des instances des boutons
		_round_buttons_list.append(newMatch.instance())
		current_match= _round_buttons_list[i]
		
		_round_buttons_list[i].player_id= id1
		_round_buttons_list[i].opponent_id= id2
		# initialisation des états
		_round_buttons_list[i].state= _score.get_result(id1, id2)
		# initialisation de la position
		current_match.rect_position= pos 
		# affichage de l'instance
		current_node.add_child(_round_buttons_list[i])
		
		# mise en place du signal lors d'un clic sur le bouton
		_round_buttons_list[i].connect("is_pressed", self, "changement_resultat_handler")
		
		# boucle suivante
		pos += Vector2(0, 50)
		i= i+1
	
	
	# retourne le tableau de tous les boutons
	return _round_buttons_list


func changement_resultat_handler(id1, id2, state):
	# mise à jour du tableau de resultats
	_score.set_result(id1,id2,state)
