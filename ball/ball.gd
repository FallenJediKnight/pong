extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mid_point_x = get_viewport_rect().end.x * 0.5
	var mid_point_y = get_viewport_rect().end.y * 0.5
	position = Vector2(mid_point_x, mid_point_y)
	scale = Vector2(1, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += 300 * delta
	if position.x >= get_viewport_rect().end.x:
		position.x = get_viewport_rect().position.x
