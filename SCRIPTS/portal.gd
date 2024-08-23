extends Area2D

enum portal_color_enum {purple, green}
enum portal_states {open, idle, close}
@export var portal_color = portal_color_enum.purple
@onready var particles = $CPUParticles2D
var portal_state: portal_states
var change_scene: bool
signal switch_scene


func open() -> void:
	portal_state = portal_states.idle
	if portal_color == portal_color_enum.purple:
		$AnimatedSprite2D.play("purple_open")
		particles.self_modulate = Color(1, 0, 1)
	if portal_color == portal_color_enum.green:
		$AnimatedSprite2D.play("green_open")
		particles.self_modulate = Color(0, 1, 0)
	particles.show()

func _on_activated_area_body_entered(body: Node2D) -> void:
	if portal_state == 0:
		open()

func _ready() -> void:
	particles.hide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "purple_open":
		$AnimatedSprite2D.play("purple_idle")
	elif $AnimatedSprite2D.animation == "green_open":
		$AnimatedSprite2D.play("green_idle")

func set_transpernt():
	$CanvasLayer/ColorRect.self_modulate = Color(1, 1, 1, 1 - $Timer.time_left)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.set_speed(0.0)
		$Timer.start()
		change_scene = true

func _process(delta: float) -> void:
	if change_scene == true:
		set_transpernt()


func _on_timer_timeout() -> void:
	switch_scene.emit()
