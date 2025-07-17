extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player1Score.text = str(0)
	$Player2Score.text = str(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# TODO find a better condition to trigger score update
	if $Ball.position.x >= 715:
		$Player1.score += 1
		# reset game
	
	if $Ball.position.x <= get_viewport_rect().position.x:
		pass
		# reset game
