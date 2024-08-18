extends Node

@onready var pause = $"../pause/pause"

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = !paused
		
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		pause.show()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = false
		pause.hide()
		
func _on_resume_pressed() -> void:
	paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	pause.hide()

func _on_to_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://SCENES/MENU.tscn")
