extends Node2D

var time_between_spawns: float = 5
var time_since_last_spawn: float
var spawn_position: Vector2 = Vector2(1300, 620)
var spike: PackedScene = preload("res://spike.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_since_last_spawn = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_since_last_spawn += delta
	if time_since_last_spawn > time_between_spawns:
		time_since_last_spawn = 0
		var spike_instance: Area2D = spike.instantiate()
		spike_instance.position = spawn_position
		add_child(spike_instance)
