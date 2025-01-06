extends Node

var selected_tool : PlayerActionType.Actions = PlayerActionType.Actions.None

signal tool_selected(tool: PlayerActionType.Actions)

func select_tool (tool: PlayerActionType.Actions) -> void:
	tool_selected.emit(tool)
	selected_tool = tool
