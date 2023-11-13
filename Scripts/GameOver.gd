extends Control


func _ready():
	pass


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level.tscn")


func _on_Quit_pressed():
	get_tree().quit()
