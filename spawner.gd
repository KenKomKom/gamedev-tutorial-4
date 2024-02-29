extends Node2D

export (PackedScene) var obstacle

var rng = RandomNumberGenerator.new()

func _ready():
	repeat()
	rng.randomize()

func spawn():
	var spawned = obstacle.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + rng.randf_range(-1000, 1000)

	spawned.global_position = spawn_pos

func repeat():
	spawn()
	yield(get_tree().create_timer(1), "timeout")
	repeat()
