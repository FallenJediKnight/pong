extends "res://player/player_score.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../Player2"
	super._ready()
