extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(640, 160)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Move down on player pressing down button
	if (Input.is_action_pressed("down_player_2") and position.y + 64 < 480):
		position.y += 100 * delta
	
	# Move up on player pressing up button
	if (Input.is_action_pressed("up_player_2") and position.y > 0):
		position.y -= 100 * delta
