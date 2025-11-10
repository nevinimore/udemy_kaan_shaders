extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	pass

func _physics_process(_delta):
	pass

func _process(_delta):
	
	var mod_speed = Input.get_axis("set_speed_decrease", "set_speed_increase")
	var sprite_material: ShaderMaterial = sprite.material
	if mod_speed != 0:
		var old_velocity = sprite_material.get_shader_parameter("velocity_potency");
		sprite_material.set_shader_parameter("velocity_potency", old_velocity + mod_speed*.1)
	
	if Input.is_action_just_pressed("change_color"):
		var new_color: Vector4 = Vector4(randf(), randf(), randf(), 1)
		sprite_material.set_shader_parameter("sprite_color", new_color)
		
