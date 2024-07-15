class_name PlayerProgress extends Resource

var nick: String
var level: int

func _init(nick,level = 1):
	nick = nick
	save_player(nick)

func save_player(filename: String):
	var filepath = "res://scripts/database/players/"+filename+".tres"
	ResourceSaver.save(self, filepath)
	
func load_player(filename: String):
	var filepath = "res://scripts/database/players/"+filename+".tres"
	ResourceLoader.load(filepath)


