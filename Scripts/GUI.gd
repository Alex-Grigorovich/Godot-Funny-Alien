extends CanvasLayer


func _ready():
	pass

func add_lives(lives_count):
	while lives_count > $Control/HeartsContainer.get_child_count():
		$Control/HeartsContainer.add_child(load("res://GUI/heart1.tscn").instance())
	
func remove_lives(lives_count):
	if lives_count < $Control/HeartsContainer.get_child_count():
		var heart = $Control/HeartsContainer.get_child(0)
		heart.queue_free()


func add_coins(coins_amount):
	$Control/HeartsContainer3/heart2.text = str(coins_amount)
