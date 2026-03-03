class_name Invader extends Area2D
@onready var sprite = $Sprite2D
@export var timer : float
@export var time : float

func _ready() -> void:
	timer = 0

func _process(delta: float) -> void:
	timer += delta
	if timer >= time:
		timer = 0
		if sprite.frame == 0 : sprite.frame = 1
		else : sprite.frame = 0
	pass
	

func destroy_self():
	queue_free()
	pass
