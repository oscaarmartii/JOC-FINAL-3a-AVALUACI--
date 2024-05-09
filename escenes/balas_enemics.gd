extends Area2D

var direccio =  global_position.direction_to(Global.Jugador.global_position)
var velocitat := 300


func _process(delta):
	position += direccio * velocitat * delta


func _ready():
	rotate(direccio.angle())

func _on_timer_timeout():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
