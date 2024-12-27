class_name PlayerClass
extends CharacterBody2D

@export var current_tool: PlayerActionType.Actions = PlayerActionType.Actions.None

var last_direction := Vector2.DOWN
