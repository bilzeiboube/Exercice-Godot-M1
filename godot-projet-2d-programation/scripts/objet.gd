extends RigidBody2D
class_name Objet

@export var image :Texture2D
@export var friction :float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_damp=friction
	if visible==false:
		desactivate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
	
func activate():
	show()
	$CollisionShape2D.set_deferred("disabled",false)


func desactivate():
	hide()
	$CollisionShape2D.set_deferred("disabled",true)
