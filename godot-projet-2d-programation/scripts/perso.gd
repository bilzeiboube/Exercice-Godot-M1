class_name PNJ
extends StaticBody2D

@export var image :Texture2D
@export var objet : RigidBody2D
@export var isSupprimable=false
@export var objetActiver:Node2D
@export var objetDesactiver:Node2D
@export_category("Narration")
@export_multiline var texte : String
@export_multiline var joueurTexte : String
@export_multiline var texteResolution : String

var final=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	SignalBus.bodyEnter.emit(body)
	if body.is_class("CharacterBody2D"):
		print("oui")
		body.perso=self
	if body.is_class("RigidBody2D") and final==false:
		$Label.show()
		print("yeeppee")
		$Label.text=texte
		print(body)
		print(objet)
		if body==objet:
			$Label.text=texteResolution
			final=true
			if objetActiver:
				objetActiver.activate()
				if isSupprimable:
					body.queue_free()
			if objetDesactiver:
				objetDesactiver.desactivate()
			

		



func _on_area_2d_body_exited(body: Node2D) -> void:
	SignalBus.bodyExit.emit(body)
	if body.is_class("RigidBody2D") and final==false:
		$Label.hide()
