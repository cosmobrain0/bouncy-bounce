extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.score_changed.connect(_on_score_changed)
	update_text(Score.score, Score.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_text(score: int, highscore: int) -> void:
	text = "Score: %s | Highscore: %s" % [str(score), str(highscore)]

func _on_score_changed(old_score: int, new_score: int) -> void:
	update_text(new_score, Score.highscore)
