extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var death_timer: Timer = $"../Interface/CanvasLayer/DeathBar/HBoxContainer/Control/Timer/Timer"
@onready var player: Player = %Player

func _on_area_2d_body_entered(body):
	if body != player: return
	
	player.able_to_walk = false
	
	death_timer.stop()
	animated_sprite.play("pressed")


func _on_animated_sprite_2d_animation_finished():
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
