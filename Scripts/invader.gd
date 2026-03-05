class_name Invader extends Area2D
@onready var sprite = $Sprite2D
@export var timer : float
@export var time : float
signal destroy_alien(Invader)
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
	destroy_alien.emit(self)
	queue_free()
	pass

func _on_area_entered(area: Area2D) -> void:
	if area is Bunker:
		area.destroy_self()
	if area is Spaceship:
		area.game_over()
