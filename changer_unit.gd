extends Control

@export var name_ : TextEdit
@export var hp_ : TextEdit
@export var damage_ : TextEdit
@export var strong_ : TextEdit
@export var dexterity_ : TextEdit
@export var excerpt : TextEdit

@export var add_but : Button

@export var base_list : Node

func _ready() -> void:
	add_but.pressed.connect(add_to_base_list)

func clear_all() -> void:
	name_.clear()
	hp_.clear()
	damage_.clear()
	strong_.clear()
	dexterity_.clear()
	excerpt.clear()

func add_for_preset(preset : Presset) -> void:
	name_.text = preset.name
	hp_.text = str(preset.hp)
	damage_.text = str(preset.damage)
	strong_.text = str(preset.Strong)
	dexterity_.text = str(preset.Dexterity)
	excerpt.text = str(preset.Excerpt)
	
func add_to_base_list() -> void:
	var new_unit = Presset.new()
	new_unit.name = name_.text
	new_unit.hp = int(hp_.text)
	new_unit.damage = int(damage_.text)
	new_unit.Strong = int(strong_.text)
	new_unit.Dexterity = int(dexterity_.text)
	new_unit.Excerpt = int(excerpt.text)
	
	base_list.add_new_unit(new_unit)
