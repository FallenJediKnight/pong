extends Node2D

var starting_position: Vector2
var down_key: String
var up_key: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = starting_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Move down on player pressing s button
	if (Input.is_action_pressed(down_key) and position.y + 64 < 480):
		position.y += 100 * delta
	
	# Move up on player pressing w button
	if (Input.is_action_pressed(up_key) and position.y > 0):
		position.y -= 100 * delta
