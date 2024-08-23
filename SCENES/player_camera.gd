extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/ColorRect.self_modulate = Color(0, 0, 0, $Timer.time_left)
