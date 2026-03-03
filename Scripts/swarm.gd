class_name Swarm extends Node2D
const INVADER = preload("res://Scenes/invader.tscn")
@export var row_count : int
@export var col_count : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(row_count):
		for j in range(col_count):
			var alien = INVADER.instantiate()
			alien.position.x = j * 40
			alien.position.y = i * 50
			add_child(alien)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
