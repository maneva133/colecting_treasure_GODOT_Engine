extends Node3D

# Reference to the Control node
@onready var control = $Control

# References to the labels and timer under the Control node
@onready var coin_label = $Control/Counter
@onready var timer_label = $Control/TimerLabel
@onready var game_timer = $Control/Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("se resetira?")
	reset_game()  # Ensure the game resets when loaded

func reset_game() -> void:
	print("resetiranaa")
	game_timer.reset_timer()
	game_timer.start_timer()
	coin_label.coins = 0
	coin_label.text = "0"

	# Reset all coins in the scene
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.show()
	coin_label.check_win_condition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the labels
	timer_label.text =  str(int(game_timer.time_left))
	if $AudioStreamPlayer3D.playing == false:
		$AudioStreamPlayer3D.play()

# Called when the game is won
func _on_game_won() -> void:
	get_tree().change_scene_to_file("res://control_won.tscn")

# Called when the game is over
func _on_game_over() -> void:
	if get_tree():
		print("YEP")
		get_tree().change_scene_to_file("res://game_over.tscn")
	print("NOPE")


func _on_timer_game_over() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")
