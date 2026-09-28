extends Control

@export var enemy_list_but : OptionButton
@export var add_but : Button

@export var enemy_generator : Node

func _ready() -> void:
	add_but.pressed.connect(AddNewEnemy)

var id_to_enemy_dict : Dictionary

const EnemyKey : String = "Enemy"

func UpdateData(data_dict : Dictionary) -> void:
	enemy_list_but.clear()
	
	var id = 1
	for enemy : Enemy in data_dict[EnemyKey]:
		enemy_list_but.add_item(enemy.Name,id)
		id_to_enemy_dict[id] = enemy
		id += 1

func AddNewEnemy() -> void:
	var id = enemy_list_but.get_selected_id()
	enemy_generator.GenerateEnemy(id_to_enemy_dict[id])
