extends MarginContainer

func _ready():
	print("alert : not saved")

func _on_confirm_btn_pressed():
	print("clic : confirmed")
	Global.is_saved= true
	Global.new_parameters.modulate= Color(1,1,1,1)
	self.queue_free()

func _on_undo_btn_pressed():
	print("clic : undo")
	Global.new_parameters.modulate= Color(1,1,1,1)
	self.queue_free()