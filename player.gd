extends CharacterBody3D

@onready var animator = get_node("gobot/AnimationPlayer") as AnimationPlayer

const speed = 200.0
const JUMP_VELOCITY = 10.0
var gravity = 0

@export var view:Node3D

var movement_eixo:Vector3
var rotation_direction:float

func _physics_process(delta):
	handle_input(delta)
	apply_gravity(delta)
	jump(delta)
	move_and_slide()

func handle_input(delta):
	var input:Vector3
	input.x = Input.get_axis("go_esquerda","go_direita")
	input.z = Input.get_axis("go_frente","go_atras")
	
	input = input.rotated(Vector3.UP, view.rotation.y).normalized()
	 
	velocity = input * speed * delta

func apply_gravity(delta):
	if !is_on_floor():
		gravity += 25 * delta
	
	var applied_gravity:Vector3
	applied_gravity = velocity.lerp(movement_eixo, delta * 10)
	applied_gravity.y = -gravity
	velocity = applied_gravity
	
func jump(delta):
	if Input.is_action_just_pressed("go_pular"):
		if is_on_floor():
			gravity -= JUMP_VELOCITY
	
	if gravity > 0 and is_on_floor():
		gravity = 0
