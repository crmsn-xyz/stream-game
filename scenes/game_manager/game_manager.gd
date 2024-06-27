extends Node

class_name Game_Manager


@onready var pause_menu: Control = %Interface/CanvasLayer/PauseMenu

var paused = false

func _ready():
	pause_menu.hide()

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("pause"):
		show_pause_menu()

func show_pause_menu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
