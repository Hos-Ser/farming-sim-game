class_name PlayerClass
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent

@export var current_tool: PlayerActionType.Actions = PlayerActionType.Actions.None

var last_direction := Vector2.DOWN

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)
	
func on_tool_selected(tool: PlayerActionType.Actions) -> void:
	current_tool = tool
	hit_component.current_tool = tool
