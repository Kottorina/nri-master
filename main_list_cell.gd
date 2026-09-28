extends MarginContainer

@export var name_ : TextEdit
@export var hp_ : TextEdit
@export var damage_text : TextEdit
@export var strong_ : TextEdit
@export var dexterity_ : TextEdit
@export var endurance_ : TextEdit

@export var damage_but : Button
@export var damage_ : LineEdit

@export var delete_but : Button

func _ready() -> void:
	damage_but.pressed.connect(add_damage)
	delete_but.pressed.connect(delete)

func add_damage() -> void:
	preset.hp -= int(damage_.text)
	update()

func delete() -> void:
	queue_free()

var preset : Presset

func update():
	name_.text = preset.name
	hp_.text = str(preset.hp)
	damage_text.text = str(preset.damage)
	strong_.text = str(preset.Strong)
	dexterity_.text = str(preset.Dexterity)
	endurance_.text = str(preset.Excerpt)
