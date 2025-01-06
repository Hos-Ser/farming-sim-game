extends NodeState 

@export var player: PlayerClass
@export var animated_sprite_2d: AnimatedSprite2D

var speed := 60
var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	direction = GameInputEvents.movement_input()
	
	if direction == Vector2.LEFT:
		animated_sprite_2d.play("moving_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("moving_right")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("moving_front")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("moving_back")

	if direction != Vector2.ZERO:
		player.last_direction = direction
	
	if GameInputEvents.is_use_tool():
		return
	
	player.velocity = direction * speed
	player.move_and_slide()
	

func _on_next_transitions() -> void:
	if !GameInputEvents.is_moving():
		transition.emit("Idle")
		
	if GameInputEvents.is_use_tool():
		match player.current_tool:
			PlayerActionType.Actions.AxeWood: transition.emit("Chopping")
			PlayerActionType.Actions.WaterCrop: transition.emit("Watering")
			PlayerActionType.Actions.TillGround: transition.emit("Tilling")

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
