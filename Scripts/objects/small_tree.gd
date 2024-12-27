extends StaticBody2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageCopmonent = $DamageComponent


func _ready() -> void:
	hurt_component.on_hurt.connect(hurting)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func hurting(damage: int) -> void:
	print("dmged")
	damage_component.apply_damage(damage)


func on_max_damage_reached() -> void:
	print("max dmg reached")
	queue_free()
