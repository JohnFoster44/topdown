extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

var direction: Vector2

func _on_process(_delta: float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	if Input.is_action_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
		
	if direction == Vector2.UP:
		# idle back
		animated_sprite_2d.play("idle")
	elif direction == Vector2.DOWN:
		# idle front
		animated_sprite_2d.play("idle")
	elif direction == Vector2.LEFT:
		# idle left
		animated_sprite_2d.play("idle")
	elif direction == Vector2.RIGHT:
		# idle right
		animated_sprite_2d.play("idle")
	else:
		# idle front
		animated_sprite_2d.play("idle")


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
