extends Control

class_name KillTimer

@export var time: float

@onready var timer_label = $Label
@onready var timer: Timer  = $Timer

func _ready():
	timer.start(time)

func _process(delta):
	timer_label.text = "Timer: " + str(ceil(timer.time_left))

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_apple_collected(add_time):
	timer.start(time)
