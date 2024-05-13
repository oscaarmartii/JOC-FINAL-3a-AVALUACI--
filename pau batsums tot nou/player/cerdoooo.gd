extends CharacterBody2D


var velocidad: int = 100


func _ready():
	$AnimatedSprite2D.play("run")
	velocity.x = velocidad

func _process(delta):
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = -velocidad
	else: #"esta mirando a la derecha"
		velocity.x = velocidad
	move_and_slide()
	
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false




	
