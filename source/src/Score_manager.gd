# Cette classe gère l'état du tournoi actuel. 
# Dans un second temps, l'état est converti en score.
class_name Score_manager


# Barême pour une victoire.
# Par défaut égal à 10
#
# TODO : privatiser la propriété (set/get)
var win_points	:int= 10

# Barême pour une défaite.
# Par défaut égal à 5 car nous souhaitons valoriser la participation à un match.
#
# TODO : privatiser la propriété (set/get)
var lose_points	:int= 5

# Barême pour une absence de math.
# Par défaut égal à 0.
#
# TODO : privatiser la propriété (set/get)
var no_point  	:int= 0


# l'état du tournoi sera représenté par un tableau de {}
# une ligne => un joueur_id, puis pour le dictionnaire, clé/valeur <=> adversaire/state
var _results= []


var _total_players:int


func _init():
	self._total_players= Global.get_total_players()
	# intialisation du tableau de score	avec des dictionnaires vides
	for _i in range (_total_players):
		self._results.append({})
	print("Tableau de score créé vide pour ",_total_players," players")


# Cette méthode permet de savoir si un match a eu lieu.
# Retourne vrai si les joueurs id1 et id2 se sont affrontés
func exist_result(id1:int, id2:int) -> bool:

	if _results[id1].has(id2):	return true
	else: 						return false



# Défini l'état d'un match entre player_id et son adversaire opponent_id.
# 
# * state : 0 => non joué
# * state : 1 => player_id gagne
# * state : 2 => player_id perd
#
# TODO : les états 0/1/2 doivent être internes à la classe.
# Les autres classes n'ont pas à connaître ce fonctionnement.
func set_result(player_id:int, opponent_id:int, state:int) -> void:

	if state == 0:
		_results[player_id].erase(opponent_id)
		_results[opponent_id].erase(player_id)
	if state == 1:
		_results[player_id][opponent_id]= 1
		_results[opponent_id][player_id]= 2
	if state == 2:
		_results[player_id][opponent_id]= 2
		_results[opponent_id][player_id]= 1
	print("player_id:",player_id, ", opponent_id:", opponent_id, ", state:", state)
	
	# tableau modifié et non sauvegardé
	Global.is_saved= false


# Retourne l'état d'un match entre player_id et son adversaire opponent_id.
# 
# * retourne : 0 => non joué
# * retourne : 1 => player gagne
# * retourne : 2 => player perd
#
# TODO : les états 0/1/2 doivent être internes à la classe.
# TODO : utiliser des prédicats ? retourner uniquement les scores  ?
func get_result(player_id:int, opponent_id:int) -> int:
	if player_id > _total_players: return 0
	if ! _results[player_id].has(opponent_id): return 0
	return _results[player_id][opponent_id]


# Transforme le tableau des états en score en utilisant le barême.
#
# TODO : version CLI à passer en GUI
func score_en_texte() -> String:
	var total
	var state
	var score_array= []
	for i in range(_total_players):
		score_array.append([])
		total= 0
		for j in range(_total_players):
			score_array[i].append(no_point)
			if _results[i].has(j):
				state= _results[i][j]
				if state == 1:	score_array[i][j]= win_points
				if state == 2:  score_array[i][j]= lose_points
				total += score_array[i][j]			
		score_array[i].append(total)

	var texte= ""
	for i in len(score_array):
		for j in len(score_array[i])-1:
			if j == i: continue
			texte += str(score_array[i][j]) + "\t"
		texte += "\t→\t" + str(score_array[i][len(score_array[i])-1])
		texte += "\n"
	return texte
