class_name Bunker extends Area2D
@export var health : int
@onready var sprite = $Sprite2D

func _ready() -> void:
	health = 20
	sprite.frame = 0

func take_damage():
	health -= 1
	if health > 15 :
		sprite.frame = 0
	elif health > 10:
		sprite.frame = 1
	elif health > 5:
		sprite.frame = 2
	elif health > 0:
		sprite.frame = 3
	else:
		queue_free()

func destroy_self():
	health = 0
	take_damage()
