extends Label3D


var start_rotation = Vector3(0,0,0)
var final_rotation = Vector3(0,0,180)

var plus = true
var speed = 50

func _ready():
	var player = PlayerProgress.new('vagabundo')
	print(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(rotation_degrees)
	if plus:
		rotation_degrees += Vector3(0,0,speed) * delta
		rotation_degrees = clamp(rotation_degrees,start_rotation,final_rotation)
		if(rotation_degrees == final_rotation):
			plus = false
	if !plus:
		rotation_degrees -= Vector3(0,0,speed) * delta
		rotation_degrees = clamp(rotation_degrees,start_rotation,final_rotation)
		if(rotation_degrees == start_rotation):
			plus = true
