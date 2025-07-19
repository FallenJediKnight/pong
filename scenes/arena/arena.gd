extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player1Score.text = str(0)
	$Player2Score.text = str(0)
