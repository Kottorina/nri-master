extends Node

@export var exists_unit_manager : Control

const ArmorKey : String = "Armor"
const WeaponKey : String = "Weapon"

var weapon_dict : Dictionary ## Name : Weapon
var armor_dict : Dictionary ## Name : Armor

func UpdateData(data_dict : Dictionary) -> void:
	var weapon_ar : Array = data_dict[WeaponKey]
	for weapon : Weapon in weapon_ar:
		weapon_dict[weapon.Name] = weapon
	
	var armor_ar : Array = data_dict[ArmorKey]
	for armor : Armor in armor_ar:
		armor_dict[armor.Name] = armor

func GenerateEnemy(enemy : Enemy) -> void:
	
	var new_enemy = enemy.duplicate(true)
	
	var enemy_weapon : Weapon = null
	var enemy_armor : Armor = null
	
	if not new_enemy.WeaponKey.is_empty():
		var cur_id = randi_range(0,new_enemy.WeaponKey.size()-1)
		var weapon_name = new_enemy.WeaponKey[cur_id]
		
		if weapon_dict.has(weapon_name):
			enemy_weapon = weapon_dict[weapon_name]
	
	if not new_enemy.ArmorKey.is_empty():
		var cur_id = randi_range(0,new_enemy.ArmorKey.size()-1)
		var armor_name = new_enemy.ArmorKey[cur_id]
		
		if armor_dict.has(armor_name):
			enemy_armor = armor_dict[armor_name]
	
	new_enemy.Strength = str(RollInt(new_enemy.Strength))
	new_enemy.Dexterity = str(RollInt(new_enemy.Dexterity))
	new_enemy.Stamina = str(RollInt(new_enemy.Stamina))
	
	new_enemy.Experience = str(RollInt(new_enemy.Experience))
	
	new_enemy.current_ht = RollInt(new_enemy.Hp)
	
	exists_unit_manager.AddNewUnit(new_enemy,enemy_weapon,enemy_armor)

func RollInt(value: String) -> int:
	var parts := value.split("+")
	
	var result = 0
	
	for part in parts:
		if part.begins_with("d"):
			var dice := int(part.substr(1))
			result += randi_range(1, dice)
		else:
			result += int(part)
	
	return result
