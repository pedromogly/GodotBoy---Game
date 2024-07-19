extends CharacterBody3D

@onready var animation = get_node("gobot/AnimationPlayer") as AnimationPlayer

var speed = 200.0
var JUMP_VELOCITY = 10.0
var gravity = 0
@export var view:Node3D
var jumps_ready:int = 2

var movement_eixo:Vector3
var rotation_direction:float

func _ready():
	print("Character Script Runing...")

func _physics_process(delta):
	handle_input(delta)
	apply_gravity(delta)
	jump(delta)
	handle_animations()
	move_and_slide()

func handle_input(delta):
	var input:Vector3
	input.x = Input.get_axis("go_esquerda","go_direita")
	input.z = Input.get_axis("go_frente","go_atras")
	
	input = input.rotated(Vector3.UP, view.rotation.y).normalized()
	
	velocity = input * speed * delta
	
	if Vector2(velocity.z,velocity.x).length() > 0:
		rotation_direction = Vector2(velocity.z,velocity.x).angle()
	
	rotation.y = lerp_angle(rotation.y,rotation_direction, delta * 10)

func apply_gravity(delta):
	if !is_on_floor():
		gravity += 25 * delta
	var applied_gravity = velocity.lerp(movement_eixo, delta * 10)
	applied_gravity.y = -gravity
	velocity = applied_gravity

func jump(delta):
	
	if is_on_floor():
		jumps_ready = 2
	if Input.is_action_just_pressed("go_pular") and jumps_ready > 1:
		gravity = -JUMP_VELOCITY
		jumps_ready -= 1
	
	if gravity > 0 and is_on_floor():
		gravity = 0

func handle_animations():
	if is_on_floor():
		if abs(velocity.x) > 1 or abs(velocity.z) > 1:
			animation.play("Run",0.5)
		else:
			animation.play("Idle",0.5)
	else:
		animation.play("Jump", 0.3)
	
	if !is_on_floor() and gravity > 2:
		animation.play("Fall", 0.3)

