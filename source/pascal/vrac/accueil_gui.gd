extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var newScene= preload("res://newTournoiMenu.tscn")
var node_newScene= newScene.instance()

var nbParticipants= 6

var nbTour= nbParticipants-1

var tournoi = [	[-1, 1, 2, 3, 4, 0],
				[ 1,-1, 3, 4, 0, 2],
				[ 2, 3,-1, 0, 1, 4],
				[ 3, 4, 0,-1, 2, 1],
				[ 4, 0, 1, 2,-1, 3],
				[ 0, 2, 4, 1, 3,-1]]

func adversaire(participant, tour):
	if (tour > nbTour || participant > nbParticipants) : return null
	for i in range(nbParticipants):
		if tournoi[participant][i]==tour: return i

func match(tour):
	var result=[]
	var texte
	for i in range(nbParticipants/2):
		texte = "%s vs %s" % [i, adversaire(i, 0)]
		result.append(texte)
	return result



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for i in range (nbParticipants):
		print(i, " vs ", adversaire(i, 0))
	print(match(0))
	get_node("MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/TextureButton_new").connect("pressed", self, "_on_TextureButton_new_pressed")


var accum= 0
func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass


func _on_TextureButton_new_pressed():
	get_node("MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/TextureButton_options").set_rotation(100)
	get_node("MarginContainer/HBoxContainer/CenterContainer/TextureRect_illustration").free()
	add_child(node_newScene)
