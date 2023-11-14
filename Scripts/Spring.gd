extends Area2D


func _ready():
	pass


func _on_Spring_body_entered(body):
	$Sprite.texture = load("res://Graphics/Items/springboardUp.png")
	$AudioStreamPlayer.play()
	body.boost()
	$Timer.start()


func _on_Timer_timeout():
	$Sprite.texture = load("res://Graphics/Items/springboardDown.png")
