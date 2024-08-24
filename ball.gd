extends RigidBody2D

var frames_on_ground: int = 0
const frames_for_grounded: int = 2
var jump_velocity: float = -75
var game_over: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.spike_touched_ball.connect(_on_spike_touched_ball)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		get_tree().reload_current_scene()
		return
	if abs(linear_velocity.y) <= 0.00:
		if frames_on_ground < frames_for_grounded: frames_on_ground += 1
	else: frames_on_ground = 0
	if frames_on_ground >= frames_for_grounded && Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector2(0, jump_velocity))
		frames_on_ground = 0

func _on_spike_touched_ball():
	# TODO: health system maybe
	game_over = true
