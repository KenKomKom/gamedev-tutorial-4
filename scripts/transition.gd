extends CanvasLayer

onready var animplyer = $AnimationPlayer
onready var label = $MarginContainer/Label

func change_scene(scene, message):
	visible=true
	animplyer.play("fadeto")
	label.text = message
	yield(animplyer,"animation_finished")
	get_tree().change_scene(str("res://scenes/" + scene + ".tscn"))
	animplyer.play_backwards("fadeto")
	yield(animplyer,"animation_finished")
	
	visible=false

func fast_change_scene(scene, message):
	visible=true
	animplyer.play("fadetoshort")
	label.text = message
	yield(animplyer,"animation_finished")
	get_tree().change_scene(str("res://scenes/" + scene + ".tscn"))
	animplyer.play_backwards("fadetoshort")
	yield(animplyer,"animation_finished")
	
	visible=false
