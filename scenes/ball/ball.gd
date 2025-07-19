extends RigidBody2D

const BALL_SPEED = 400

var ball_direction
var mid_point_x
var viewport_start_y
var viewport_end_y

signal goal_scored_by_player(n: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(1, 1)
	ball_direction = get_random_starting_direction()
	linear_velocity = ball_direction * BALL_SPEED
	mid_point_x = get_viewport_rect().end.x * 0.5
	viewport_start_y = get_viewport_rect().position.y
	viewport_end_y = get_viewport_rect().end.y
	global_position = Vector2(mid_point_x, randi_range(viewport_start_y, viewport_end_y))

func _physics_process(delta: float) -> void:
	move_and_collide(ball_direction * delta)
	if position.x >= get_viewport_rect().end.x - 5:
		goal_scored_by_player.emit(1)
		reset_ball_position_and_direction()
	
	if position.x <= get_viewport_rect().position.x + 5:
		goal_scored_by_player.emit(2)
		reset_ball_position_and_direction()

func get_random_starting_direction() -> Vector2:
	var x_direction = Vector2(0.5, 1)
	if randi_range(0,1) == 1:
		x_direction = Vector2(-1, -0.5)
	return Vector2(randf_range(x_direction.x, x_direction.y), randf_range(-0.5, 0.5))

func reset_ball_position_and_direction() -> void:
	global_position = Vector2(mid_point_x, randi_range(viewport_start_y, viewport_end_y))
	ball_direction = get_random_starting_direction()
	linear_velocity = ball_direction * BALL_SPEED
