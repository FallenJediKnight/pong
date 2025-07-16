extends "res://player/player.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	position = get_relative_starting_position()
	down_key = "down_player_2"
	up_key = "up_player_2"

func get_relative_starting_position() -> Vector2:
	var scaled_paddle_width = paddle_width * paddle_sprite.scale.x
	var relative_starting_x = get_viewport_rect().end.x - (relative_x_constant * get_viewport_rect().end.x) - scaled_paddle_width
	var relative_starting_y = (relative_y_constant * get_viewport_rect().end.y) - (paddle_height * paddle_sprite.scale.y * 0.5)
	return Vector2(relative_starting_x, relative_starting_y)
