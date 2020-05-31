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
	
	# mise à jour affichage
	Global.emit_signal("actualise_affichage")


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


# Transforme le tableau des états en tableau de score
func _results_to_score_array():
	var total
	var state
	# génération du tableau de score
	var score_array= []
	for i in range(_total_players):
		score_array.append([])
		total= 0
		for j in range(_total_players):
			score_array[i].append(no_point)
			if _results[i].has(j):
				state= _results[i][j]
				if state == 1:	score_array[i][j]= win_points
				if state == 2:	score_array[i][j]= lose_points
				total += score_array[i][j]			
		score_array[i].append(total)
	return score_array


# Retourne le tableau des scores sous la forme d'un texte
# au format BBcode
# 
# Cette fonction transforme le tableau des états (0, 1 ou 2)
# en texte de score en fonction du barême par défaut.
#  * little= true  pour un tableau avec uniquement le total
#  * little= false pour un tableau détaillé
#
# TODO : rendre le barême par défaut modifiable (menu option)
func score_en_bbcode(little= false) -> String:
	if little:
		return _score_en_bbcode_little_screen()
	else:
		return _score_en_bbcode_big_screen()


# Affichage du tableau de score
# grand format détaillé + Total: 
#  * 1 participant par ligne
#  * 1 participant par colonne
#  * + colonne Total
# Le format de texte est BBcode en couleur
func _score_en_bbcode_big_screen() -> String:
	var score_array= _results_to_score_array()
	var texte= ""
	texte += "[font=res://assets/fonts/fonts_tab.tres]"
	# création d'un tableau de nb_col colonnes
	var nb_col= _total_players + 2
	
	texte += "[table=%s]" %str(nb_col)
	
	# ligne de titre
	texte += "[row]"
	texte += "[cell][center]"
	texte += " "
	texte += "[/center][/cell]"
	for j in range(_total_players) :
		texte += "[cell][center]"
		texte += "[color=#88ffffff]p%s[/color]" % str(j)
		texte += "[/center][/cell]"
	texte += "[cell][center]"
	texte += "Total"
	texte += "[/center][/cell]"
	texte += "[/row]"
	
	# ligne pour chaque joueur
	for i in len(score_array):
		texte += "[row]"
		texte += "[cell][center]"
		texte += "[font=res://assets/fonts/fonts_tab2.tres]"
		texte += "p" + str(i) + " "
		texte += "[/font]"
		texte += "[/center][/cell]"
		
		for j in len(score_array[i])-1:
			if j == i: 
				texte += "[cell][center]"
				texte += "—"
				texte += "[/center][/cell]"
				continue
			texte += "[cell][center]"
			var val = score_array[i][j]
			if val == no_point:
				texte += "[color=#88ffffff]"
			elif val == lose_points:
				texte += "[color=#ffff6666]"
			else:				
				texte += "[color=#ff99ff99]"
				
			texte += str(val)
			texte += "[/color]"
			texte += "[/center][/cell]"
		
		texte += "[cell][center]"
		texte += "[font=res://assets/fonts/fonts_tab2.tres]"
		texte += str(score_array[i][len(score_array[i])-1])
		texte += "[/font]"
		texte += "[/center][/cell]"
		texte += "[/row]"
	
	texte += "[/table]"
	texte += "[/font]"
	return texte

	
# Affichage du tableau de score
# petit format uniquement le Total
# Le format de texte est BBcode
func _score_en_bbcode_little_screen() -> String:
	var score_array= _results_to_score_array()
	var texte= ""
	texte += "[font=res://assets/fonts/fonts_tab.tres]"
	
	# création d'un tableau de nb_col colonnes
	texte += "[table=%s]" %str(4)
	
	# ligne pour chaque joueur
	texte += "[row]"
	for i in len(score_array):
		texte += "[cell][center]"
		texte += "[font=res://assets/fonts/fonts_tab2.tres]"
		texte += "p" + str(i) + ": "
		texte += str(score_array[i][len(score_array[i])-1])
		texte += " "
		texte += "[/font]"
		texte += "[/center][/cell]"
		if i%4 == 0:
			texte += "[/row]"
			texte += "[row]"
	
	texte += "[/table]"
	texte += "[/font]"
	return texte
