class_name Spaceship extends Area2D
@export var speed : float

func _ready() -> void:
	speed = 150.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= speed*delta
	elif Input.is_action_pressed("right"):
		position.x += speed*delta
