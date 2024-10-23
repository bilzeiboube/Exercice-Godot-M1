extends Resource

class_name SaveResource

@export var pos_x : int
@export var pos_y : int


#func load_resource():
	#var saved = load("user://exercice_godot_m1/save_game.tres")

func save():
	print("dsf")
	var tmp := SaveResource.new()
	
	tmp.pos_x = pos_x
	tmp.pos_y = pos_y
	
	verify_directory()
	
	ResourceSaver.save(tmp, "user://exercice_godot_m1/save_game.tres")


func verify_directory():
	var data_directory = DirAccess.open("user://")
	if !data_directory.dir_exists("exercice_godot_m1"):
		data_directory.make_dir("exercice_godot_m1")
