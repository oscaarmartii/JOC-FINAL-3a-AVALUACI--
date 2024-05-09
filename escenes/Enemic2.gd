extends CharacterBody2D


const speed = 30
var zona = null
var atacant = false
var bales_disparades = 0


func _physics_process(delta):
	if zona:
		var canvi = global_position.direction_to(zona.global_position) * speed * delta
		print(canvi)
		velocity = global_position.direction_to(zona.global_position) * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	play_anim()
	
func _on_areapersecucio_body_entered(body):
	zona = body
	
func _on_areapersecucio_body_exited(body):
	zona = null
	
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

func _on_areaatac_body_entered(body):
	zona = body
func _on_areaatac_body_exited(body):
	zona = null

	
func dispara():
	var escena_bala :PackedScene = preload("res://escenes/balas_enemics.tscn")
	var balas:Array = []
	for i in range (1):
		balas.append(escena_bala.instantiate())
		
	for nova_bala in balas:
		nova_bala.global_position = self.global_position
		bales_disparades += 2
		var direccio = global_position.direction_to(Global.Jugador.global_position)
		nova_bala.direccio = global_position.direction_to(Global.Jugador.global_position)
		%balesenemic.add_child(nova_bala)

func _on_timer_timeout():
	dispara()
