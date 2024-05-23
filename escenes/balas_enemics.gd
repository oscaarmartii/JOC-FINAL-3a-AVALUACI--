extends Area2D

var direccio :=  Vector2.RIGHT
var velocitat := 300


func _process(delta):
	position += direccio * velocitat * delta


func _ready():
	rotate(direccio.angle())

func _on_timer_timeout():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("character"):
		Global.vidas = Global.vidas - 1

