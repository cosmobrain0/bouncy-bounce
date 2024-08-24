extends RigidBody2D

var frames_on_ground: int = 0
const frames_for_grounded: int = 2
var jump_velocity: float = -75
var game_over: bool = false
var sprite: AnimatedSprite2D
const standing_still_animation: String = "player-still"
const moving_animation: String = "player-movement"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.spike_touched_ball.connect(_on_spike_touched_ball)
	sprite = get_child(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		get_tree().reload_current_scene()
		return
	if abs(linear_velocity.y) <= 0.00:
		if frames_on_ground < frames_for_grounded: frames_on_ground += 1
	else: frames_on_ground = 0
	var on_ground: bool = frames_on_ground >= frames_for_grounded
	if on_ground && Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector2(0, jump_velocity))
		frames_on_ground = 0
	
	if on_ground && sprite.animation != moving_animation:
		sprite.animation = moving_animation
		print("Set to movement animation")
	elif !on_ground && sprite.animation != standing_still_animation:
		sprite.animation = standing_still_animation
		sprite.play()
		print("Set to still animation")
	

func _on_spike_touched_ball():
	# TODO: health system maybe
	game_over = true
