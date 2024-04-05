extends LinkButton

export(String) var scene_to_load

func _on_ReturnToMain_pressed():
	Transition.fast_change_scene(scene_to_load, "Main Menu")

func _on_ToLevelSelect_pressed():
	Transition.fast_change_scene(scene_to_load, "Level Selection")

func _on_ToLevel1_pressed():
	Transition.change_scene(scene_to_load, "Level 1")

func _on_ToLevel2_pressed():
	Transition.change_scene(scene_to_load, "Level 2")

func _on_LinkButton3_pressed():
	Transition.fast_change_scene(scene_to_load, "")
