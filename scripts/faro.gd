extends Node2D

@onready var animacio: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animacio.play("faro")
	animacio.seek(randf_range(0,2), true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
