extends RigidBody2D

func _on_Timer_timeout():
	queue_free()

func set_scene_name(scene):
	$losetrigger.sceneName=scene
