extends Control


func _ready():
	$Label.text = "%s" % Save.getCount()
	pass
	
func _on_Save_pressed():
	Save.setCount(Save.getCount()+1)
	$Label.text = "%s" % Save.getCount()
	Save.saveGame()
