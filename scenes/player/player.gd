extends CharacterBody2D

class_name Player

@export var speed_multiplier: float = 1
@export var jump_multiplier: float = 1

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer:Timer  = $CoyoteTimer

const SPEED: float = 100
const JUMP_VELOCITY: float = -200

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var able_to_walk: bool = true

func _physics_process(delta) -> void:
	var was_on_floor: bool = is_on_floor()
	
	var horizontal_movement: float = Input.get_axis("move_left", "move_right");
	var direction: float = 0
	
	if able_to_walk:
		direction = horizontal_movement * (SPEED * speed_multiplier)

	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and (is_on_floor() or !coyote_timer.is_stopped()):
		if able_to_walk:
			velocity.y = JUMP_VELOCITY * jump_multiplier
		else:
			velocity.y = 0
		
	velocity.x = direction
	move_and_slide()
	
	play_animation(direction)
	
	if was_on_floor and !is_on_floor():
		coyote_timer.start()
	
func play_animation(direction: float):
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
			

	
	

