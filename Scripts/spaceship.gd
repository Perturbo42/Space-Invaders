class_name Spaceship extends Area2D
@export var speed : float
var fired : bool
const LASER = preload("res://Scenes/laser.tscn")

func _ready() -> void:
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
