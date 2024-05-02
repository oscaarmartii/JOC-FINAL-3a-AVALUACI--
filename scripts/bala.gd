extends Area2D

var direccio =  global_position.direction_to(get_global_mouse_position())
var velocitat := 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direccio * velocitat * delta


@onready var animacio: AnimationPlayer = $AnimationPlayer

func _ready():
	rotate(direccio.angle())
	animacio.play("bala")
	animacio.seek(randf_range(0,2), true)

func _on_timer_timeout():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
