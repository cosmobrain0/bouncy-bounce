extends Label

var score: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	SignalBus.spike_despawn.connect(_on_spike_despawn)
	update_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_text():
	text = "score: %s" % str(score)

func _on_spike_despawn():
	score += 1
	update_text()
