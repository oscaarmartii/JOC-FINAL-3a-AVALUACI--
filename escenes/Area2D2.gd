extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	pass # Replace with function body.


func _on_body_entered(body):
	$"porta tancada2".visible = true
	$"porta oberta2".visible = false
