extends CharacterBody2D

var player_flip: bool
var SPEED = 200.0
const JUMP_VELOCITY = -400.0
@export var anim: AnimatedSprite2D
@export var audio_listener: AudioListener2D
@export var player_audio_stream: AudioStreamPlayer2D

func set_speed(value: float):
	SPEED = value
	$AnimatedSprite2D.play("idle_right")
	set_physics_process(false)
	
func movement(delta):
  #gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
  #get direction    
	var direction := Input.get_axis("move_left", "move_right")
  #get player flip
	if direction == -1:
		player_flip = true
	elif direction == 1:
		player_flip = false
  #jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
  #set velocity
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
  # Animation
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("run_right")
	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left"):
		$AnimatedSprite2D.play("idle_right")
	$AnimatedSprite2D.flip_h = player_flip
	move_and_slide()
  
func _physics_process(delta: float) -> void:
	movement(delta)
