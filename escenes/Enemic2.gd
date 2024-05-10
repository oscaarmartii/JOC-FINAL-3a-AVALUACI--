extends CharacterBody2D


const speed = 30
var zona = null
var atacant = false
var bales_disparades = 0


func _physics_process(delta):
	if atacant:
		velocity = Vector2.ZERO
	elif zona:
		var canvi = global_position.direction_to(zona.global_position) * speed * delta
		print(canvi)
		velocity = global_position.direction_to(zona.global_position) * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	play_anim()
	
	
func play_anim():
	var anim = $AnimatedSprite2D
	if atacant:
		anim.play("attack")
		if velocity.length() > 0:
			anim.play("run")
		else:
			anim.play("idle")
		
	if velocity.x > 0:
		anim.flip_h = false
	if velocity.x < 0:
		anim.flip_h = true

func _on_areapersecucio_body_entered(body):
	zona = body
	print("Segueixo %s" % [body.name])

func _on_areapersecucio_body_exited(body):
	zona = null
	print("Deixo de seguir %s" % [body.name])


func _on_areaatac_body_entered(body):
	atacant = true
	print("Ataco %s" % [body.name])

func _on_areaatac_body_exited(body):
	atacant = false
	print("Deixo d'atacar %s: %s" % [str(body),body.name])
