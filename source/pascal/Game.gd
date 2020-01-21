# Class Matrix.gd
# gère la répartition des matchs, tour par tour, adversaire par adversaire
# utilise l'algorithme python du notebook


var _matrix= []
var _total_players
var _total_rounds

func _init(total_players):
	self._total_players= total_players
	self._total_rounds= total_players-1
	self._matrix= _game_matrix(total_players)
	print("Partie créé avec ",total_players, " players")



func opponent(player, round_index):
	"""
	retourne l'adversaire de 'player' lors du tour 'round_index'
	"""
	if (round_index > _total_rounds || player > _total_players) : return null
	for i in range(_total_players):
		if _matrix[player][i]==round_index: return i


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



