extends Camera2D

onready var player = get_tree().get_nodes_in_group("Player")[0] 


func _process(_delta) -> void:
	if is_instance_valid(player):
		global_position.x = player.global_position.x
