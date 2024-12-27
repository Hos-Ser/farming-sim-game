extends NodeState 

@export var player: PlayerClass
@export var animated_sprite_2d: AnimatedSprite2D


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if player.last_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif player.last_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.last_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.last_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_moving():
		transition.emit("Move")
		
	if GameInputEvents.is_use_tool():
		match player.current_tool:
			PlayerActionType.Actions.AxeWood: transition.emit("Chopping")
			PlayerActionType.Actions.WaterCrop: transition.emit("Watering")
			PlayerActionType.Actions.TillGround: transition.emit("Tilling")
			
func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
