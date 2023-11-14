extends KinematicBody2D

var linear_velocity = Vector2(0, 0)
const SPEED = 800
const GRAVITY = 250
const UP = Vector2(0, -1)
const JUMP_SPEED = 2400
const LEVEL_LIMIT = 3000
onready var sprite = $Sprite
var lives = 3
var boost_multiplayer = 1.5

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(linear_velocity, UP)
	animate()

func apply_gravity():
	if position.y > LEVEL_LIMIT:
		end_game()
	if is_on_floor() and linear_velocity.y > 0: 
		linear_velocity.y = 0
	elif is_on_ceiling():
		linear_velocity.y = 1
	else:
		linear_velocity.y += GRAVITY		
		
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
		$JumpSound.play()
	
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
	
func end_game():
	get_tree().change_scene("res://GUI/GameOver.tscn")

func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	lives -= 1
	if lives < 1:
		end_game()
	linear_velocity.y = -JUMP_SPEED * 0.9
	$PainSound.play()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	linear_velocity.y = -JUMP_SPEED * boost_multiplayer
	
