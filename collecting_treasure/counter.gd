extends Label
signal za_timer
signal game_won
var coins = 0
var total_coins = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(coins) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_coin_collected() -> void:
	coins = coins + 1 
	_ready()
	check_win_condition()  # Check if the player has won


func check_win_condition() -> void:
	print("vleva u won")
	if coins >= total_coins:
		emit_signal("game_won")
	
