extends Label

@onready var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.score_updated_for_player.connect(update_player_score)

func update_player_score() -> void:
	text = str(player.score)
