extends Button

export var sceneName: String = "Level1"

func _on_Button_pressed():
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
