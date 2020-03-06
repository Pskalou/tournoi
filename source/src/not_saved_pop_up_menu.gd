# script lié à la scène pop_up_not_saved.tscn
#
# affichage d'une alerte si le tournoi en cours n'est pas sauvegardé

extends MarginContainer

func _ready():
	print("alert : not saved")

func _on_confirm_btn_pressed():
	print("clic : confirmed")
	Global.is_saved= true
	Global.new_match_menu.modulate= Color(1,1,1,1)
	self.queue_free()

func _on_undo_btn_pressed():
	print("clic : undo")
	Global.new_match_menu.modulate= Color(1,1,1,1)
	self.queue_free()
