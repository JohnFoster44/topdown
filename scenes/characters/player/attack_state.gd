# Copy this for more states. Update animation names.

extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass
 

func _on_physics_process(_delta: float) -> void:
	pass


func _on_next_transitions() -> void:
	# if the attack animation is not playing then transition to idle state.
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("attack")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("attack")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("attack")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("attack")
	else:
		animated_sprite_2d.play("attack")

# Stops the animation when the state is exited.
func _on_exit() -> void:
	animated_sprite_2d.stop()
