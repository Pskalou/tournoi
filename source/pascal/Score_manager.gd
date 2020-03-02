class_name Score_manager
# classe qui gère l'état du tournoi actuel
# l'état est ensuite converti en score 


# on va modéliser le score par un tableau de dictionnaires
# une ligne => un jouer, puis pour le dictionnaire, clé/valeur <=> adversaire/state
var _results= []

var _total_players:int


func _init():
	self._total_players= Global.get_total_players()
	# intialisation du tableau de score	avec des dictionnaires vides
	for _i in range (_total_players):
		self._results.append({})
	print("Tableau de score créé vide pour ",_total_players," players")


func exist_result(id1:int, id2:int) -> bool:
	# retourne vrai si les joueurs id1 et id2 se sont affrontés

	if _results[id1].has(id2):	return true
	else: 						return false


func set_result(player_id:int, opponent_id:int, state:int) -> void:
	# indiquer le résultat du match entre le player_id et son adversaire opponent_id
	#  state : 0 => non joué
	#  state : 1 => player gagne
	#  state : 2 => player perd

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


func get_result(player_id:int, opponent_id:int) -> int:
	# retourne l'état du match entre player_id et opponent_id
	#  -> 0 : match non joué
	#  -> 1 : player_id gagne
	#  -> 2 : player_id perd
	if player_id > _total_players: return 0
	if ! _results[player_id].has(opponent_id): return 0
	return _results[player_id][opponent_id]


var win_points = 10
var lose_points= 5
var no_point   = 0


func score_en_texte():
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
