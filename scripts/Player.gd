extends KinematicBody2D

const UP = Vector2(0, -1)

export var speed: int = 400
export var GRAVITY: int = 1200
export var jump_speed: int = -750

var auto_jump = 0.1

var velocity: Vector2 = Vector2()


func get_input():
	velocity.x = 0
	if (is_on_floor() and Input.is_action_just_pressed("jump")) or (is_on_floor() and auto_jump>0):
		auto_jump=0
		velocity.y = jump_speed
	elif not is_on_floor() and Input.is_action_just_pressed("jump"):
		auto_jump=0.1
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed


func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)


func _process(delta):
	if velocity.y != 0:
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
		if velocity.x > 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		$Animator.play("Idle")
	if auto_jump>0:
		auto_jump-=delta
