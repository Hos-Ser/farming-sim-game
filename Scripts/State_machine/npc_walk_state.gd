extends NodeState 

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2D: NavigationAgent2D
@export var min_speed := 5.0
@export var max_speed := 10.0

var speed: float

func _ready() -> void:
	call_deferred("character_setup")

func character_setup() -> void:
	await get_tree().physics_frame
	
	set_movement_target()

func set_movement_target() -> void:
	var target_position := NavigationServer2D.map_get_random_point(
		navigation_agent_2D.get_navigation_map(),
		navigation_agent_2D.navigation_layers,
		false
	)
	navigation_agent_2D.target_position = target_position
	speed = randf_range(min_speed, max_speed)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2D.is_navigation_finished():
		set_movement_target()
		return
	
	var target_position := navigation_agent_2D.get_next_path_position()
	var target_direction := character.global_position.direction_to(target_position)
	animated_sprite_2d.flip_h = target_direction.x < 0
	character.velocity = speed * target_direction
	character.move_and_slide()


func _on_next_transitions() -> void:
	if navigation_agent_2D.is_navigation_finished():
		character.velocity = Vector2.ZERO
		transition.emit("Idle")


func _on_enter() -> void:
	animated_sprite_2d.play("walk")


func _on_exit() -> void:
	animated_sprite_2d.stop()
