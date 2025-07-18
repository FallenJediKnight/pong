extends RigidBody2D

const BALL_SPEED = 300
const BALL_INITIAL_DIRECTION = Vector2(1 ,0.5)

signal goal_scored_by_player(n: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(1, 1)
	linear_velocity = BALL_INITIAL_DIRECTION * BALL_SPEED
	var mid_point_x = get_viewport_rect().end.x * 0.5
	var mid_point_y = get_viewport_rect().end.y * 0.5
	global_position = Vector2(mid_point_x, mid_point_y)

func _physics_process(delta: float) -> void:
	move_and_collide(BALL_INITIAL_DIRECTION * delta)
	var mid_point_x = get_viewport_rect().end.x * 0.5
	var mid_point_y = get_viewport_rect().end.y * 0.5
	if position.x >= get_viewport_rect().end.x - 5:
		goal_scored_by_player.emit(1)
		global_position = Vector2(mid_point_x, mid_point_y)
	
	if position.x <= get_viewport_rect().position.x + 5:
		goal_scored_by_player.emit(2)
		global_position = Vector2(mid_point_x, mid_point_y)
