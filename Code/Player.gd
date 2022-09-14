extends KinematicBody2D

var velocity = Vector2.ZERO

var rotation_speed = 0.5
var speed = 0.1
var max_speed = 50

func _ready():
	pass
	
func _physics_process(delta):
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0 , max_speed)
	
	$Exhaust.hide()
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotation_speed
	if Input.is_action_pressed("forward"):
		$Exhaust.show()
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
	position.x = wrapf(position.x, -512, 512)
	position.y = wrapf(position.y, -300, 300)
	
	
	#if position.x > 512:
	#	position.x = -512
	#if position.x < -512:
	#	position.x = 512
	#if position.y > 300:
	#	position.y = -300
	#if position.y < -300:
	#	position.y = 300
