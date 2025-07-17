extends Node2D

# Variables that need to be instantiated in child nodes
var down_key: String
var up_key: String

var paddle_sprite: Sprite2D
var paddle_texture: Texture
var paddle_width
var paddle_height

const paddle_speed = 500
const paddle_scale = Vector2(0.3, 2.0)
const relative_x_constant = 0.05
const relative_y_constant = 0.5

var score: int: set = score_point
signal score_updated_for_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	paddle_sprite = $PongPaddle
	paddle_texture = paddle_sprite.texture
	paddle_height = paddle_texture.get_height()
	paddle_width = paddle_texture.get_width()
	paddle_sprite.scale = paddle_scale

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var arena_lower_boundary = get_viewport_rect().end.y
	var arena_upper_boundary = get_viewport_rect().position.y
	var paddle_size = paddle_height * paddle_sprite.scale.y
	
	# Move down on player pressing s button
	if (Input.is_action_pressed(down_key) and position.y + paddle_size < arena_lower_boundary):
		position.y += paddle_speed * delta
	
	# Move up on player pressing w button
	if (Input.is_action_pressed(up_key) and position.y > arena_upper_boundary):
		position.y -= paddle_speed * delta

func score_point(value: int) -> void:
	score = value
	score_updated_for_player.emit()
