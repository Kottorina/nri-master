extends Node

@export var system_option_but : OptionButton
@export var open_but : Button

@export var cvs_path : String

@export var game_ui_container : Control

func _ready() -> void:
	open_but.pressed.connect(OpenCvcData)
	system_option_but.item_selected.connect(OpenCvcData)
	
	## ВРЕМЕННО
	OpenCvcData()

## ВРЕМЕННАЯ РЕАЛИЗАЦИЯ

const WeaponKey : String = "WeaponKey"
const ArmorKey : String = "ArmorKey"

func OpenCvcData() -> void:
	
	if ! system_option_but.get_selected_id() == 0:
		return
	
	var file = FileAccess.open(cvs_path, FileAccess.READ)
	if file == null:
		push_warning("cvs_path data is empty")
		return
	
	var all_row : Array
	while not file.eof_reached():
		all_row.append(file.get_csv_line())
	
	var parse_data_dict : Dictionary
	
	for row in all_row:
		
		var parse_obj : ParseObject
		
		match row[0]:
			"Enemy":
				parse_obj = Enemy.new()
				parse_obj.UiType = "Enemy"
			"Weapon":
				parse_obj = Weapon.new()
				parse_obj.UiType = "Weapon"
			"Armor":
				parse_obj = Armor.new()
				parse_obj.UiType = "Armor"
		
		if parse_obj == null:
			continue
		
		for data_num in range(1,row.size()):
			var key = GetKey(all_row, all_row.find(row),data_num)
			if parse_obj.get(key) != null:
				match key:
					WeaponKey:
						var arr = row[data_num].split(",")
						parse_obj.set(key,arr)
					ArmorKey:
						var arr = row[data_num].split(",")
						parse_obj.set(key,arr)
					_:
						parse_obj.set(key,row[data_num])
		
		SaveParseData(parse_data_dict,parse_obj.UiType,parse_obj)
	
	game_ui_container.UpdateData(parse_data_dict)
	
func SaveParseData(dict : Dictionary, date_key : String, data : Variant) -> void:
	if dict.has(date_key):
		dict[date_key].append(data)
	else:
		dict[date_key] = [data]

const KEY : String = "Key"

func GetKey(big_ar : Array, cur_ind : int,data_num : int) -> String:
	for find_ind in range(cur_ind, -1, -1):
		if big_ar[find_ind][0] == KEY:
			return big_ar[find_ind][data_num]
	return "Fuck"
