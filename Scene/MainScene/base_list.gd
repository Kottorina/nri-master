extends MarginContainer

@export var main_cell : PackedScene
@export var base_parent : BoxContainer

@export var UnitListContainer : Container

const UnitUiScene = preload("uid://c12snpfpnullr")

func AddNewUnit(unit : Enemy, weapon : Weapon = null, armor : Armor = null) -> void:
	var unit_ui_scene = UnitUiScene.instantiate()
	UnitListContainer.add_child(unit_ui_scene)
	
	unit_ui_scene.MakeUi(unit,weapon,armor)
	
