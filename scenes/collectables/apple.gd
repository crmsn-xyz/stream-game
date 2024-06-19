extends Area2D
signal collected(add_time)
@onready var animated_sprite = $AnimatedSprite2D

func _on_body_entered(body):
	if body != %Player: return
	
	collected.emit(5)
	animated_sprite.play("collected")
	


func _on_animated_sprite_2d_animation_finished():
	queue_free()
