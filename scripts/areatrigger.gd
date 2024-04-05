extends Area2D

export var sceneName: String = "Level1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_areatrigger_body_entered(body):
	var current_scene = get_tree().get_current_scene().get_name()
	
	if body.get_name() == "Player":
		print(current_scene)
		print(sceneName)
		if current_scene == sceneName:
			Global.lives -=1
			print(Global.lives)
		if (Global.lives == 0):
			Transition.change_scene("gameover", "You Lose")
		else:
			if sceneName=="WinScreen":
				Transition.change_scene(sceneName, "Well Done")
			else:
				Transition.change_scene(sceneName, sceneName)

