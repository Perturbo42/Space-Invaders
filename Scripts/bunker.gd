class_name Bunker extends Area2D
@export var health : int
@onready var sprite = $Sprite2D
func _ready() -> void:
	health = 8
	sprite.frame = 0

func take_damage():
	health -= 1
	if health > 6 :
		sprite.frame = 0
	elif health > 4:
		sprite.frame = 1
	elif health > 2:
		sprite.frame = 2
	elif health > 0:
		sprite.frame = 3
	else:
		queue_free()
