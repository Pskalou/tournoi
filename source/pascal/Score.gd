# Class Score.gd
# gère le score


# on va modéliser le score par un tableau de dictionnaires
# une ligne => un jouer, puis pour le dictionnaire, clé/valeur <=> adversaire/state


var _results= []
var _total_players

func _init(total_players):
	self._total_players= total_players
	# intialisation du tableau de score
	for i in range (total_players):
		self._results.append({})
	print("Tableau de score créé vide pour ",_total_players," players")

func exist_result(id1, id2):
	if _results[id1].has(id2):	return true
	else: 						return false
	

func set_result(player_id, opponent_id, state):
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


func get_result(player_id, opponent_id):
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