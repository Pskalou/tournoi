extends Node
#var newScene= preload("res://newTournoiMenu.tscn")
#var node_newScene= newScene.instance()

var newMatch= preload("res://bouton_participant.tscn")
var node_newMatch= newMatch.instance()


func emptyMatrix (n):
	var tab=[0]
	tab.resize(n)
	for i in range (n):
		var ligne= [0]
		ligne.resize(n)
		tab[i]=ligne
	return tab


func matrice_nbPaire(n):
	var tab= emptyMatrix(n)
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


func matrice_nbImpaire(n):
	var tab= emptyMatrix(n)
    # un tableau impaire sera un extrait du tableau
    # paire de dimension n+1
	var tab_paire= matrice_nbPaire(n+1)
	for i in range (n):
		for j in range(n):
			tab[i][j]= tab_paire[i][j]
	return tab

func matrice_tournoi(n):
    # deux cas en fonction du nombre paire
    # ou impaire de participants
    if n%2 ==0:
        return matrice_nbPaire (n)
    else:
        return matrice_nbImpaire (n)


func adversaire(participant, tour):
	if (tour > nbTour || participant > nbParticipants) : return null
	for i in range(nbParticipants):
		if tournoi[participant][i]==tour: return i


func match(tour):
	var result=[]
	var texte
	for i in range(nbParticipants):
		texte = "%s vs %s" % [i, adversaire(i, tour)]
		result.append(texte)
	return result


func allMatchsTextGenerator() :
	tournoi = matrice_tournoi(nbParticipants)
	nbTour= nbParticipants-1
	var current= "Tous les matchs :\n\n"
	for k in range (nbTour):
		current += "Tour n°" + str(k+1) + "\n"
		for i in match(k):
			current += str(i) + "\t"
		current+= "\n\n"
	return current


func allTourMatchsTextGenerator(tour) :
	var current=""
	tournoi = matrice_tournoi(nbParticipants)
	nbTour= nbParticipants-1
	for i in range (nbParticipants):
		current+= str(i) + " vs " + str(adversaire(i, tour-1)) + "\n"
	current+= "\n"
	return current


func updateTextTourMatchs():
	var texte= allTourMatchsTextGenerator(tourIndex)
	$MarginContainer/VBoxContainer/HBoxContainer/vboxTours/richlab_tour.set_text(texte)


func updateTextNumberPlayers():
	$MarginContainer/VBoxContainer/HboxGenerate/lab_participants.set_text("Nombre de participants : %3s" % nbParticipants)


var tourIndex=1
func updateTextTourIndex():
	var texte= "Tour n° %3s" % tourIndex
	$MarginContainer/VBoxContainer/HBoxContainer/vboxTours/hbox_tour/lab_tourIndex.set_text(texte)


func updateAllText () :	
	updateTextNumberPlayers()
	updateTextTourIndex()
	updateTextTourMatchs()


func _on_bt_more_pressed():
	nbParticipants += 1
	updateAllText()


func _on_bt_less_pressed():
	if nbParticipants == 2: return null
	nbParticipants -= 1
	tourIndex= min(nbParticipants-1,tourIndex)
	updateAllText()


func _on_bt_tourIndexNext_pressed():
	if tourIndex == nbParticipants-1 : return null
	tourIndex += 1
	updateAllText()


func _on_bt_tourIndexPrev_pressed():
	if tourIndex == 1: return null
	tourIndex -= 1
	updateAllText()


var nbParticipants= 6
var tournoi = matrice_tournoi(nbParticipants)
var nbTour= nbParticipants-1


func _ready():
	#add_child(node_newScene)
	add_child(newMatch)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	updateAllText()
	$MarginContainer/VBoxContainer/HBoxContainer/vboxTours/richlab_tour.add_child(newMatch)
	

func _process(delta):
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass