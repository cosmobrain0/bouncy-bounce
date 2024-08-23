extends RigidBody2D

var frames_on_ground: int = 0
const frames_for_grounded: int = 2
var jump_velocity: float = -75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abs(linear_velocity.y) <= 0.00:
		if frames_on_ground < frames_for_grounded: frames_on_ground += 1
	else: frames_on_ground = 0
	if frames_on_ground >= frames_for_grounded && Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector2(0, jump_velocity))
		frames_on_ground = 0
	
