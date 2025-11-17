extends CharacterBody2D

@export var max_velocity: float = 100
@export var walk_force: float = 15
@export var jump_force: float = 1000
@onready var animation: AnimatedSprite2D = $Animation

var has_jump: bool = false

func _physics_process(delta):
	
	
	if is_on_floor():
		has_jump = true
	else:
		velocity += get_gravity()*delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_force
	
	var dir_velocity: float = Input.get_axis("move_left", "move_right")
	
	if dir_velocity != 0 and dir_velocity*velocity.x>0:
		print(dir_velocity)
		if abs(velocity.x) < max_velocity:
			print(velocity)
			velocity.x += dir_velocity*walk_force*delta
		
	else:
		lerp
		
	
	
	move_and_slide()
	
	
	
	
	pass
