class_name Game extends Node2D
@onready var spaceship: Spaceship = $Spaceship
@onready var gameover: Control = $GameOver
func _ready() -> void:
	spaceship.dead.connect(game_over)
	gameover.visible = false

func game_over():
	gameover.visible = true

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
