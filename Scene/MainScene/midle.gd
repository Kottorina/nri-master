extends Control

@export var EnemyListManager : Control
@export var EnemyGenerator : Node

func UpdateData(data_dict : Dictionary) -> void:
	
	EnemyListManager.UpdateData(data_dict)
	EnemyGenerator.UpdateData(data_dict)
