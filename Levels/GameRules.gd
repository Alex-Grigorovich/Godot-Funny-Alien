extends Node

var lives = 3

func _ready():
	pass

func hurt():
	$Player.hurt()
	lives -= 1
	if lives < 1:
		end_game()

func end_game():
	get_tree().change_scene("res://GUI/GameOver.tscn")
