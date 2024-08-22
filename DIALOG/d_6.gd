extends Node


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/lvl_1.tscn")
