class_name Spaceship extends Area2D
@export var speed : float
@export var health: int
var fired : bool
const LASER = preload("res://Scenes/laser.tscn")
signal dead

func _ready() -> void:
	health = 3
	speed = 150.0
	fired = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("left") and global_position.x >= 14:
		position.x -= speed*delta
	elif Input.is_action_pressed("right") and global_position.x <= 600:
		position.x += speed*delta
	
	if Input.is_action_just_pressed("shoot") and !fired:
		shoot()

func shoot():
	var laser = LASER.instantiate()
	fired = true
	laser.destroyed.connect(laser_destroyed)
	laser.global_position = global_position
	get_tree().current_scene.add_child(laser)

func laser_destroyed():
	fired = false

func take_damage():
	health -= 1
	if health <= 0 :
		game_over()

func game_over():
	dead.emit()
	queue_free()
