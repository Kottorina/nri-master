extends MarginContainer

@export var main_cell : PackedScene
@export var base_parent : BoxContainer

func add_new_unit(preset : Presset) -> void:
	var inst = main_cell.instantiate()
	base_parent.add_child(inst)
	
	inst.preset = preset
	inst.update()
