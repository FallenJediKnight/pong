extends CharacterBody2D

const PADDLE_SPEED = 500
const PADDLE_SCALE = Vector2(0.3, 2.0)
const RELATIVE_X_CONSTANT = 0.05
const RELATIVE_Y_CONSTANT = 0.5

var down_key: String
var up_key: String
var player_number: int
var paddle_sprite: Sprite2D
var paddle_texture: Texture
var paddle_width
var paddle_height
var score: int: set = score_point

signal score_updated_for_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	paddle_sprite = $PongPaddle
	paddle_texture = paddle_sprite.texture
	paddle_height = paddle_texture.get_height()
	paddle_width = paddle_texture.get_width()
	paddle_sprite.scale = PADDLE_SCALE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var arena_lower_boundary = get_viewport_rect().end.y
	var arena_upper_boundary = get_viewport_rect().position.y
	var paddle_size = paddle_height * paddle_sprite.scale.y
	
	var direction = Vector2.ZERO
	# Move down on player pressing s button
	if (Input.is_action_pressed(down_key) and position.y + paddle_size < arena_lower_boundary):
		direction = Vector2.DOWN
	
	# Move up on player pressing w button
	if (Input.is_action_pressed(up_key) and position.y > arena_upper_boundary):
		direction = Vector2.UP
	
	velocity = direction * PADDLE_SPEED
	move_and_slide()

func score_point(value: int) -> void:
	score = value
	score_updated_for_player.emit()
