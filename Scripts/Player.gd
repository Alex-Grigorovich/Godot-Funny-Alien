extends KinematicBody2D

var linear_velocity = Vector2(0, 0)
const SPEED = 800
const GRAVITY = 250
const UP = Vector2(0, -1)
const JUMP_SPEED = 2400

onready var sprite = $Sprite

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(linear_velocity, UP)
	animate()

func apply_gravity():
	if not is_on_floor():
		linear_velocity.y += GRAVITY
	else:
		linear_velocity.y = 0
		
		
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x = SPEED
	else:
		linear_velocity.x = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		linear_velocity.y -= JUMP_SPEED

func animate():
	if linear_velocity.y < 0:
		sprite.play("Jump")
	elif linear_velocity.x > 0:
		sprite.play("Walk")
		sprite.flip_h = false
	elif linear_velocity.x < 0:
		sprite.play("Walk")
		sprite.flip_h = true
	else:
		sprite.play("Idle")
	
	
