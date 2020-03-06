# Cette classe à en charge la gestion de la répartition des matchs. 
#
# Pour chaque tour, l'algorithme génère la liste des matchs.
#
# En notant n le nombre de participant, le modèle de donné utilisé est une matrice carrée M de dimension n.
# Pour deux participants d'identifiants les nombres entiers i et ,
# M(i,j) est égal au tour durant lequel les participants i et j se rencontrent.
class_name Game_generator


var _matrix= []
var _total_players
var _total_rounds


func _init():
	self._total_players= Global.get_total_players()
	self._total_rounds= _total_players-1
	self._matrix= _game_matrix(_total_players)
	print("Partie créé avec ",_total_players, " players")


# Retourne l'identifiant de l'adversaire de 'player_id' lors du tour 'round_index'.
# S'il n'y a pas d'adversaire (tour impair par exemple), la méthode retourne -1.
func opponent(player_id:int, round_index:int) -> int:
	assert(round_index <= _total_rounds )
	assert( player_id  <= _total_players)
	# if (round_index > _total_rounds || player_id > _total_players) : return null
	for i in range(_total_players):
		if _matrix[player_id][i]==round_index: return i
	return -1


func _empty_matrix (n):
	var tab=[0]
	tab.resize(n)
	for i in range (n):
		var ligne= [0]
		ligne.resize(n)
		tab[i]=ligne
	return tab


func _even_matrix(n):
	var tab= _empty_matrix(n)
    # remplissage du tableau entier
    # chaque ligne décallée de 1 par rapport à la précédente
	for i in range(n):
		for j in range (n):
			tab[i][j] = (j+i-1)%(n-1)  
    # remplissage de la dernière colonne et dernière ligne
	var val
	for i in range(n):
		val= (n+2*i-2)%(n-1)
		tab[i][n-1]= val        
		tab[n-1][i]= val
    # remplissage de la diagonale avec -1
	for i in range(n):
		tab[i][i]= -1
	return tab


func _odd_matrix(n):
	var tab= _empty_matrix(n)
    # un tableau impaire sera un extrait du tableau
    # paire de dimension n+1
	var even_tab= _even_matrix(n+1)
	for i in range (n):
		for j in range(n):
			tab[i][j]= even_tab[i][j]
	return tab


func _game_matrix(n):
    # deux cas en fonction du nombre paire
    # ou impaire de participants
    if n%2 ==0:
        return _even_matrix (n)
    else:
        return _odd_matrix (n)