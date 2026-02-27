class_name Laser extends Area2D
signal destroyed
@export var speed : float

func _ready() -> void:
	speed = 300

func _process(delta: float) -> void:
	if global_position.y <= 0:
		destroyed.emit()
		queue_free()
	else:
		global_position.y -= speed * delta
	
