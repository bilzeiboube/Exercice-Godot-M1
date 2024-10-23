@tool
extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if get_parent().image!=null:
		var image=get_parent().image.get_image()
		image.resize(128,128)
		texture=ImageTexture.create_from_image(image)
