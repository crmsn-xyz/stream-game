extends Control

class_name KillTimer

@export var time: float

@onready var timer_label = $CanvasLayer/DeathBar/HBoxContainer/Control/Timer/Label
@onready var timer: Timer  = $CanvasLayer/DeathBar/HBoxContainer/Control/Timer/Timer
@onready var progress_bar: TextureProgressBar = $CanvasLayer/DeathBar/HBoxContainer/Control/ProgressBar

func _ready():
	timer.start(time)
	progress_bar.max_value = time
	progress_bar.value = time
	timer.timeout.connect(_on_timer_timeout)

func _process(delta):
	timer_label.text = "Timer: " + str(round_to_dec(timer.time_left, 1))
	progress_bar.value = timer.time_left

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
	
func _on_timer_timeout():
	get_tree().reload_current_scene()


func _on_apple_collected(add_time):
	timer.start(time)
