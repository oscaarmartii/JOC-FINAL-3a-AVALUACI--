extends CharacterBody2D

const speed = 60
var zona = null
var atacant = false
var vides = 3
var bales_disparades = 0

func _physics_process(delta):
	if atacant:
		velocity = Vector2.ZERO
	elif zona:
		velocity = global_position.direction_to(zona.global_position) * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	play_anim()
	
	
func play_anim():
	var anim = $AnimatedSprite2D
	if vides <= 0:
		anim.play("death")
	if atacant:
		anim.play("attack_01")
	else:
		if velocity.length() > 0:
			anim.play("run")
		else:
			anim.play("idle")
		
	if velocity.x > 0:
		anim.flip_h = false
	if velocity.x < 0:
		anim.flip_h = true
		

func _on_area_persecucio_boss_body_entered(body):
	zona = body
	print("Segueixo %s" % [body.name])
	
func _on_area_persecucio_boss_body_exited(body):
	zona = null
	print("Deixo de seguir %s" % [body.name])


func _on_area_atac_boss_body_entered(body):
	atacant = true
	print("Ataco %s" % [body.name])
	
func _on_area_atac_boss_body_exited(body):
	atacant = false
	print("Deixo d'atacar %s: %s" % [str(body),body.name])
	
	
func dispara():
	var escena_bala :PackedScene = preload("res://escenes/balas_enemics.tscn")
	var balas:Array = []
	for i in range (1):
		balas.append(escena_bala.instantiate())
		
	for nova_bala in balas:
		bales_disparades += 2
		%balesenemic.add_child(nova_bala)
		nova_bala.direccio = global_position.direction_to(Global.Jugador.global_position)
		nova_bala.global_position = self.global_position

func _on_timer_timeout():
	dispara() 
