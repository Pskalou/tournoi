extends MarginContainer


func _ready():
	
	Global.main= self
	
	# scène principale
	Global.main.add_child(Global.accueil)
	Global.main.add_child(Global.new_match_menu)
	Global.main.add_child(Global.tournoi)
	
	Global.accueil.visible= true
	Global.new_match_menu.visible= false
	Global.tournoi.visible= false
