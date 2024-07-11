extends StaticBody3D

@export var speed = 6
@export var velocityChar := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rollZ:Vector3 = Vector3(0,0,1) * speed
	rotation += rollZ
	
	var input_direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	var local_direction = Vector3(input_direction.x,0,input_direction.y)
	var global_direction = (transform.basis * local_direction)
	
	
	
	
	
