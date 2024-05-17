extends CharacterBody2D

const speed = 100
var current_dir = "none"
var bales_disparades = 0
var pots_disparar = true
var atacant = false
var vides = 3

var clickdret:bool = false

func _ready():
	$anim.play("run")
	
	

func _physics_process(delta):
	velocity = Vector2.ZERO
	if !clickdret: 
		if Input.is_action_pressed("ui_right"):
			velocity += Vector2.RIGHT * speed
			$anim.flip_h = false
		if Input.is_action_pressed("ui_left"):
			velocity += Vector2.LEFT * speed
			$anim.flip_h = true
		if Input.is_action_pressed("ui_down"):
			velocity += Vector2.DOWN * speed
			$anim.flip_h = false
		if Input.is_action_pressed("ui_up"):
			velocity += Vector2.UP * speed
			$anim.flip_h = false
		move_and_slide()
	
func play_anim():
	var dir = current_dir
	var anim = $anim
	if atacant:
		anim.play("atack")
	else:
		if velocity.length() > 0:
			anim.play("run")
		else:
			anim.play("idle")


func _process(delta):
	
	
	if velocity.x != 0 :
		$anim.play("run")
	
	elif velocity.y != 0:
		$anim.play("run")
	
	else:
		$anim.play("idle")
	
	
	
	
	

