extends Control

func _ready():
	var safe_area := DisplayServer.get_display_safe_area()
	var padding := 24

	position = safe_area.position + Vector2i(padding, padding)
	size = safe_area.size - Vector2i(padding * 2, padding * 2)
