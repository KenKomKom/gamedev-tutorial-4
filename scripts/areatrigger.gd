extends Area2D

export var sceneName: String = "Level1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_areatrigger_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))

