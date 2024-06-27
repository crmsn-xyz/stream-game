extends Control

@onready var game_manager: Game_Manager = $"../../../GameManager"


func _on_resume_button_pressed():
	game_manager.show_pause_menu()


func _on_quit_button_pressed():
	get_tree().quit()

