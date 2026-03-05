class_name Swarm extends Node2D
const INVADER = preload("res://Scenes/invader.tscn")
const LASER = preload("res://Scenes/alien_laser.tscn")

@export var row_count : int
@export var col_count : int
var alien_list : Array[Array] = []
var number_of_aliens : int

@export var movement_speed : float
var movement_dir = 1
var left_most : float = 20
var right_most : float = 594
var moving_down : bool
var moved_down_distance = 0
const DOWN_STEP = 50
var target_y

var number_of_lasers : int
var fire_probability : float
var difficulty : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	number_of_lasers = 0
	moving_down = false
	for i in range(col_count):
		alien_list.append([])
		for j in range(row_count):
			var alien = INVADER.instantiate()
			alien.position.x = i * 40
			alien.position.y = j * 50
			alien_list[i].append(alien)
			alien.destroy_alien.connect(alien_destroyed)
			add_child(alien)
	number_of_aliens = row_count * col_count
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	difficulty = 1.0 - (number_of_aliens / float(row_count*col_count))
	fire_probability = 0.004 + difficulty * 0.02
	movement_speed = 20 + difficulty * 80
	#Moving the aliens
	if !moving_down:
		move_aliens(delta)
		alien_end()
	else:
		move_down(delta)
	
	#Aliens shooting lasers
	for i in range(4):
		if number_of_lasers < 3 and randf() < fire_probability:
			var column = randi()%alien_list.size()
			if alien_list[column].size() > 0:
				var shooter = alien_list[column].back()
				fire_laser(shooter)
	pass

func alien_destroyed(alien : Invader):
	for list in alien_list:
		if list.has(alien):
			list.erase(alien)
	
	for i in range(alien_list.size() - 1, -1, -1):
		if alien_list[i].is_empty():
			alien_list.remove_at(i)
	
	number_of_aliens -= 1

func move_aliens(delta:float):
	for list in alien_list:
		for alien in list:
			alien.position.x += movement_dir * movement_speed * delta

func move_down(delta:float):
	var step = movement_speed * delta
	moved_down_distance += step
	
	for list in alien_list:
		for alien in list:
			alien.position.y += step
	
	if moved_down_distance >= DOWN_STEP:
		moving_down = false

func alien_end():
	if alien_list.is_empty():
		return
	
	if movement_dir == 1:
		var right_col = alien_list.back()
		if right_col[0].global_position.x >= right_most:
			movement_dir = -1
			start_moving_down()
			return
	elif movement_dir == -1:
		var left_col = alien_list.front()
		if left_col[0].global_position.x <= left_most:
			movement_dir = 1
			start_moving_down()
			return

func start_moving_down():
	moving_down = true
	moved_down_distance = 0


func fire_laser(alien : Invader):
	var laser = LASER.instantiate()
	number_of_lasers += 1
	laser.alien_laser_destroyed.connect(laser_destroyed)
	laser.global_position = alien.global_position
	get_tree().current_scene.add_child(laser)

func laser_destroyed():
	number_of_lasers -= 1
