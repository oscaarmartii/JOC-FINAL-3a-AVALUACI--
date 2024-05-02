extends CharacterBody2D

const speed = 100
var player = false
var zona = null

func _physics_process(delta):
	if player:
		position += global_position.direction_to(zona.global_position) * speed
	

func _on_area_2d_body_entered(body):
	zona = body
	player = true
	


func _on_area_2d_body_exited(body):
	zona = null
	player = false
