extends Node

signal spike_touched_ball()
signal spike_despawn()
signal score_changed(old_score: int, new_score: int)
signal game_over()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
