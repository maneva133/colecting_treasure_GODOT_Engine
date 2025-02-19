extends Area3D

const ROT_SPEED = 2
signal coinCollected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_coin_color(Color.YELLOW)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body: Node3D) -> void:
	emit_signal("coinCollected")
	queue_free()

func set_coin_color(color: Color) -> void:
	var mesh_instance = $MeshInstance3D
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	mesh_instance.material_override = material
