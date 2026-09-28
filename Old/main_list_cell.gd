extends MarginContainer

@export var ConsoleSignal : Signal 

@export_group("unit")
@export var name_ : Label
@export var hp_ : Label
@export var strong_ : Label
@export var dexterity_ : Label
@export var stamina_ : Label
@export var experience_ : Label

@export_group("weapon")

@export var weapon_cont : Container
@export var weapon_del_but : Button

@export var weapon_name_lab: Label
@export var weapon_type_lab: Label
@export var weapon_distance_lab: Label
@export var weapon_radius_effect_lab: Label

@export var get_damage_but : Button

@export_group("armor")

@export var armor_cont : Container
@export var armor_del_but : Button

@export var armor_name_lab: Label

@export var GetDamageResistBut : Button

@export_group("oth")

@export var damage_ : LineEdit
@export var delete_but : Button

func _ready() -> void:
	
	weapon_cont.hide()
	armor_cont.hide()
	
	damage_.text_submitted.connect(add_damage)
	delete_but.pressed.connect(delete)

func add_damage(damage : String) -> void:
	unit.current_ht -= int(damage)
	damage_.text = ""
	hp_.text = str(unit.current_ht)

func delete() -> void:
	queue_free()

var unit : Enemy

func MakeUi( unit_ : Enemy, weapon : Weapon = null, armor : Armor = null):
	
	unit = unit_
	
	name_.text = unit.Name
	hp_.text = str(unit.current_ht)
	strong_.text = unit.Strength
	dexterity_.text = unit.Dexterity
	stamina_.text = unit.Stamina
	experience_.text = unit.Experience
	
	if weapon != null:
		weapon_cont.show()
		
		weapon_name_lab.text = weapon.Name
		weapon_type_lab.text = weapon.Type
		weapon_distance_lab.text = weapon.Distance
		weapon_radius_effect_lab.text = weapon.RadiusEffect
		
		get_damage_but.pressed.connect(RollInt.bind(weapon.Damage))
		weapon_del_but.pressed.connect(weapon_cont.queue_free)
	
	if armor != null:
		armor_cont.show()
		
		armor_name_lab.text = armor.Name
		
		GetDamageResistBut.pressed.connect(RollInt.bind(armor.DamageResist))
		armor_del_but.pressed.connect(armor_cont.queue_free)


func RollInt(value: String) -> int:
	var parts := value.split("+")
	
	var result = 0
	
	for part in parts:
		if part.begins_with("d"):
			var dice := int(part.substr(1))
			result += randi_range(1, dice)
		else:
			result += int(part)
	
	ConsoleSignal.emit("Roll: "+str(result))

	return result
