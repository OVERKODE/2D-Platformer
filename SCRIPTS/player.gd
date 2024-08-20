extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@export var anim: AnimatedSprite2D
@export var audio_listener: AudioListener2D
@export var player_audio_stream: AudioStreamPlayer2D

func movement(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta		
	var direction := Input.get_axis("move_left", "move_right")
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Animation
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("run_left")
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("run_right")
	if Input.is_action_just_released("move_left"):
		$AnimatedSprite2D.play("idle_left")
	if Input.is_action_just_released("move_right"):
		$AnimatedSprite2D.play("idle_right")
	move_and_slide()
	
func _physics_process(delta: float) -> void:
	movement(delta)
	
	
