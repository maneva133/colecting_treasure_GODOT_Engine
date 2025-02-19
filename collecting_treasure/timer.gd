extends Timer

# Timer variables
@export var initial_time: int = 60  # 1 minute

# Coin variables
var total_coins: int = 1  # Total coins in the game
var coins_collected: int = 0

# Signals
signal game_won
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready e")
	reset_timer()
	start_timer()

# Reset the timer to the initial time
func reset_timer() -> void:
	wait_time = initial_time
	stop()

# Start the timer
func start_timer() -> void:
	start()

# Stop the timer
func stop_timer() -> void:
	stop()

# Check if all coins are collected
func check_win_condition() -> void:
	print("vleva u won")
	if coins_collected >= total_coins:
		stop_timer()
		game_won.emit()  # Emit the game_won signal

# Check if the timer runs out and not all coins are collected
func check_game_over() -> void:
	if is_stopped() and coins_collected < total_coins:
		emit_signal("game_over")  # Emit the game_over signal

# Called when a coin is collected
func on_coin_collected() -> void:
	coins_collected += 1  # Increment the coins collected
	check_win_condition()

# Called when the timer reaches 0
func _on_timeout() -> void:
	print("MAJAA")
	check_game_over()


func _on_counter_za_timer() -> void:
	stop()
 # Replace with function body.


func _on_counter_game_won() -> void:
	get_tree().change_scene_to_file("res://control_won.tscn") # Replace with function body.
