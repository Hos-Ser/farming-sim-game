extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var has_key := true

func _on_player_interactable_body_entered(_body: Node2D) -> void:
	animated_sprite_2d.play("opening")
	collision_shape_2d.set_deferred("disabled", true)


func _on_player_interactable_body_exited(_body: Node2D) -> void:
	animated_sprite_2d.play("closing")
	collision_shape_2d.set_deferred("disabled", false)
