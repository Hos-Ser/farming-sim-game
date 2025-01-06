extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageCopmonent = $DamageComponent

var log_scene := preload("res://scenes/objects/trees/tree_log.tscn")

func _ready() -> void:
	hurt_component.on_hurt.connect(hurting)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func hurting(damage: int) -> void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity", 0.6)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity", 0.0)

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene")
	queue_free()

func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)
