extends Control

##ВРЕМЕННО ТАК, ПОТОМ ЗАМЕНИТЬ
@export var base_pressset : Pressets_list 

@export var option_but : OptionButton
@export var change_but : Button
@export var add_but : Button

@export var change_menu : Control
@export var base_list : Control

var rnd = RandomNumberGenerator.new()

func _ready() -> void:
	add_but.pressed.connect(add_presset)
	change_but.pressed.connect(change_before_add_preset)
	
	update_option_list(base_pressset)

var ind_to_preset : Dictionary

var clear_world : String = "Очистить ересь"
var clear_ind : int

func update_option_list(pr_list : Pressets_list) -> void:
	option_but.clear()
	var ind : int = 0
	for i : Presset in pr_list.pressets_list:
		option_but.add_item(i.name)
		ind_to_preset[ind] = i
		
		ind += 1
	
	option_but.add_item(clear_world)
	clear_ind = ind

func change_before_add_preset() -> void:
	if option_but.selected == clear_ind:
		change_menu.clear_all()
		return
	
	var presset : Presset = ind_to_preset[option_but.selected].duplicate()
	if presset.is_rand == true:
		presset = make_rand(presset)

	
	change_menu.add_for_preset(presset)
	
func make_rand(preset : Presset) -> Presset:
	preset.hp += rnd.randi_range(0,preset.rand_hp)
	preset.Strong += rnd.randi_range(0,preset.Strong_rand)
	preset.Dexterity += rnd.randi_range(0,preset.Dexterity_rand)
	preset.Excerpt += rnd.randi_range(0,preset.Excerpt_rand)
	
	return preset

func add_presset() -> void:
	if option_but.selected == clear_ind:
		return
	
	var presset : Presset = ind_to_preset[option_but.selected].duplicate()
	if presset.is_rand == true:
		presset = make_rand(presset)
	base_list.add_new_unit(presset)
