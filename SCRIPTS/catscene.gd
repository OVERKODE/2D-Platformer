extends Node2D

@onready var p1 = $"p1"
@onready var p2 = $"p2"

var click = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		click += 1
		
	if click == 1:
		p1.hide()
		p2.show()
