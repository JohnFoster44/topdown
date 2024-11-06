extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	
	if player.player_direction == Vector2.UP:
		# idle up
		animated_sprite_2d.play("idle_up")
	elif player.player_direction == Vector2.DOWN:
		# idle down
		animated_sprite_2d.play("idle_down")
	elif player.player_direction == Vector2.LEFT:
		# idle left
		animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		# idle right
		animated_sprite_2d.play("idle_right")
	else:
		# idle front
		animated_sprite_2d.play("idle_down")


func _on_next_transitions() -> void:
	# get movement input from GameInputEvents.
	GameInputEvents.movement_input()
	# if there is movement input then transition to walk state.
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	# if there is attack input then transition to attack state.
	if player.current_attack == DataTypes.Attacks.Smack:
		transition.emit("Attack")


func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animated_sprite_2d.stop()
