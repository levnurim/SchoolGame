extends Node

var context = {}

func getCount():
	if "count" in context:
		return context.count
	return 0
	
func setCount(c):
	context.count = c
	

func saveGame():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_string(to_json(context))
	save_game.close()

func loadGame():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return 
		
	save_game.open("user://savegame.save", File.READ)
	var jsonFile = save_game.get_as_text()
	print(jsonFile)
	context = parse_json(jsonFile)
	save_game.close()
	
func _ready():
	loadGame()
	pass

