extends Resource
class_name Presset

@export var name : String 
@export var hp : int 
@export var damage : int ##Он в кубиках, так что так
@export_category("ch")
@export_range(-20,20,1) var Strong : int = 0
@export_range(-20,20,1) var Dexterity : int = 0
@export_range(-20,20,1) var Excerpt : int = 0
@export_category("rand")
@export var is_rand : bool = false
##СЛУЧАЙНЫЕ ИМЕНА ЭТО ПОТОМ
@export var rand_hp : int 
@export_range(0,20,1) var Strong_rand : int = 0
@export_range(0,20,1) var Dexterity_rand : int = 0
@export_range(0,20,1) var Excerpt_rand : int = 0
