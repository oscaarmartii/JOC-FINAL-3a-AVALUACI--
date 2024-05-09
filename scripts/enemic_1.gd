extends CharacterBody2D


const speed = 30
var zona = null
var atacant = false
var vides = 3

func _physics_process(delta):
	if zona:
		velocity = global_position.direction_to(zona.global_position) * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	play_anim()
	

func _on_area_2d_body_entered(body):
	zona = body
	print("Segueixo %s" % [body.name])

	
func _on_area_2d_body_exited(body):
	zona = null
	print("Deixo de seguir %s" % [body.name])
	
func play_anim():
	var anim = $AnimatedSprite2D
	if vides <= 0:
		anim.play("death")
	if atacant:
		anim.play("attack")
	else:
		if velocity.length() > 0:
			anim.play("run")
		else:
			anim.play("idle")
		
	if velocity.x > 0:
		anim.flip_h = false
	if velocity.x < 0:
		anim.flip_h = true

func _on_area_atac_body_entered(body):
	atacant = true
	print("Ataco %s" % [body.name])

func _on_area_atac_body_exited(body):
	atacant = false
	print("Deixo d'atacar %s" % [body.name])

func mal():
	print("Au!")
	vides = vides -1

