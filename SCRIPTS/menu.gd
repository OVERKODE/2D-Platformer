extends Node2D

@onready var portal_anim = $"portal_for_menu/AnimatedSprite2D"

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://DIALOG/D_SCENES/d_1.tscn")

func _process(delta: float) -> void:
	portal_anim.play("portal")
