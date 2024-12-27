class_name HurtComponent
extends Area2D

@export var tool : PlayerActionType.Actions = PlayerActionType.Actions.None

signal on_hurt


func _on_area_entered(area: Area2D) -> void:
	var hit_copmonent = area as HitComponent
	
	print("heloooooooooooo")
	if tool == hit_copmonent.current_tool:
		on_hurt.emit(hit_copmonent.hit_damage)
#FIXME


#func _on_body_entered(body: Node2D) -> void:
	#var hit_copmonent = body as HitComponent
	#
	#print("heloooooooooooo")
	#if tool == hit_copmonent.current_tool:
		#on_hurt.emit(hit_copmonent.hit_damage)
