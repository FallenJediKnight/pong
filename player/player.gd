extends Node2D

# Variables that need to be instantiated in child nodes
var starting_position: Vector2
var down_key: String
var up_key: String

# Constants
const paddle_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = starting_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var arena_lower_boundary = get_viewport_rect().end.y
	var arena_upper_boundary = get_viewport_rect().position.y
	var paddle_sprite: Sprite2D = get_node("PongPaddle")
	var paddle_texture: Texture = paddle_sprite.texture
	var paddle_size = paddle_texture.get_height() * paddle_sprite.scale.y
	
	# Move down on player pressing s button
	if (Input.is_action_pressed(down_key) and position.y + paddle_size < arena_lower_boundary):
		position.y += paddle_speed * delta
	
	# Move up on player pressing w button
	if (Input.is_action_pressed(up_key) and position.y > arena_upper_boundary):
		position.y -= paddle_speed * delta
