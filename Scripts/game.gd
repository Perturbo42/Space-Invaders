class_name Game extends Node2D
@export var score : int = 0
@onready var spaceship: Spaceship = $Spaceship
@onready var swarm: Swarm = $Swarm
@onready var gameover: Control = $Control/GameOver
@onready var score_text: Label = $Control/Score
func _ready() -> void:
	spaceship.dead.connect(game_over)
	gameover.visible = false
	score_text.text = str(score)
	swarm.alien_died.connect(add_score)

func game_over():
	gameover.visible = true

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.

func add_score(points: int):
	score += points
	score_text.text = str(score)
