extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(64, 160)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Move down on player pressing s button
	if (Input.is_action_pressed("down_player_1") and position.y + 64 < 480):
		position.y += 100 * delta
	
	# Move up on player pressing w button
	if (Input.is_action_pressed("up_player_1") and position.y > 0):
		position.y -= 100 * delta
