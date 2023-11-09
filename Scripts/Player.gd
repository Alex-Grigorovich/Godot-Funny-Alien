extends KinematicBody2D

var linear_velocity = Vector2(0, 0)
const SPEED = 800
const GRAVITY = 250
const UP = Vector2(0, -1)
const JUMP_SPEED = 2400

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(linear_velocity, UP)


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
	if Input.is_action_just_pressed("jump") and is_on_floor():
		linear_velocity.y -= JUMP_SPEED
