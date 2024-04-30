extends Area2D


var speed = 100
var direction = Vector2(2,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = false
	direction = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	speed * direction
	
