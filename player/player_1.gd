extends "res://player/player.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_position = Vector2(64, 160)
	down_key = "down_player_1"
	up_key = "up_player_1"
	super._ready()
