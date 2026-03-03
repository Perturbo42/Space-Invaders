class_name AlienLaser extends Area2D
signal alien_laser_destroyed
@export var speed : float

func _ready() -> void:
	speed = 300


func _process(delta: float) -> void:
	if global_position.y >= 922:
		destroy_self()
	else:
		global_position.y += speed * delta

func destroy_self():
	alien_laser_destroyed.emit()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area is Bunker:
		destroy_self()
		area.take_damage()
	elif area is Spaceship:
		destroy_self()
		area.take_damage()
	pass # Replace with function body.
