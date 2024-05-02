extends CharacterBody2D


const speed = 30
var zona = null

func _physics_process(delta):
	if zona:
		var canvi = global_position.direction_to(zona.global_position) * speed * delta
		print(canvi)
		velocity = global_position.direction_to(zona.global_position) * speed
		move_and_slide()
		play_anim()
	

func _on_area_2d_body_entered(body):
	zona = body

	
func _on_area_2d_body_exited(body):
	zona = null
	
func play_anim():
	var anim = $AnimatedSprite2D
	if velocity.length() > 0:
		anim.play("run")
	else:
		anim.play("idle")
		
	if velocity.x > 0:
		anim.flip_h = false
	if velocity.x < 0:
		anim.flip_h = true
