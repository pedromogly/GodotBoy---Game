class_name PlayerData

var nickname:String
var str:int
var agi:int
var vit:int
var wis:int

func _init(nickname:String,str=9,agi=9,vit=9,wis=9):
	nickname = nickname

func addAtt(status:PlayerData, add):
	status += add
