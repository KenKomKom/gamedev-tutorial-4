extends LinkButton

export(String) var scene_to_load

func _on_newgame_pressed():
	if Global.lives==0:
		Global.lives=3
	Transition.change_scene(scene_to_load, "Level 1")
