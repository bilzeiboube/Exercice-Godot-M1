class_name Personnage
extends CharacterBody2D

@onready var timer_save_pos = $TimerSavePos

@export var position_load : SaveResource

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var perso

func _ready() -> void:
	var data_directory = DirAccess.open("user://")
	if !data_directory.dir_exists("exercice_godot_m1"):
		print("dsfsffdsfs")
		data_directory.make_dir("exercice_godot_m1")
	
	var saved := load("user://exercice_godot_m1/save_game.tres") as SaveResource
	if saved != null:
		print("qedx")
		position_load = saved
	position.x = position_load.pos_x
	position.y = position_load.pos_y
	
	timer_save_pos.start()
	
	SignalBus.bodyEnter.connect(_on_area_2d_body_entered)
	SignalBus.bodyExit.connect(_on_area_2d_body_exited)

func _physics_process(delta: float) -> void:
	var vitesse=SPEED
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	if Input.is_action_pressed("sprint"):
		vitesse = SPEED*2
	if directionX or  directionY:
		velocity.x = directionX * vitesse
		velocity.y = directionY * vitesse
	else:
		velocity.x = move_toward(velocity.x, 0, vitesse)
		velocity.y = move_toward(velocity.y, 0, vitesse)
	move_and_slide()
	
	if perso!=null:
		$Label.text=perso.joueurTexte


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.get_class())
	
	if body.is_class("CharacterBody2D"):
		$Label.show()
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("oh revoir")
	if body.is_class("CharacterBody2D"):
		$Label.hide()


func _on_timer_save_pos_timeout() -> void:
	position_load.pos_x = position.x
	position_load.pos_y = position.y
	position_load.save()


func _on_button_pressed() -> void:
	var saved := load("user://exercice_godot_m1/save_game.tres") as SaveResource
	if saved != null:
		position.x = position_load.pos_x
		position.y = position_load.pos_y
