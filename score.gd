extends Node

var score: int = 0
var highscore: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score(0)
	SignalBus.spike_despawn.connect(increment_score)
	SignalBus.game_over.connect(_on_game_over)

func update_score(new_score: int) -> void:
	var old_score: int = score
	score = new_score
	print("Score is %s and highscore is %s" % [str(score), str(highscore)])
	highscore = max(new_score, highscore)
	if old_score != new_score:
		SignalBus.score_changed.emit(old_score, new_score)

func increment_score() -> void:
	update_score(score + 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_game_over() -> void:
	score = 0
