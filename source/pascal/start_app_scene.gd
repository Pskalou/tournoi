extends MarginContainer


func _ready():
	
	Global.main= self
	
	# scène principale
	Global.main.add_child(Global.accueil_menu)
	Global.main.add_child(Global.new_match_menu)
	Global.main.add_child(Global.tournoi)
	
	Global.accueil_menu.visible= true
	Global.new_match_menu.visible= false
	Global.tournoi.visible= false
